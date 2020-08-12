echo "Please enter sender container id"
read container_id

docker cp projects $container_id:/home/user/galapagos  
docker cp hlsBuild $container_id:/home/user/galapagos
