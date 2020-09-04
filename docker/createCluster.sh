fst cluster
cd ~/notebook/galapagos/docker
source setup.sh
export SENDER_ID=$(cat sender_id.txt)
docker exec -it $SENDER_ID bash inside_sender.sh
#docker exec -it $SENDER_ID bash vivado -mode batch -source shells/tclScripts/make_shell.tcl -tclargs --project_name 1  --pr_tcl /home/user/galapagos/projects/middleware_test/1/1.tcl --dir middleware_test --start_synth 1
#docker exec -it $SENDER_ID bash send_to_receiver.sh


#second cluster
#cd ~/notebook/galapagos/docker
#source setup.sh
#export SENDER_ID=$(cat sender_id.txt)
#docker exec -it $SENDER_ID bash inside_sender.sh
#vivado -mode batch -source shells/tclScripts/make_shell.tcl -tclargs --project_name 3  --pr_tcl /home/user/galapagos/projects/middleware_test/3/3.tcl --dir middleware_test --start_synth 1
#docker exec -it $SENDER_ID bash send_to_receiver.sh
