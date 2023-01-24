# How to Setup the Network/PCIe Control Interface # 

1. Program FPGA Shell
* You can download shell from https://github.com/UofT-HPRC/fpga_virtualization
* Project in fpga_virtualization/shell_solo_net_only/project/shell.xpr
2. Make and Install XDMA Drivers
* Available at https://github.com/sharm294/FPGA-Startup
* `cd FPGA-Startup/xdma/driver`
* `make`
* `sudo insmod xdma.ko`
3. Create docker image
* `source create_image.sh`
4. Deploy container, when prompted to select device, this refers to the name before the last underscore
(example for /dev/xdma0_user, the device name is /dev/xdma0)
* `source deploy_container.sh`
5. Deploy other remote containers without devices


# Use Network control interface #

From last section we deployed a container with the device we wish to manage, as well as other remote devices.

1. On container with FPGA:
* `ifconfig` to see the IP address of container
* `cd galapagos_runtime`
* `./network_server.exe --device <name of device> --port <port> --offset_ctrl <control_offset> --offset_dma <dma_offset>`
2. On remote container: 
* `cd galapagos_runtime`
* `python gmem.py <ip address of fpga container> <port of server on fpga container> <address> <data if writing>`
