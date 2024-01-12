
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
    std::string node_ip_address = "10.1.24.132";
    std::string data_sender_ip = "10.1.24.132";
    std::string multiplierA_ip = "10.1.24.102";
    std::string multiplierB_ip = "10.1.24.103";
    // std::string data_receiver_ip = "10.1.24.104";
    // std::string multiplierA_ip = "10.1.24.132";
    // std::string multiplierB_ip = "10.1.24.132";
    std::string data_receiver_ip = "10.1.24.132";

    std::vector<std::string> kern_info;

    kern_info.push_back(data_sender_ip);
    kern_info.push_back(multiplierA_ip);
    kern_info.push_back(multiplierB_ip);
    kern_info.push_back(data_receiver_ip);

    std::vector<galapagos::external_driver<T> *> ext_drivers;
    std::unique_ptr<galapagos::node<T>> node_ptr;

    galapagos::net::udp<T> my_udp(
        GALAPAGOS_PORT,
        kern_info,
        node_ip_address);
    ext_drivers.push_back(&my_udp);
    node_ptr = std::make_unique<galapagos::node<T>>(kern_info, node_ip_address, ext_drivers);

    // Adding Kernels
    if (data_sender_ip == node_ip_address)
    {
        node_ptr->add_kernel(0, data_sender);
        std::cout << "KERNEL: adding the sender kernel" << std::endl;
    }
    if (multiplierA_ip == node_ip_address)
    {
        node_ptr->add_kernel(1, multiplierA);
        std::cout << "KERNEL: adding the A kernel" << std::endl;
    }
    if (multiplierB_ip == node_ip_address)
    {
        node_ptr->add_kernel(2, multiplierB);
        std::cout << "KERNEL: adding the B kernel" << std::endl;
    }
    if (data_receiver_ip == node_ip_address)
    {
        node_ptr->add_kernel(3, data_receiver);
        std::cout << "KERNEL: adding the receiver kernel" << std::endl;
    }
    std::cout << std::endl;
    node_ptr->start();
    node_ptr->end();
}
