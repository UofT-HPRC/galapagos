
#Docker Dev Folder Documentation#
**container_id.txt (host)**
*Container id of project generating container

**create_image.sh (host)**
*Creates image of project generating container from Dockerfile
*Image named galapagos_docker

**create_receiver.sh (host)**
*Creates image of FPGA programming container from Dockerfile_receiver
*Image named galapagos_receiver

**create_sender.sh (host)**
*Creates image of bitstream generating container from Dockerfile_sender
*Image named galapagos_sender

**deploy_container.sh (host)**
*Creates a project generating container from galapagos_docker image

**deploy_receiver.sh (host)**
*Creates a FPGA programming container from galapagos_receiver image

**deploy_sender.sh (host)**
*Creates a bitstream generating container from galapagos_sender image

**Dockerfile (host)**
*Dockerfile for project generating container image

**Dockerfile_receiver (host)**
*Dockerfile for FPGA programming container image

**Dockerfile_sender (host)**
*Dockerfile for bitstream generating container image

**get_container_id.sh (host)**
*Gets the ID of the most recent project generating container and stores it in *container_id.txt*

**get_folders.sh (host)**
*Retrieves the hlsBuild and projects folder from the project generating container onto the host
*Copies the folders into the galapagos/docker directory of the host
*File called: *container_id.txt*

**get_receiver_ip.sh (host)**
*Gets the IP address of the most recent project generating container and stores it in *receiver_ip.txt*
*Gets the ID of the most recent FPGA programming container in the process and stores it in *receiver_id.txt*

**inside_container.sh**
*Setups Vivado
*Creates IP cores and stores it in hlsBuild directory in galapagos
*Creates projects folder for bitstream generation in projects directory in Galapagos
*Files called: *middleware/python/01_setup_and_creating_ip_cores.py, middleware/python/02_middleware.py*

**inside_receiver.sh (receiver)**
*Sets up netcat listening port on the FPGA programming container
*This allows the transfer of the bitstream file from the bitstream generating container once it is done
*Programs FPGA once bitstream file is received
*File called: program_fpga.tcl

**inside_sender.sh (sender)**
*Setups Vivado in the container
*Changes privileges (allows for writing files) of hlsBuild and projects folder which was copied from the host machine
*Generates the bitstream from *middleware/python/03_building_the_project.py*
*Sends the generated bitstream over to the FPGA programming container using *send_to_receiver.sh*
*Files called: *middleware/python/03_building_the_project.py, send_to_receiver.sh*

**program_fpga.tcl (receiver)**
*Tcl script that programs the FPGA with the generated bitstream

**receiver_id.txt (host) **
*Stores container ID of most recent receiver container

**receiver_ip.txt (host)**
*Stores container IP address of most recent receiver container

**sender_id.txt (host)**
*Stores container ID of most recent sender container

**send_folders.sh (host)**
*Sends hlsBuild and projects folders generated from part_1.sh to the sender container

**send_receiver_ip.sh (host)**
*Sends the ip address of the respective receiver container to the sender container

**send_to_receiver.sh (sender)**
*Sends the generated bitstream (under the name shellTop.bit) to the receiver container to program the bitstream onto the FPGA

**setup_license.sh (host)**
*Affects the project generating container
*Sets up the license to create the Vivado project in container

**part_1.sh (host)**
*Executes the entire program generating process
*Deploys a project generating container
*Setups the license for Vivado for that container
*Sets up Vivado inside the container
*Runs the first 2 Jupyter Notebook inside the container
*Gets the hlsBuild and projects folder generated inside the container onto the host machine
*Files called: *deploy_container.sh, setup_license.sh, container_id.sh, inside_container.sh, get_folders.sh*


**part_2.sh (host)**
*Creates a pair of bitstream generating and FPGA programming container
*deploys a sender and receiver container
*Sets up Netcat listening port on the FPGA programming container
*This allows the transfer of the bitstream file from the bitstream generating container once it is done
*Generates the bitstream
*Sends it over to the FPGA programming container
*Files called: *deploy_receiver.sh, get_receiver_ip.sh, inside_receiver.sh, deploy_sender.sh. send_receiver_ip.sh, send_folders.sh*
