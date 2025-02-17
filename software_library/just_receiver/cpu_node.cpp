
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

int main(int argc, char **argv)
{
    
    std::string alt_node_ip_address = "10.1.9.108"; // IP Address of the CPU/Software kernels
    std::string node_ip_address = "10.1.9.109"; // IP Address of the CPU/Software kernels

    // EDIT THESE TO FIT YOUR REQUIREMENTS
    std::string garb_ip = alt_node_ip_address;
    std::string sender_ip = node_ip_address;
    std::string recv_ip = node_ip_address;   // SW Kernel (dS = data_sender)
    std::string fpga_ip = "10.1.9.208";     // HW Kernel

    std::vector<std::string> kern_info;
    kern_info.push_back(garb_ip);
    kern_info.push_back(sender_ip);
    kern_info.push_back(recv_ip);
    kern_info.push_back(fpga_ip);

    std::vector<galapagos::external_driver<T> *> ext_drivers;
    std::unique_ptr<galapagos::node<T>> node_ptr;

    galapagos::net::udp<T> my_udp(
        GALAPAGOS_PORT,
        kern_info,
        node_ip_address);
    ext_drivers.push_back(&my_udp);
    node_ptr = std::make_unique<galapagos::node<T>>(kern_info, node_ip_address, ext_drivers);

    // Adding Kernels (EDIT THESE TO FIT YOUR REQUIREMENT)
    node_ptr->add_kernel(1, data_sender);
    node_ptr->add_kernel(2, data_receiver);
    std::cout << "KERNEL: adding the receiver kernel" << std::endl;
    std::cout << std::endl;
    node_ptr->start();
    node_ptr->end();
}
