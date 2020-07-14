echo "Please enter vivado install path"
read vivado_dir

docker run -ti \
           -d -v $vivado_dir:/opt/Xilinx \
           --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           galapagos_receiver \
           bash

docker container ls
          # --net=host \
