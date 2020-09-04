#source create_image.sh
source deploy_container.sh
docker ps
source setup_license.sh
source get_container_id.sh
cat container_id.txt
export CONTAINER_ID=$(cat container_id.txt)
docker exec -it $CONTAINER_ID bash inside_container.sh
source get_folders.sh

#execute createClusters after this
