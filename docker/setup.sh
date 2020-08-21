source deploy_receiver.sh
source get_receiver_ip.sh
export RECEIVER_ID=$(cat receiver_id.txt)
docker exec -ti $RECEIVER_ID bash inside_receiver.sh &
source deploy_sender.sh
source send_receiver_ip.sh
source send_folders.sh
#export SENDER_ID=$(cat sender_id.txt)
#docker exec -ti $SENDER_ID bash inside_sender.sh
