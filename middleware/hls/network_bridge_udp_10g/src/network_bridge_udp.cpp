#include "network_bridge_udp.hpp"

using namespace hls;

ap_uint<32> ip_table[256];

/**
 *  Requests to open ports from open_connections 
 */
void open_port(	stream<ap_uint<16> >& listenPort,
                stream<bool>& listenPortStatus
                )
{
    #pragma HLS PIPELINE II=1

    static bool listenDone = false;
    static bool waitPortStatus = false;

    // Open/Listen on Port at startup
    if (!listenDone && !waitPortStatus){
        #ifndef __SYNTHESIS__
        listenPort.write(11213);
        #else
        listenPort.write(PORT);
        #endif
        waitPortStatus = true;
    }
    
    // Check if listening on Port was successful, otherwise try again
    else if (waitPortStatus && !listenPortStatus.empty()){
        listenPortStatus.read(listenDone);
        waitPortStatus = false;
    }
}



/**
 * Bridges TCP core to Galapagos Bridge
 *
 * @param rxMetadata, receives metadata (session id, length) from udp core 
 * @param rxData, once metadata is received, stream of data (udp payload)
 * @param txGalapagosBridge, outputs axi stream stripped of udp header, without sidechannels to Galapagos Bridge
 */

void udp_to_galapagos_interface(	
    stream<udpMeta>& rxMetadata,
    stream<axiWord>& rxData,
    stream<axiWord>& txGalapagosBridge
)
{
    #pragma HLS PIPELINE II=1

    static axiWord currWord;
    static ap_uint<8> dest;
    static ap_uint<8> src;
    static axiWord packet;

    static enum dstate {
        T2G_WAIT_FOR_HEADER=0,
        T2G_WRITE_FLIT
    } state = T2G_WAIT_FOR_HEADER;

    static ap_uint<16> size = 0;
    static ap_uint<16> num_written = 0;
    static ap_uint<1> incomplete = 0;
    static ap_uint<16> left_to_read = 0;
    ap_uint<16> to_read;

    switch (state)
    {
        case T2G_WAIT_FOR_HEADER:{
            if (!rxData.empty()){
                currWord=rxData.read();
                src = currWord.data(23,16);
                //size = currWord.data(15,0) >> 3;
                size = currWord.data(15,0);
                num_written = 0;
                txGalapagosBridge.write(currWord);
                packet.last = 0;
                state = T2G_WRITE_FLIT;
                //rxMetadata.read();
            }
            break;

        }                                 
        case T2G_WRITE_FLIT:{
            if(num_written == size) // more flits to go in session but from different packet
                state = T2G_WAIT_FOR_HEADER;
            else{
                state = T2G_WRITE_FLIT;
                if(!rxData.empty()){
                    packet = rxData.read();
                    txGalapagosBridge.write(packet);
                    num_written++;

                }
            }
            break;
        }
    }

    if(!rxMetadata.empty()){
        rxMetadata.read();
    }
}

// https://stackoverflow.com/a/4956493
template <typename T>
T swap_endian(T u)
{
    union
    {
        T u;
        unsigned char u8[sizeof(T)];
    } source, dest;

    source.u = u;

    for (size_t k = 0; k < sizeof(T); k++)
        dest.u8[k] = source.u8[sizeof(T) - k - 1];

    return dest.u;
}

/**
 * Bridges Galapagos Bridge to TCP core
 *
 * @param rxGalapagosBridge packet from galapagagos bridge with galapagos header (dest, src, size)
 * @param txMetadata write metadata (session and length) to core
 * @param ip_fifo interface to open_connections that will open a new connection at given IP address 
 * @param sessionID_fifo once open_connections creates a new session, it will populate this fifo 
 * @param read_dest reads session information from session manager for a given dest
 * @param read_sid the session id returned by the session manager for a given dest
 * @param write_dest if there is no session, once we create session we store it at dest
 * @param write_sid the session id we store at given dest
 */
