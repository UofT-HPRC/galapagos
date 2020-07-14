#deploying receiver container
source deploy_receiver.sh

#getting ip addr of receiver container
source get_receiver_id.sh
source get_receiver_ip.sh

#deploying sender container
source create_sender.sh
source deploy_sender.sh
