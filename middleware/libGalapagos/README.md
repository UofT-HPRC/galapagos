# Prerequisites

1. Install boost 1.66. Refer to https://github.com/UofT-HPRC/galapagos/blob/master/docker/Dockerfile
To install do the following:
```
wget http://downloads.sourceforge.net/project/boost/boost/1.66.0/boost_1_66_0.tar.gz
tar xfz boost_1_66_0.tar.gz 
cd boost_1_66_0 
./bootstrap.sh --prefix=/usr/local  --with-libraries=system,thread,log,program_options  
sudo ./b2 install 

```

2. Clone spdlog into util directory if you want logging (not necessary)

# Running Example
1. Go to hello_world_udp
2. `make cpu`
3. Run 
```
./hello_world --send_address <ip address to run kern send> --node_address <ip address of this kernel> --loopback_address <ip address that loopback kernel is on>
```
They can be the same IP address, if thats the case both kernels would run on the same CPU.
4. Kernels described in kerns.cpp


 
