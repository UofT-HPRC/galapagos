#ideally this is fixed in the other files
cd /opt/Xilinx
source vivado_setup "2018.1" 

#executing python files
cd /home/user/galapagos/middleware/python
source 01_setup_and_creating_ip_cores.py
cd /home/user/galapagos/middleware/python
python3 02_middleware.py


