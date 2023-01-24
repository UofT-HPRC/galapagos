# Docker Deployment instructions

## Prerequisites
0. Please install Vivado (one of 2017.4, 2018.1, 2018.2, 2018.3) onto your host machine.


## Create Image and Deploy Contianer

1. First run `source create_image.sh`. This creates your docker image.
2. Next run `source deploy_container.sh`. <br/>. You will be asked for your local vivado install. For example if you have Vivado installed in `/opt/Xilinx/Vivado/2018.1` please provide `/opt/Xilinx` as the path.
3. To view containers `docker container ls`
4. Next run `source setup_license.sh`. <br />. This sets up the license on the container.
5. To attach to the container `docker attach <container name>`

## Run Jupyter Notebook

6. Navigate to galapagos directory. `cd /home/user/galapagos`
7. Run the notebook setup script. `source run_jupyter.sh`.
8. Copy/paste the link into your browser. Run through the three notebooks, they are numbered with `<number>_<notebook name>` starting with number 0.

