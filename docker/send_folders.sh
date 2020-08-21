#echo "Please enter sender container id"
#read container_id

export CONTAINER_ID=$(cat sender_id.txt)
docker cp projects $CONTAINER_ID:/home/user/galapagos  
docker cp hlsBuild $CONTAINER_ID:/home/user/galapagos

