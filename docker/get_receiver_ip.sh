docker ps --latest --format {{.ID}} > receiver_id.txt

export CONTAINER_ID=$(cat receiver_id.txt)

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_ID > receiver_ip.txt

