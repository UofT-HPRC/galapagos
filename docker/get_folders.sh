#echo "Please enter the container id"
#read container_id

export CONTAINER_ID=$(cat container_id.txt)
current_folder=$(pwd)

docker cp $CONTAINER_ID:/home/user/galapagos/hlsBuild $current_folder
docker cp $CONTAINER_ID:/home/user/galapagos/projects $current_folder