void galapagos_to_udp_interface(
    stream<axiWord> & rxGalapagosBridge,
    stream<udpMeta>& txMetaData,
    stream<axiWord>& txData,
    stream<ap_uint<16> >& txLength,
    ap_uint<8> node_id,
    ap_uint<32> my_ip
)
{
    #pragma HLS PIPELINE II=1

    static enum dstate {
        G2T_IDLE=0,
        G2T_WRITE_METADATA,
        G2T_WRITE_HEADER,
        G2T_STREAM
    } state = G2T_IDLE;

    // static ap_uint<16> sessionID;
    static ap_uint<8> dest;
    static axiWord header;
    // ap_uint<16> check_empty = 0x03e8;
    axiWord header_raw;
    static ap_uint<16> bytes;
    // static udpMeta txMetaDataWord;

    // static ap_uint<32> ip_addr;

    switch(state){
        case G2T_IDLE:
            if(!rxGalapagosBridge.empty()){
                header_raw = rxGalapagosBridge.read();
                header_raw.data.range(23,16) = node_id;
                header = header_raw;
                dest = header.data.range(31,24);
                // ip_addr = ip_table[dest];
                state = G2T_WRITE_METADATA;
            }
            break;
        case G2T_WRITE_METADATA:
            if(!txMetaData.full()){
                udpMeta txMetaDataWord;
                txMetaDataWord.src_port = 11223;
                txMetaDataWord.src_ip = my_ip;
                txMetaDataWord.dst_port = PORT;
                txMetaDataWord.dst_ip = ip_table[dest];
                bytes = (header.data.range(15,0) + 1) << 3;
                txMetaData.write(txMetaDataWord);
                state = G2T_WRITE_HEADER;
            }
            break;
        case G2T_WRITE_HEADER:
            if(!txData.full() && !txLength.full()){
                txData.write(header);
                txLength.write(bytes);
                // txMetaData.write(txMetaDataWord);
                state = G2T_STREAM;
            }
            break;
        case G2T_STREAM:
            if(!rxGalapagosBridge.empty()){
                axiWord currWord;
                currWord = rxGalapagosBridge.read();
                txData.write(currWord);
                if(currWord.last)
                    state = G2T_IDLE;
            }
            break;
    }

    // if(!txLength.empty()){
    //     txLength.read();
    // }

}

void network_bridge_udp_10g(
    stream<ap_uint<16> >& listenPort,
    stream<bool>& listenPortStatus,
    stream<axiWord> &rxGalapagosBridge,
    stream<axiWord> & rxData,
    stream<udpMeta> &rxMetadata,
    stream<axiWord> &txGalapagosBridge,
    stream<axiWord> & txData,
    stream<ap_uint<16> >& txLength,
    stream<udpMeta> &txMetadata,
    ap_uint <8> node_id,
    ap_uint <32> my_ip
)
{

#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS DATAFLOW
#pragma HLS INTERFACE ap_stable port=node_id
#pragma HLS INTERFACE ap_stable port=my_ip
#pragma HLS resource core=AXIS variable=rxGalapagosBridge      metadata="-bus_bundle s_axis_rxGalapagosBridge"
#pragma HLS resource core=AXIS variable=txGalapagosBridge      metadata="-bus_bundle m_axis_txGalapagosBridge"
#pragma HLS resource core=AXIS variable=listenPort       metadata="-bus_bundle m_axis_listen_port"
#pragma HLS resource core=AXIS variable=listenPortStatus metadata="-bus_bundle m_axis_listen_port_status"
#pragma HLS resource core=AXIS variable=rxMetadata       metadata="-bus_bundle s_axis_rx_metadata"
#pragma HLS resource core=AXIS variable=txMetadata       metadata="-bus_bundle m_axis_tx_metadata"
#pragma HLS resource core=AXIS variable=txLength   metadata="-bus_bundle m_axis_tx_length"
#pragma HLS resource core=AXIS variable=rxData   metadata="-bus_bundle m_axis_rx_data"
#pragma HLS resource core=AXIS variable=txData   metadata="-bus_bundle m_axis_tx_data"

#pragma HLS DATA_PACK variable=rxGalapagosBridge
#pragma HLS DATA_PACK variable=txGalapagosBridge
#pragma HLS DATA_PACK variable=rxMetadata
#pragma HLS DATA_PACK variable=txMetadata
#pragma HLS DATA_PACK variable=rxData
#pragma HLS DATA_PACK variable=txData

#pragma HLS DATAFLOW

#pragma HLS resource core=AXI4Stream variable=listenPort metadata="-bus_bundle m_axis_listen_port"
#pragma HLS resource core=AXI4Stream variable=listenPortStatus metadata="-bus_bundle s_axis_listen_port_status"

    galapagos_to_udp_interface(
        rxGalapagosBridge,
        txMetadata,
        txData,
        txLength,
        node_id,
        my_ip
    );
    
    open_port(
        listenPort, 
        listenPortStatus
    );

    udp_to_galapagos_interface(	
        rxMetadata,
        rxData,
        txGalapagosBridge
    );

}
