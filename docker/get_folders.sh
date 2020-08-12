echo "Please enter the container id"
read container_id

current_folder=$(pwd)

docker cp $container_id:/home/user/galapagos/hlsBuild $current_folder
docker cp $container_id:/home/user/galapagos/projects $current_folder
