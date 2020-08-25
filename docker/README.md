# Docker Deployment instructions

## Prerequisites
0. Please install Vivado (one of 2017.4, 2018.1, 2018.2, 2018.3) onto your host machine.

## Create Image and Deploy Container to Generate a Galapagos Project
1. First run `source create_image.sh`. This creates your docker image.
2. Next run `startup.sh`. <br/>. You will be asked for your local vivado install. For example if you have Vivado installed in `/opt/Xilinx/Vivado/2018.1` please provide `/opt/Xilinx` as the path. You will also be asked to set up the license on the container. This will generate the galapagos project in the container, while running the commands from the host machine.
3. To view containers `docker container ls`
4. To attach to the container to view the create project, run `docker attach <container name>`

## Create Images and Deploy Containers to Generate a Bistream and Program the FPGAs
5. Run `source create_sender.sh` and `source create_receiver.sh` to create the docker images.
6. Navigate to the galapagos/projects directory on your host machine. `~/galapagos/projects`
7. Run `createCluster.sh` to generate a bitstream in the sender container which will then be programmed onto its respective FPGA on the corresponding receiver container.

## Run Jupyter Notebook (Optional)
8. If you would like to run the Jupyter Notebook to create the Galapagos project instead of the fully automated version, attach to the container by running `docker attach <container name>`
9. Navigate to galapagos directory. `cd /home/user/galapagos`
10. Run the notebook setup script. `source run_jupyter.sh`.
11. Copy/paste the link into your browser. Run through the three notebooks, they are numbered with `<number>_<notebook name>` starting with number 0.

