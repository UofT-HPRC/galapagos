cd /opt/Xilinx
source vivado_setup "2018.1"

cd /home/user/galapagos
sudo chmod -R 777 hlsBuild
sudo chmod -R 777 projects

cd middleware/python
source 03_building_the_project.py

#cd /home/user
#source send_to_receiver.sh
