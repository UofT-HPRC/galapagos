#include "network_bridge_tcp.hpp"

using namespace hls;

ap_uint<32> ip_table[256];
ap_uint<32> node_table[256];
/**
 * Streams sessionIDs from table that stores open sessionIDs indexed by dest
 *
 * @param t2g_read_dest reads session information from session manager for a given dest
 * @param t2g_read_sid the session id returned by the session manager for a given dest
 * @param t2g_write_dest from tcp_to_galapagos, if there is no session, once we create session we store it at dest
 * @param t2g_write_sid from tcp_to_galapagos, the session id we store at given dest
 * @param g2t_read_dest reads session information from session manager for a given dest
 * @param g2t_read_sid the session id returned by the session manager for a given dest
 * @param g2t_write_dest from galapagos_to_tcp, if there is no session, once we create session we store it at dest
 * @param g2t_write_sid from galapagos_to_tcp, the session id we store at given dest
 */
void sessionID_table_steaming(stream<ap_uint<8>> &t2g_read_dest,
                              stream<ap_uint<16>> &t2g_read_sid,
                              stream<ap_uint<8>> &t2g_write_dest,
                              stream<ap_uint<16>> &t2g_write_sid,
                              stream<ap_uint<8>> &g2t_read_dest,
                              stream<ap_uint<16>> &g2t_read_sid,
                              stream<ap_uint<8>> &g2t_write_dest,
                              stream<ap_uint<16>> &g2t_write_sid)
{
#pragma HLS PIPELINE II = 1
    // static bool init = 0;
    static ap_uint<32> sessionID_table[256] = {
#include "mem.init"
    };

    if (!t2g_read_dest.empty())
        t2g_read_sid.write(sessionID_table[t2g_read_dest.read()]);
    else if (!t2g_write_dest.empty() && !t2g_write_sid.empty())
        sessionID_table[t2g_write_dest.read()] = t2g_write_sid.read();
    else if (!g2t_read_dest.empty())
        g2t_read_sid.write(sessionID_table[g2t_read_dest.read()]);
    else if (!g2t_write_dest.empty() && !g2t_write_sid.empty())
        sessionID_table[g2t_write_dest.read()] = g2t_write_sid.read();
}

/**
 *  Requests to open ports from open_connections
 *
 *
 *
 *
 */

void open_port(stream<ap_uint<16>> &listenPort,
               stream<bool> &listenPortStatus //,
                                              // stream<appNotification>& notifications,
               // stream<appReadRequest>& readRequest
)
{
#pragma HLS PIPELINE II = 1

    static bool listenDone = false;
    static bool waitPortStatus = false;

    appNotification notification;

    // Open/Listen on Port at startup
    if (!listenDone && !waitPortStatus)
    {
#ifndef __SYNTHESIS__
        listenPort.write(11213);
#else
        // listenPort.write(11213);
        listenPort.write(PORT);
#endif
        waitPortStatus = true;
    }
    // Check if listening on Port was successful, otherwise try again
    else if (waitPortStatus && !listenPortStatus.empty())
    {
        listenPortStatus.read(listenDone);
        waitPortStatus = false;
    }

    // Receive notifications, about new data which is available
    // if (!notifications.empty())
    //{
    //	notifications.read(notification);
    //	std::cout << notification.ipAddress << "\t" << notification.dstPort << std::endl;
    //	if (notification.length != 0)
    //	{
    //		readRequest.write(appReadRequest(notification.sessionID, notification.length));
    //	}
    //}
}

/**
 * Bridges TCP core to Galapagos Bridge
 *
 * @param rxMetadata, receives metadata (session id, length) from tcp core
 * @param rxData, once metadata is received, stream of data (tcp payload)
 * @param txGalapagosBridge, outputs axi stream stripped of tcp header, without sidechannels to Galapagos Bridge
 * @param read_dest, streams the source to session manager that checks if there is an open session from this kernel
 * @param read_sid, session id received for read dest
 * @param write_dest, if there is no open connection make a new one at this session id
 * @param write_sid, corresponding session id for the dest above
 */

