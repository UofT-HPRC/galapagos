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
1. Go to matrix_multiply
2. `make`
3. Run 
```
./hello_world
```
This example instantiates kernel 0 on the software side, and it sends messages to kernel 1.

4. Kernels described in kerns.cpp
5. in cpu_node.cpp,

set kernel id with `kern_info.push_back(ip_address);`

add kernels to the software side using `node_ptr->add_kernel(id, kernel_name);`

 
