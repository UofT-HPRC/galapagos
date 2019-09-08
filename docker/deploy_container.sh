

docker run -ti -p 9000:9000 \
           -d -v /opt/Xilinx:/opt/Xilinx \
           --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           galapagos_docker
           bash