void tcp_to_galapagos_interface(
    stream<ap_uint<16>> &rxMetaData,
    stream<axiWord> &rxData,
    stream<axiWord> &txGalapagosBridge,
    stream<ap_uint<8>> &read_dest,
    stream<ap_uint<16>> &read_sid,
    stream<ap_uint<8>> &write_dest,
    stream<ap_uint<16>> &write_sid,
    stream<appNotification> &notifications,
    stream<appReadRequest> &readRequest,
    int *state_out,
    int *num_written_out,
    int *size_out,
    ap_uint<1> *incomplete_out

)
{
#pragma HLS PIPELINE II = 1

    // Reads new data from memory and writes it into fifo
    // Read & write metadata only once per package
    static ap_uint<4> ksvs_fsmState = 0;
    appNotification notification;

    static ap_uint<16> sessionID;
    static axiWord currWord;
    static ap_uint<8> dest;
    static ap_uint<8> src;
    static axiWord packet;

    static enum dstate {
        T2G_IDLE = 0,
        T2G_READ_METADATA,
        T2G_WAIT_FOR_HEADER,
        T2G_WAIT_FOR_SESSION_ID,
        T2G_WRITE_DEST,
        T2G_WRITE_HEADER,
        T2G_WRITE_FLIT
    } state = T2G_IDLE;

    static ap_uint<16> size = 0;
    static ap_uint<16> num_written = 0;
    static ap_uint<1> incomplete = 0;

    *state_out = state;
    *incomplete_out = incomplete;
    *num_written_out = num_written;

    switch (state)
    {
    case T2G_IDLE:
    {
        if (!notifications.empty())
        {
            notifications.read(notification);
            std::cout << notification.ipAddress << "\t" << notification.dstPort << std::endl;
            if (notification.length != 0)
            {
                readRequest.write(appReadRequest(notification.sessionID, notification.length));
            }
            state = T2G_READ_METADATA;
            *state_out = state;
        }
        break;
    }
    case T2G_READ_METADATA:
    {

        if (!rxMetaData.empty())
        {
            rxMetaData.read(sessionID);
            if (!incomplete)
                state = T2G_WAIT_FOR_HEADER;
            else
                state = T2G_WRITE_FLIT;
            *state_out = state;
        }
        break;
    }
    case T2G_WAIT_FOR_HEADER:
    {

        if (!rxData.empty())
        {
            currWord = rxData.read();
            src = currWord.data(23, 16);
            // size = currWord.data(15,0) >> 3;
            size = currWord.data(15, 0);
            *size_out = size;
            num_written = 0;
            *num_written_out = num_written;
            read_dest.write(src);
            state = T2G_WAIT_FOR_SESSION_ID;
            *state_out = state;
            // rxMetaData.read();
        }
        break;
    }
    case T2G_WAIT_FOR_SESSION_ID:
    {

        if (!read_sid.empty())
        {
            if (read_sid.read() == EMPTY)
                state = T2G_WRITE_DEST;
            else
                state = T2G_WRITE_HEADER;
            *state_out = state;
        }
        break;
    }
    case T2G_WRITE_DEST:
    {

        write_dest.write(src);
        write_sid.write(sessionID);

        state = T2G_WRITE_HEADER;
        *state_out = state;
        break;
    }

    case T2G_WRITE_HEADER:
    {

        txGalapagosBridge.write(currWord);
        packet.last = 0;
        state = T2G_WRITE_FLIT;
        *state_out = state;
        break;
    }

    case T2G_WRITE_FLIT:
    {
        if (packet.last)
        {
            state = T2G_IDLE;
            *state_out = state;
            if (num_written == size)
                incomplete = 0;
            else
            {
                incomplete = 1; // more of packet to go, on next metadata go straight to writing flit
                if (!rxData.empty())
                {
                    packet = rxData.read();
                    txGalapagosBridge.write(packet);
                    num_written++;
                    *num_written_out = num_written;
                }
            }
            *incomplete_out = incomplete;
        }
        else
        {
            if (num_written == size) // more flits to go in session but from different packet
                state = T2G_WAIT_FOR_HEADER;
            else
            {
                state = T2G_WRITE_FLIT;
                if (!rxData.empty())
                {
                    packet = rxData.read();
                    txGalapagosBridge.write(packet);
                    num_written++;
                    *num_written_out = num_written;
                }
            }
            *state_out = state;
        }
        break;

        ////if (packet.last){
        // if(num_written == size){
        // }
        // if(!rxData.empty()){
        //     packet = rxData.read();
        //     txGalapagosBridge.write(packet);
        //     num_written++;
        //
        // }
    }
    }
}

