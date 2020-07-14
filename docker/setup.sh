#deploying receiver container
source deploy_receiver.sh

#getting ip addr of receiver container
#cd Sender
source get_receiver_id.sh
source get_receiver_ip.sh

source create_sender.sh
#deploying sender container
source deploy_sender.sh

#getting id pf sender container to cp ip file to it
#source get_id.sh
#export SENDER_ID=$(cat id.txt)

#cp ip file of receiver
#docker cp ip.txt $SENDER_ID:/home/user  
