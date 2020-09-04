#  Docker Dev Folder Documentation

### __container_id.txt (host)__
* Container id of project generating container

### __create_image.sh (host)__
* Creates image of project generating container from Dockerfile
* Image named galapagos_docker

### __create_receiver.sh (host)__
* Creates image of FPGA programming container from Dockerfile_receiver
* Image named galapagos_receiver

### __create_sender.sh (host)__
* Creates image of bitstream generating container from Dockerfile_sender
* Image named galapagos_sender

### __deploy_container.sh (host)__
* Creates a project generating container from galapagos_docker image

### __deploy_receiver.sh (host)__
* Creates a FPGA programming container from galapagos_receiver image

### __deploy_sender.sh (host)__
* Creates a bitstream generating container from galapagos_sender image

### __Dockerfile (host)__
* Dockerfile for project generating container image

### __Dockerfile_receiver (host)__
* Dockerfile for FPGA programming container image

### __Dockerfile_sender (host)__
* Dockerfile for bitstream generating container image

### __get_container_id.sh (host)__
* Gets the ID of the most recent project generating container and stores it in _container_id.txt_

### __get_folders.sh (host)__
* Retrieves the hlsBuild and projects folder from the project generating container onto the host
* Copies the folders into the galapagos/docker directory of the host
* File called: _container_id.txt_

### __get_receiver_ip.sh (host)__
* Gets the IP address of the most recent project generating container and stores it in _receiver_ip.txt_
* Gets the ID of the most recent FPGA programming container in the process and stores it in _receiver_id.txt_

### __inside_container.sh__
* Setups Vivado
* Creates IP cores and stores it in hlsBuild directory in galapagos
* Creates projects folder for bitstream generation in projects directory in Galapagos
* Files called: _middleware/python/01_setup_and_creating_ip_cores.py, middleware/python/02_middleware.py_

### __inside_receiver.sh (receiver)__
* Sets up netcat listening port on the FPGA programming container
* This allows the transfer of the bitstream file from the bitstream generating container once it is done
* Programs FPGA once bitstream file is received
* File called: _program_fpga.tcl_

### __inside_sender.sh (sender)__
* Setups Vivado in the container
* Changes privileges (allows for writing files) of hlsBuild and projects folder which was copied from the host machine
* Generates the bitstream from _middleware/python/03_building_the_project.py_
* Sends the generated bitstream over to the FPGA programming container using _send_to_receiver.sh_
* Files called: _middleware/python/03_building_the_project.py, send_to_receiver.sh_

### __program_fpga.tcl (receiver)__
* Tcl script that programs the FPGA with the generated bitstream

### __receiver_id.txt (host)__
* Stores container ID of most recent receiver container

### __receiver_ip.txt (host)__
* Stores container IP address of most recent receiver container

### __sender_id.txt (host)__
* Stores container ID of most recent sender container

### __send_folders.sh (host)__
* Sends hlsBuild and projects folders generated from part_1.sh to the sender container

### __send_receiver_ip.sh (host)__
* Sends the ip address of the respective receiver container to the sender container

### __send_to_receiver.sh (sender)__
* Sends the generated bitstream (under the name shellTop.bit) to the receiver container to program the bitstream onto the FPGA

### __setup_license.sh (host)__
* Affects the project generating container
* Sets up the license to create the Vivado project in container

### __part_1.sh (host)__
* Executes the entire program generating process
* Deploys a project generating container
* Setups the license for Vivado for that container
* Sets up Vivado inside the container
* Runs the first 2 Jupyter Notebook inside the container
* Gets the hlsBuild and projects folder generated inside the container onto the host machine
* Files called: *deploy_container.sh, setup_license.sh, container_id.sh, inside_container.sh, get_folders.sh*


### __part_2.sh (host)__
* Creates a pair of bitstream generating and FPGA programming container
* deploys a sender and receiver container
* Sets up Netcat listening port on the FPGA programming container
* This allows the transfer of the bitstream file from the bitstream generating container once it is done
* Generates the bitstream
* Sends it over to the FPGA programming container
* Files called: *deploy_receiver.sh, get_receiver_ip.sh, inside_receiver.sh, deploy_sender.sh. send_receiver_ip.sh, send_folders.sh*