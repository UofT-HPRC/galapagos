#cd ~/notebook/galapagos
#galapagos-update-board adm-8k5-debug
#cd ~/notebook/galapagos/docker
#source setup.sh
#export SENDER_ID=$(cat ~/notebook/galapagos/docker/sender_ip.txt)
#docker exec 
#vivado -mode batch -source shells/tclScripts/make_shell.tcl -tclargs --project_name 1  --pr_tcl /home/user/galapagos/projects/middleware_test/1/1.tcl --dir middleware_test --start_synth 1

cd ~/notebook/galapagos/docker
source setup.sh
export SENDER_ID=$(cat sender_id.txt)
docker exec -it $SENDER_ID bash inside_sender.sh
#docker exec vivado
docker exec -it $SENDER_ID bash send_to_receiver.sh
