# Sofware Project

This folder contains the required IP cores as well as the libGalapagos library to compile the software side of the demo project.

## Contents

- This folder is required to compile your software project using libGalapagos.

- The multiplier demo related software project is under `kernels` folder. 

## Prerequisites

You need to install some libraries before compiling the project.
As of our knowledge, only the below dependencies are required (we used `Ubuntu 18.04`): 

- `sudo apt-get install cmake`
- `sudo apt-get install build-essential`
- `sudo apt-get install libboost-all-dev`

If you have any other dependencies missing, take a look at https://github.com/UofT-HPRC/galapagos/blob/master/docker/Dockerfile.

## Multiplier Demo Description:

2 software kernels (Data Sender and Data Receiver), 2 hardware kernels (MultiplierA and MultiplierB).

- The Data Sender sends 3 32-bit integers to MultiplierA formatted as:  
![Format of Sender's data](/fig/sender.jpg)  
- MultiplierA multiplies numberA and numberB, and sends the result of A\*B and numberC to MultiplierB.  
![Format of MultiplierA's data](/fig/multiplierA.jpg)  
- MultiplierB multiplies the result of A\*B and numberC and sends the final value back to software kernel Data Receiver.  
- Data Receiver receives the result of A\*B\*C and prints it using std::cout.  

## How to Compile

1. Change your directory to `multiplier_demo`.  
I used `g++-8`, which maybe you have different versions; so if you have other versions like `g++-9`, don't forget to modify it in `Makefile`.

2. In `cpu_node.cpp`, you have to modify the kernels' ip addresses based on your ip addresses.  
Take into consideration that the first and last kernels are on CPU and the other two are on FPGA.  
Also, you might need to modify the port number your CPU is listening to in order to get the UDP packets from outside. (it is 9000 for this demo)  
To do so, you have to change the number for `GALAPAGOS_PORT`.  
To figure out which port you have to listen to, you can use either `Wireshark` or `Tshark` to observe the packets coming from FPGA.

P.S.: Any questions regarding the communication? Clark is the best guy to help you figure this out.

You can also find the code related to the kernels in `kern.cpp` file. 

3. To compile the project, run `make cpu`, and it should create a `kern` executable file for you.

4. Eventually, run your project by `./kern`. 
You have to program your board before running your software project.

## How to Create Your Project

Take a look at either `hello_world_udp` or `multiplier_demo` to find out how to write your kernels on software.  
You only need to create your own `cpu_node.cpp`, `kern.cpp`, `kern.hpp` files to have your software project.  
Other than that, you are okay to compile and enjoy it. 
