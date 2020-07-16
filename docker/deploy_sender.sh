echo "Please enter vivado install path"
read vivado_dir

docker run -ti \
	   --net=host \
	   -d -v $vivado_dir:/opt/Xilinx \
           --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           galapagos_sender \
           bash

docker container ls
