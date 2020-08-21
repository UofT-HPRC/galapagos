export SENDER_ID=$(cat sender_id.txt)
docker cp generate_bitstream.sh $SENDER_ID:/home/user
