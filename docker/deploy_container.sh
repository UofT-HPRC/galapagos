echo "Please enter vivado install path"
read vivado_dir
echo "Please enter open port"
read port

docker run -ti -p $port:9000 \
           -d -v $vivado_dir:/opt/Xilinx \
           --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           galapagos_docker
           bash


