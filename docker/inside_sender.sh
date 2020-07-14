export RECEIVER_IP=$(cat receiver_ip.txt)

nc $RECEIVER_IP 44444 < shellTop.bit
