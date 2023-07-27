
read -p "Do you want to pass a device?" -n 1 -r
echo  "\n"  # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$  ]]
then

    echo "Please enter device name"
    read dev_name
    _ctrl="_user"
    _c2h="_c2h_0"
    _h2c="_h2c_0"
    dev_ctrl=$dev_name$_ctrl
    dev_c2h=$dev_name$_c2h
    dev_h2c=$dev_name$_h2c

    docker run -ti \
       --device=$dev_ctrl \
       --device=$dev_c2h \
       --device=$dev_h2c \
       --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       galapagos_runtime_docker
       bash

else

    docker run -ti \
           --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           galapagos_runtime_docker
           bash


fi


docker container ls
