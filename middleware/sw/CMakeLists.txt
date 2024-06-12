cmake_minimum_required(VERSION 3.28)
project(kernels_sw)

set(CMAKE_CXX_STANDARD 17)

add_executable(kernels_sw main.cpp
        galapagos_net_udp.hpp)
