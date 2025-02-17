
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
    std::string node_ip_address = "10.1.9.109"; // IP Address of the CPU/Software kernels

    // EDIT THESE TO FIT YOUR REQUIREMENTS
    std::string dS_ip = node_ip_address;   // SW Kernel (dS = data_sender)
    std::string mA_ip = "10.1.9.209";     // HW Kernel (mA = multiplierA)
    std::string mB_ip = "10.1.9.209";     // HW Kernel (mB = multiplierB)
    std::string dR_ip = node_ip_address; // SW Kernel (dR = data_receiver)

    std::vector<std::string> kern_info;
    kern_info.push_back(dS_ip);
    kern_info.push_back(mA_ip);
    kern_info.push_back(mB_ip);
    kern_info.push_back(dR_ip);

    std::vector<galapagos::external_driver<T> *> ext_drivers;
    std::unique_ptr<galapagos::node<T>> node_ptr;

    galapagos::net::udp<T> my_udp(
        GALAPAGOS_PORT,
        kern_info,
        node_ip_address);
    ext_drivers.push_back(&my_udp);
    node_ptr = std::make_unique<galapagos::node<T>>(kern_info, node_ip_address, ext_drivers);

    // Adding Kernels (EDIT THESE TO FIT YOUR REQUIREMENT)
    if (dS_ip == node_ip_address)
    {
        node_ptr->add_kernel(0, data_sender);
        std::cout << "KERNEL: adding the sender kernel" << std::endl;
    }
    if (mA_ip == node_ip_address)
    {
        node_ptr->add_kernel(1, multiplierA);
        std::cout << "KERNEL: adding the A kernel" << std::endl;
    }
    if (mB_ip == node_ip_address)
    {
        node_ptr->add_kernel(2, multiplierB);
        std::cout << "KERNEL: adding the B kernel" << std::endl;
    }
    if (dR_ip == node_ip_address)
    {
        node_ptr->add_kernel(3, data_receiver);
        std::cout << "KERNEL: adding the receiver kernel" << std::endl;
    }
    std::cout << std::endl;
    node_ptr->start();
    node_ptr->end();
}
