echo "Please enter container name"
read container_name


echo "Do you have a local license?(y/n)"
read license_reply
if [[ $license_reply =~ ^[Yy]$ ]]
then
    echo "Enter license name:"
    read license_name
    docker cp $license_name container_name:/home/user/.license
else
    echo "Enter floating license location"
    read license_name
fi


echo "export XILINXD_LICENSE_FILE=\"$license_name\"" > .license.sh

docker cp .license.sh $container_name:/home/user/.license.sh
