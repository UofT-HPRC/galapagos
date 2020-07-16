docker ps --latest --format {{.ID}} > sender_id.txt
export SENDER_ID=$(cat sender_id.txt)
docker cp receiver_ip.txt $SENDER_ID:/home/user/
