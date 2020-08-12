export RECEIVER_IP=$(cat receiver_ip.txt)
cd /home/user/galapagos/projects/middleware_test/1/1.runs/impl_1
nc $RECEIVER_IP 44444 < shellTop.bit