void open_connections(stream<ap_uint<32>> &ip_fifo, stream<ipTuple> &openConnection, stream<openStatus> &openConStatus,
                      stream<ap_uint<16>> &closeConnection, stream<ap_uint<16>> &sessionID_fifo)
{
#pragma HLS PIPELINE II = 1

    openStatus newConn;
    ipTuple tuple;
    static bool wait_for_connection = 0;

    if (!ip_fifo.empty() && !wait_for_connection)
    {
        tuple.ip_address = ip_fifo.read();
        tuple.ip_port = PORT;
        openConnection.write(tuple);
        wait_for_connection = 1;
    }
    else if (wait_for_connection && !openConStatus.empty())
    {
        openConStatus.read(newConn);
        wait_for_connection = 0;
        sessionID_fifo.write(newConn.sessionID);
    }
}

// void open_connections(
//             stream<ap_uint<32> >& ip_fifo,
//             stream<ipTuple>& openConnection,
//             stream<openStatus>& openConStatus,
//			stream<ap_uint<16> >& closeConnection,
//             stream<ap_uint<16> >& sessionID_fifo
//			)
//{
//	#pragma HLS PIPELINE II=1
//
//
//     static enum dstate {
//                         NEW_CONNECTION=0,
//                         WAIT_FOR_CONNECTION} state = NEW_CONNECTION;
//
//	switch (state)
//	{
//         case NEW_CONNECTION:
//             if(!ip_fifo.empty()){
//	            ipTuple tuple;
//		        tuple.ip_address = ip_fifo.read();
//		        tuple.ip_port = PORT;
//		        openConnection.write(tuple);
//                 state = WAIT_FOR_CONNECTION;
//             }
//             break;
//         case WAIT_FOR_CONNECTION:
//             if(!openConStatus.empty()){
//	            openStatus newConn;
//		        openConStatus.read(newConn);
//		        sessionID_fifo.write(newConn.sessionID);
//                 state=NEW_CONNECTION;
//             }
//             break;
//
//     }
//
// }

/**
 * Bridges Galapagos Bridge to TCP core
 *
 * @param rxGalapagosBridge packet from galapagagos bridge with galapagos header (dest, src, size)
 * @param txStatus displays status to send, will be populated once we write to txMetadata
 * @param txMetadata write metadata (session and length) to core, core will then respond in txStatus
 * @param ip_fifo interface to open_connections that will open a new connection at given IP address
 * @param sessionID_fifo once open_connections creates a new session, it will populate this fifo
 * @param read_dest reads session information from session manager for a given dest
 * @param read_sid the session id returned by the session manager for a given dest
 * @param write_dest if there is no session, once we create session we store it at dest
 * @param write_sid the session id we store at given dest
 */
