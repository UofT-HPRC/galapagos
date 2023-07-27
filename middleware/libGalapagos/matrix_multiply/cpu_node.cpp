
#define INTERFACE_100G

#include <string>
#include <math.h>
#include <thread>
#include <chrono>
#include <boost/program_options.hpp>

#include "../util/CommandLine.hpp"
#include "../galapagos_node.hpp"
#include "../galapagos_net_udp.hpp"
#include "kern.hpp"


#define GALAPAGOS_PORT 9000 

using namespace boost::program_options;

int main(int argc, char** argv){
    std::string cpu_ip_address = "10.10.14.132";
    std::string fpga_ip_address = "10.1.7.8";

    std::vector <std::string> kern_info;

    std::cout << "CPU_Address: " << cpu_ip_address << std::endl;
    std::cout << "FPGA_Address: " << fpga_ip_address << std::endl;


    kern_info.push_back(cpu_ip_address); // 0
    kern_info.push_back(fpga_ip_address); // 1

#if LOG_LEVEL > 0
    auto my_logger = spdlog::basic_logger_mt("basic_logger", "test.log");
#endif

    
    std::vector < galapagos::external_driver<T> * > ext_drivers;

#if LOG_LEVEL > 0
    galapagos::net::udp <T> my_udp(GALAPAGOS_PORT, kern_info, cpu_ip_address, my_logger);
#else
    galapagos::net::udp <T> my_udp(GALAPAGOS_PORT, kern_info, cpu_ip_address);
#endif

    std::unique_ptr<galapagos::node <T> > node_ptr;

    ext_drivers.push_back(&my_udp);

#if LOG_LEVEL > 0
    node_ptr = std::make_unique<galapagos::node <T> >(kern_info, cpu_ip_address, ext_drivers, my_logger);
#else
    node_ptr = std::make_unique<galapagos::node <T> >(kern_info, cpu_ip_address, ext_drivers);
#endif

    // Adding Kernels    
    std::cout << "adding cpu kernels" << std::endl;
    node_ptr->add_kernel(0, kern_0);
    node_ptr->start();
    node_ptr->end();
     

    return 0;

}
