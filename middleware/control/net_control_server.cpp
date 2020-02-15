
#include <vector>

#include "net_control_device.hpp"
//#include "argparse.hpp"

#include <boost/program_options.hpp>


int main(int argc, const char **argv){


    int port;
    std::string device_file;

    try
    {
        

        boost::program_options::options_description desc{"Options"};
        desc.add_options()
                ("help,h", "Help screen")
                ("port", boost::program_options::value<int>()->default_value(8892), "port")
                ("device", boost::program_options::value<std::string>()->default_value("/dev/xdma0"), "device");
        boost::program_options::variables_map vm;
        store(parse_command_line(argc, argv, desc), vm);
        notify(vm);

        if (vm.count("help"))
            std::cout << dec << std::endl;
        if(vm.count("port"))
            port = vm["port"].as<int>();
        if(vm.count("device"))
            device_file = vm["device"].as<std::string>();



        std::cout << "port is " << port <<std::endl;
        std::cout << "device file is " << device_file << std::endl;

    }
    catch (const boost::program_options::error &ex)
    {
        std::cerr << ex.what() << '\n';              
    }



    net_control_device device(device_file, port, false);
   

}