void galapagos_to_tcp_interface(
    stream<axiWord> &rxGalapagosBridge,
    stream<ap_int<17>> &txStatus,
    stream<appTxMeta> &txMetaData,
    stream<axiWord> &txData,
    stream<ap_uint<32>> &ip_fifo,
    stream<ap_uint<16>> &sessionID_fifo,
    stream<ap_uint<8>> &read_dest,
    stream<ap_uint<16>> &read_sid,
    stream<ap_uint<8>> &write_dest,
    stream<ap_uint<16>> &write_sid,
    ap_uint<8> node_id,
    ap_uint<4> *state_out,
    ap_uint<64> *header_out,
    ap_uint<16> *size_out,
    ap_uint<16> *sessionID_out)
{
#pragma HLS PIPELINE II = 1

    // #pragma HLS INTERFACE ap_ctrl_none port=return
    // #pragma HLS INTERFACE bram port=ip_table
    // #pragma HLS INTERFACE axis  port=sessionID_fifo
    // #pragma HLS INTERFACE axis  port=txMetaData
    // #pragma HLS INTERFACE axis  port=txStatus
    // #pragma HLS INTERFACE axis  port=read_sid
    // #pragma HLS INTERFACE axis  port=rxGalapagosBridge
    // #pragma HLS INTERFACE axis  port=ip_fifo
    // #pragma HLS INTERFACE axis  port=write_dest
    // #pragma HLS INTERFACE axis  port=read_dest
    // #pragma HLS INTERFACE axis  port=write_sid
    // #pragma HLS INTERFACE axis  port=read_sid
    // #pragma HLS INTERFACE axis  port=txData

    static enum dstate {
        G2T_IDLE = 0,
        G2T_READ_SID,
        G2T_WRITE_SID,
        G2T_WRITE_METADATA,
        G2T_READ_TXSTATUS,
        G2T_WRITE_HEADER,
        G2T_STREAM
    } state = G2T_IDLE;

    *state_out = state;

    static ap_uint<16> sessionID;
    static ap_uint<8> dest;
    static axiWord header;
    ap_uint<16> check_empty = 0x03e8;
    axiWord header_raw;

    switch (state)
    {
    case G2T_IDLE:
        if (!rxGalapagosBridge.empty())
        {
            header_raw = rxGalapagosBridge.read();
            header_raw.data.range(23, 16) = node_id;
            header = header_raw;
            dest = header.data.range(31, 24);
            read_dest.write(node_table[dest]);
            state = G2T_READ_SID;
            *header_out = header.data;
        }
        break;
    case G2T_READ_SID:
        if (!read_sid.empty())
        {
            sessionID = read_sid.read();
            if (sessionID == check_empty)
            {
                ip_fifo.write(ip_table[dest]);
                state = G2T_WRITE_SID;
            }
            else
            {
                state = G2T_WRITE_METADATA;
            }
        }
        break;
    case G2T_WRITE_SID:
        if (!sessionID_fifo.empty())
        {
            sessionID = sessionID_fifo.read();
            write_sid.write(sessionID);
            write_dest.write(node_table[dest]);
            state = G2T_WRITE_METADATA;
        }
        break;
    case G2T_WRITE_METADATA:
    {
        ap_uint<16> size;
        appTxMeta txMetaDataWord;
        // size = header.data(15,0);
        size = header.data(15, 0) + 1;
        *sessionID_out = sessionID;
        txMetaDataWord.sessionID = sessionID;
        // txMetaDataWord.length = size;
        txMetaDataWord.length = size << 3;
        *size_out = size << 3;
        txMetaData.write(txMetaDataWord);
        state = G2T_READ_TXSTATUS;
    }
    break;
    case G2T_READ_TXSTATUS:
        if (!txStatus.empty())
        {
            ap_int<17> tx_not_busy = txStatus.read();
            if (tx_not_busy < 0)
            {
                state = G2T_WRITE_METADATA;
            }
            else
            {
                // state = G2T_WRITE_HEADER;
                state = G2T_STREAM;
                txData.write(header);
            }
        }
        break;
    // case G2T_WRITE_HEADER:
    //     txData.write(header);
    //     state = G2T_STREAM;
    //     break;
    case G2T_STREAM:
        if (!rxGalapagosBridge.empty())
        {
            axiWord currWord;
            currWord = rxGalapagosBridge.read();
            txData.write(currWord);
            if (currWord.last)
                state = G2T_IDLE;
        }
        break;
    }
}

