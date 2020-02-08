#include "net_control_device.hpp"

net_control_device::net_control_device(std::string device_name, int port, bool axi_full)
:dev (device_name, axi_full),
acceptor_(io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), port))
{
    io_context.run();

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
            dev.dev_write(data, (off_t)message[ADDR], (size_t)message[SIZE]);
        }
        else if(message[CMD] == GET){
            char * data = (char *)dev.dev_read((off_t)message[ADDR], (size_t) message[SIZE]);
            boost::asio::write(socket, boost::asio::buffer(data, (size_t)message[SIZE]));
        }
        socket.close(error);

    }
}
