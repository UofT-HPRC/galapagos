
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


#define SEND 0
#define LOOPBACK 1
#define BOTH 2

#define GALAPAGOS_PORT 9000 
#define IP_ADDR_1 "10.211.55.6"
#define IP_ADDR_2 "10.211.55.7"

using namespace boost::program_options;


void parseArgs(int argc, char ** argv, std::string & send_ip_address, std::string & loopback_ip_address, std::string & node_ip_address){
    CommandLine args("A demonstration of the simple command line parser.");
    args.addArgument({"-s", "--send_address"},   &send_ip_address,   "Send IP address");
    args.addArgument({"-l", "--loopback_address"},   &loopback_ip_address,   "Loopback IP address");
    args.addArgument({"-n", "--node_address"},   &node_ip_address,   "Node IP address");


    try {
      args.parse(argc, argv);
    } catch (std::runtime_error const& e) {
      std::cout << e.what() << std::endl;
      return;
    }

    send_ip_address.erase(std::remove_if(send_ip_address.begin(), send_ip_address.end(), ::isspace), send_ip_address.end());
    loopback_ip_address.erase(std::remove_if(loopback_ip_address.begin(), loopback_ip_address.end(), ::isspace), loopback_ip_address.end());
    node_ip_address.erase(std::remove_if(node_ip_address.begin(), node_ip_address.end(), ::isspace), node_ip_address.end());

}



int main(int argc, char** argv){
    std::string send_ip_address;
    std::string loopback_ip_address;
    std::string node_ip_address;

    std::vector <std::string> kern_info;
    parseArgs(argc, argv, send_ip_address, loopback_ip_address, node_ip_address);

    std::cout << "Send_Address: " << send_ip_address << std::endl;
    std::cout << "Loopback_Address: " << loopback_ip_address << std::endl;
    std::cout << "Node_Address: " << node_ip_address << std::endl;

    kern_info.push_back(send_ip_address);
    kern_info.push_back(loopback_ip_address);


    std::vector < galapagos::external_driver<T> * > ext_drivers;
    std::unique_ptr<galapagos::node <T> > node_ptr;
    
    galapagos::net::udp <T> my_udp(
                GALAPAGOS_PORT, 
                kern_info, 
                node_ip_address
            );
    ext_drivers.push_back(&my_udp);
    node_ptr = std::make_unique<galapagos::node <T> >(kern_info, node_ip_address, ext_drivers);


//Adding Kernels    
    if(send_ip_address == node_ip_address){
        node_ptr->add_kernel(0, kern_send);
        std::cout << "adding the send kernel" << std::endl;
    }
    if(loopback_ip_address == node_ip_address){
        node_ptr->add_kernel(1, kern_loopback);
        std::cout << "adding the loopback kernel" << std::endl;
    }

    node_ptr->start();
    node_ptr->end();

}
