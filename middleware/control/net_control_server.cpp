
#include <vector>

#include "net_control_device.hpp"
//#include "argparse.hpp"

#include <boost/program_options.hpp>


int main(int argc, const char **argv){


    int port;
    std::string device_file;
    int offset_ctrl;
    int offset_dma;
    bool logging;

    try
    {
        

        boost::program_options::options_description desc{"Options"};
        desc.add_options()
                ("help,h", "Help screen")
                ("port", boost::program_options::value<int>()->default_value(8892), "port")
                ("offset_ctrl", boost::program_options::value<int>()->default_value(0), "offset_ctrl")
                ("offset_dma", boost::program_options::value<int>()->default_value(0), "offset_dma")
                ("device", boost::program_options::value<std::string>()->default_value("/dev/xdma0"), "device")
                ("logging", boost::program_options::value<bool>()->default_value(false), "logging");
        boost::program_options::variables_map vm;
        store(parse_command_line(argc, argv, desc), vm);
        notify(vm);

        if (vm.count("help"))
            std::cout << dec << std::endl;
        if(vm.count("port"))
            port = vm["port"].as<int>();
        if(vm.count("device"))
            device_file = vm["device"].as<std::string>();
        if(vm.count("offset_dma"))
            offset_dma = vm["offset_dma"].as<int>();
        if(vm.count("offset_ctl"))
            offset_ctrl = vm["offset_ctrl"].as<int>();
        if(vm.count("logging"))
            logging = vm["logging"].as<bool>();



        std::cout << "port is " << port <<std::endl;
        std::cout << "device file is " << device_file << std::endl;

    }
    catch (const boost::program_options::error &ex)
    {
        std::cerr << ex.what() << '\n';              
    }



    net_control_device device(device_file, port, logging, offset_ctrl, offset_dma);
   

}
