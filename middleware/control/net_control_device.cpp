#include "net_control_device.hpp"


net_control_device::net_control_device(std::string device_name, int port, bool _logging, int offset_ctrl, int offset_dma, bool _jtag, std::string _program_tcl)
:dev (device_name, _logging, offset_ctrl, offset_dma),
acceptor_(io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), port))
{
    io_context.run();

    logging = _logging;
    jtag = _jtag;
    program_tcl = _program_tcl;


    for(;;)
    {
    	boost::asio::ip::tcp::socket socket(io_context);
    	acceptor_.accept(socket);
        int message[NUM_INT_PER_MESSAGE];
        boost::system::error_code error;
        size_t length;
        length = socket.read_some(boost::asio::buffer((char *)message, sizeof(int)*NUM_INT_PER_MESSAGE), error);
        if(message[CMD] == SET){
            char * data = (char *)malloc(message[SIZE]);
            length = socket.read_some(boost::asio::buffer((char *)data, sizeof(int)*NUM_INT_PER_MESSAGE), error);
            off_t target = message[ADDR];
            if(logging){
                BOOST_LOG_TRIVIAL(trace) << "SET AT ADDR:" << message[ADDR] << " DATA:" << ((int *)data)[0] ;
            }
            dev.dev_write_axil(data, (off_t)message[ADDR], (size_t)message[SIZE]);
        }
        else if(message[CMD] == GET){
            char * data = (char *)dev.dev_read_axil((off_t)message[ADDR], (size_t) message[SIZE]);
            boost::asio::write(socket, boost::asio::buffer(data, (size_t)message[SIZE]));
            if(logging){
                BOOST_LOG_TRIVIAL(trace) << "GET AT ADDR:" << message[ADDR] << " DATA:" << ((int *)data)[0] ;
            }
        }
        else if(message[CMD] == SET_BIN){
            int bytes_written = 0;
            while(bytes_written < message[SIZE]){
            
                char * data = (char *)malloc(message[SIZE]);
                length = socket.read_some(boost::asio::buffer((char *)data, sizeof(int)*NUM_INT_PER_MESSAGE), error);
                off_t target = message[ADDR];
                if(logging){
                    BOOST_LOG_TRIVIAL(trace) << "SET_BIN AT ADDR:" << message[ADDR];
                }
                dev.dev_write_dma(data, (off_t)message[ADDR] + bytes_written, (size_t)message[SIZE]);
                bytes_written+=length;

            }
        }
        else if(message[CMD] == GET_BIN){
            char * data = (char *)dev.dev_read_dma((off_t)message[ADDR], (size_t) message[SIZE]);
            boost::asio::write(socket, boost::asio::buffer(data, (size_t)message[SIZE]));
            if(logging){
                BOOST_LOG_TRIVIAL(trace) << "GET_BIN AT ADDR:" << message[ADDR];
            }
        }
        else if(message[CMD] == PROGRAM_BITSTREAM){
            if(jtag){
                char * data = (char *)malloc(message[SIZE]);
                length = socket.read_some(boost::asio::buffer((char *)data, sizeof(int)*NUM_INT_PER_MESSAGE), error);
                auto myfile = std::fstream("prog.bit", std::ios::out | std::ios::binary);
                myfile.write((char *)data, length);
                myfile.close();
                std::string cmd = std::string("vivado -mode batch --source ") + program_tcl + std::string(" -tclargs --bitstream prog.bit") + 
                system(cmd.c_str());
            }


        }

        socket.close(error);

    }
}