void network_bridge_tcp(
    stream<axiWord> &rxGalapagosBridge,
    stream<appTxMeta> &txMetaData,
    stream<ipTuple> &openConnection,
    stream<openStatus> &openConStatus,
    // stream<ap_uint<16> >& closeConnection,
    stream<axiWord> &txData,
    stream<ap_int<17>> &txStatus,
    stream<ap_uint<16>> &listenPort,
    stream<bool> &listenPortStatus,
    stream<appNotification> &notifications,
    stream<appReadRequest> &readRequest,
    stream<ap_uint<16>> &rxMetaData,
    stream<axiWord> &rxData,
    stream<axiWord> &txGalapagosBridge,
    ap_uint<8> node_id,
    ap_uint<4> *state_out,
    ap_uint<64> *header_out,
    ap_uint<16> *size_out,
    ap_uint<16> *sessionID_out,
    int *t2g_state_out,
    int *t2g_num_written_out,
    int *t2g_size_out,
    ap_uint<1> *t2g_incomplete_out

)
{

#pragma HLS INTERFACE ap_ctrl_none port = return
#pragma HLS DATAFLOW
#pragma HLS INTERFACE ap_stable port = node_id
#pragma HLS resource core = AXIS variable = rxGalapagosBridge metadata = "-bus_bundle s_axis_rxGalapagosBridge"
#pragma HLS resource core = AXIS variable = txGalapagosBridge metadata = "-bus_bundle m_axis_txGalapagosBridge"
#pragma HLS resource core = AXIS variable = listenPort metadata = "-bus_bundle m_axis_listen_port"
#pragma HLS resource core = AXIS variable = listenPortStatus metadata = "-bus_bundle m_axis_listen_port_status"
#pragma HLS resource core = AXIS variable = openConnection metadata = "-bus_bundle m_axis_open_connection"
#pragma HLS resource core = AXIS variable = openConStatus metadata = "-bus_bundle s_axis_open_status"
// #pragma HLS resource core=AXIS variable=closeConnection  metadata="-bus_bundle closeConnection"
#pragma HLS resource core = AXIS variable = notifications metadata = "-bus_bundle s_axis_notifications"
#pragma HLS resource core = AXIS variable = readRequest metadata = "-bus_bundle m_axis_read_package"
#pragma HLS resource core = AXIS variable = rxMetaData metadata = "-bus_bundle s_axis_rx_metadata"
#pragma HLS resource core = AXIS variable = rxData metadata = "-bus_bundle s_axis_rx_data"
#pragma HLS resource core = AXIS variable = txMetaData metadata = "-bus_bundle m_axis_tx_metadata"
#pragma HLS resource core = AXIS variable = txData metadata = "-bus_bundle m_axis_tx_data"
#pragma HLS resource core = AXIS variable = txStatus metadata = "-bus_bundle s_axis_tx_status"
    // #pragma HLS resource core=AXIS variable=tcp_status       metadata="-bus_bundle tcp_status"
    // #pragma HLS INTERFACE ap_none port=tcp_status

#pragma HLS DATA_PACK variable = rxGalapagosBridge
#pragma HLS DATA_PACK variable = txGalapagosBridge
#pragma HLS DATA_PACK variable = listenPort
#pragma HLS DATA_PACK variable = listenPortStatus
#pragma HLS DATA_PACK variable = openConnection
#pragma HLS DATA_PACK variable = openConStatus
// #pragma HLS DATA_PACK variable=closeConnection
#pragma HLS DATA_PACK variable = notifications
#pragma HLS DATA_PACK variable = readRequest
#pragma HLS DATA_PACK variable = rxMetaData
#pragma HLS DATA_PACK variable = rxData
#pragma HLS DATA_PACK variable = txMetaData
#pragma HLS DATA_PACK variable = txData
#pragma HLS DATA_PACK variable = txStatus
    // #pragma HLS DATA_PACK variable=tcp_status

    // #pragma HLS resource core=AXI4Stream variable=rxGalapagosBridge metadata="-bus_bundle s_axis_rxGalapagosBridge"
    // #pragma HLS DATA_PACK variable=rxGalapagosBridge
    //
    // #pragma HLS resource core=AXI4Stream variable=txMetaData metadata="-bus_bundle m_axis_tx_metadata"
    // #pragma HLS DATA_PACK variable=txMetaData
    //
    // #pragma HLS resource core=AXI4Stream variable=openConnection metadata="-bus_bundle m_axis_open_connection"
    // #pragma HLS DATA_PACK variable=openConnection
    //
    // #pragma HLS resource core=AXI4Stream variable=openConStatus metadata="-bus_bundle s_axis_open_status"
    // #pragma HLS DATA_PACK variable=openConStatus
    //
    // #pragma HLS resource core=AXI4Stream variable=txData metadata="-bus_bundle m_axis_tx_data"
    // #pragma HLS DATA_PACK variable=txData
    //
    // #pragma HLS resource core=AXI4Stream variable=rxData metadata="-bus_bundle s_axis_rx_data"
    // #pragma HLS DATA_PACK variable=rxData
    //
    // #pragma HLS resource core=AXI4Stream variable=txStatus metadata="-bus_bundle s_axis_tx_status"
    //
    // #pragma HLS resource core=AXI4Stream variable=listenPort metadata="-bus_bundle m_axis_listen_port"
    //
    // #pragma HLS resource core=AXI4Stream variable=listenPortStatus metadata="-bus_bundle s_axis_listen_port_status"
    //
    // #pragma HLS resource core=AXI4Stream variable=notifications metadata="-bus_bundle s_axis_notifications"
    // #pragma HLS DATA_PACK variable=notifications
    //
    // #pragma HLS resource core=AXI4Stream variable=readRequest metadata="-bus_bundle m_axis_read_package"
    // #pragma HLS DATA_PACK variable=readRequest
    //
    // #pragma HLS resource core=AXI4Stream variable=rxMetaData metadata="-bus_bundle s_axis_rx_metadata"
    //
    // #pragma HLS resource core=AXI4Stream variable=txGalapagosBridge metadata="-bus_bundle m_axis_txGalapagosBridge"
    // #pragma HLS DATA_PACK variable=txGalapagosBridge

    // #pragma HLS INTERFACE axis  port=rxGalapagosBridge
    // #pragma HLS INTERFACE axis port=txMetaData bundle="m_axis_rx_metadata"
    // #pragma HLS DATA_PACK variable=txMetaData
    // #pragma HLS INTERFACE axis port=openConnection bundle="m_axis_open_connection"
    // #pragma HLS DATA_PACK variable=openConnection
    // #pragma HLS INTERFACE axis port=openConStatus bundle="s_axis_open_status"
    // #pragma HLS DATA_PACK variable=openConStatus
    ////#pragma HLS INTERFACE axis port=closeConnection bundle="m_axis_close_connection"
    ////#pragma HLS DATA_PACK variable=closeConnection
    // #pragma HLS INTERFACE axis port=txData bundle="m_axis_tx_data"
    ////#pragma HLS DATA_PACK variable=txData
    // #pragma HLS INTERFACE axis port=txStatus bundle="s_axis_tx_status"
    // #pragma HLS DATA_PACK variable=txStatus
    // #pragma HLS INTERFACE axis port=listenPort bundle="m_axis_listen_port"
    // #pragma HLS DATA_PACK variable=listenPort
    // #pragma HLS INTERFACE axis port=listenPortStatus bundle="s_axis_listen_port_status"
    // #pragma HLS DATA_PACK variable=listenPortStatus
    // #pragma HLS INTERFACE axis port=notifications bundle="s_axis_notifications"
    // #pragma HLS DATA_PACK variable=notifications
    // #pragma HLS INTERFACE axis port=readRequest bundle="m_axis_read_package"
    // #pragma HLS DATA_PACK variable=readRequest
    // #pragma HLS INTERFACE axis port=rxMetaData bundle="s_axis_rx_metadata"
    // #pragma HLS DATA_PACK variable=rxMetaData
    // #pragma HLS INTERFACE axis port=rxData bundle="s_axis_rx_data"
    ////#pragma HLS DATA_PACK variable=rxData
    // #pragma HLS INTERFACE axis  port=txGalapagosBridge

#pragma HLS DATAFLOW

#pragma HLS resource core = AXI4Stream variable = listenPort metadata = "-bus_bundle m_axis_listen_port"
#pragma HLS resource core = AXI4Stream variable = listenPortStatus metadata = "-bus_bundle s_axis_listen_port_status"

    // #pragma HLS resource core=AXI4Stream variable=listenPort metadata="-bus_bundle m_axis_listen_port"
    // #pragma HLS resource core=AXI4Stream variable=listenPortStatus metadata="-bus_bundle s_axis_listen_port_status"
    //
    // #pragma HLS resource core=AXI4Stream variable=notifications metadata="-bus_bundle s_axis_notifications"
    // #pragma HLS resource core=AXI4Stream variable=readRequest metadata="-bus_bundle m_axis_read_package"
    // #pragma HLS DATA_PACK variable=notifications
    // #pragma HLS DATA_PACK variable=readRequest
    //
    // #pragma HLS resource core=AXI4Stream variable=txGalapagosBridge
    // #pragma HLS DATA_PACK variable=txGalapagosBridge
    //
    // #pragma HLS resource core=AXI4Stream variable=rxMetaData metadata="-bus_bundle s_axis_rx_metadata"
    // #pragma HLS resource core=AXI4Stream variable=rxData metadata="-bus_bundle s_axis_rx_data"
    // #pragma HLS DATA_PACK variable=rxData
    //
    //	//#pragma HLS PIPELINE II=1
    //
    // #pragma HLS resource core=AXI4Stream variable=openConnection metadata="-bus_bundle m_axis_open_connection"
    // #pragma HLS resource core=AXI4Stream variable=openConStatus metadata="-bus_bundle s_axis_open_status"
    // #pragma HLS DATA_PACK variable=openConnection
    // #pragma HLS DATA_PACK variable=openConStatus
    // #pragma HLS resource core=AXI4Stream variable=closeConnection metadata="-bus_bundle m_axis_close_connection"
    // #pragma HLS resource core=AXI4Stream variable=txMetaData metadata="-bus_bundle m_axis_tx_metadata"
    // #pragma HLS resource core=AXI4Stream variable=txData metadata="-bus_bundle m_axis_tx_data"
    // #pragma HLS resource core=AXI4Stream variable=txStatus metadata="-bus_bundle s_axis_tx_status"
    // #pragma HLS resource core=AXI4Stream variable=rxGalapagosBridge
    // #pragma HLS DATA_PACK variable=txData
    // #pragma HLS DATA_PACK variable=rxGalapagosBridge

    static stream<ap_uint<16>> esa_sessionidFifo("esa_sessionidFifo");
    static stream<ap_uint<16>> esa_lengthFifo("esa_lengthFifo");
    static stream<ap_uint<32>> ip_fifo("ip_fifo");
    static stream<ap_uint<16>> sessionID_fifo("sessionID_fifo");

    static stream<ap_uint<8>> t2g_read_dest;
    static stream<ap_uint<16>> t2g_read_sid;
    static stream<ap_uint<8>> t2g_write_dest;
    static stream<ap_uint<16>> t2g_write_sid;
    static stream<ap_uint<8>> g2t_read_dest;
    static stream<ap_uint<16>> g2t_read_sid;
    static stream<ap_uint<8>> g2t_write_dest;
    static stream<ap_uint<16>> g2t_write_sid;

#pragma HLS stream variable = esa_sessionidFifo depth = 64
#pragma HLS stream variable = esa_lengthFifo depth = 64
#pragma HLS stream variable = ip_fifo depth = 256
#pragma HLS stream variable = sessionID_fifo depth = 256

#pragma HLS stream variable = t2g_read_dest depth = 256
#pragma HLS stream variable = t2g_read_sid depth = 256
#pragma HLS stream variable = t2g_write_dest depth = 256
#pragma HLS stream variable = t2g_write_sid depth = 256
#pragma HLS stream variable = g2t_read_dest depth = 256
#pragma HLS stream variable = g2t_read_sid depth = 256
#pragma HLS stream variable = g2t_write_dest depth = 256
#pragma HLS stream variable = g2t_write_sid depth = 256

    // TODO close connections, currently dummy internal stream

    static stream<ap_uint<16>> closeConnection;

    galapagos_to_tcp_interface(rxGalapagosBridge,
                               txStatus,
                               txMetaData,
                               txData,
                               ip_fifo,
                               sessionID_fifo,
                               g2t_read_dest,
                               g2t_read_sid,
                               g2t_write_dest,
                               g2t_write_sid,
                               node_id,
                               state_out,
                               header_out,
                               size_out,
                               sessionID_out);

    open_connections(ip_fifo,
                     openConnection,
                     openConStatus,
                     closeConnection,
                     sessionID_fifo);

    open_port(listenPort,
              listenPortStatus //,
              // notifications,
              // readRequest
    );

    tcp_to_galapagos_interface(rxMetaData,
                               rxData,
                               txGalapagosBridge,
                               t2g_read_dest,
                               t2g_read_sid,
                               t2g_write_dest,
                               t2g_write_sid,
                               notifications,
                               readRequest,
                               t2g_state_out,
                               t2g_num_written_out,
                               t2g_size_out,
                               t2g_incomplete_out);

    sessionID_table_steaming(t2g_read_dest,
                             t2g_read_sid,
                             t2g_write_dest,
                             t2g_write_sid,
                             g2t_read_dest,
                             g2t_read_sid,
                             g2t_write_dest,
                             g2t_write_sid);
}
