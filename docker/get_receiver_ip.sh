docker ps --latest --format {{.ID}} > receiver_id.txt

export RECEIVER_ID=$(cat receiver_id.txt)

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $RECEIVER_ID > receiver_ip.txt

