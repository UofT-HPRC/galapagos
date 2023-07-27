CC ?= gcc

all: reg_rw

reg_rw: reg_rw.o
	$(CC) -g -o $@ $<


local_control:   
	g++ -std=c++17 -pthread net_control_device.cpp control_device.cpp test.cpp -o control.exe -lboost_thread -lboost_system -lpthread
	
net_control_server:   
	g++ -DBOOST_LOG_DYN_LINK -std=c++17 -pthread net_control_device.cpp control_device.cpp net_control_server.cpp -o net_control_server.exe -lboost_log -lboost_log_setup -lpthread -lboost_thread -lboost_system -lboost_program_options

net_control_client:   
	g++ -std=c++17 -pthread net_control_device.cpp control_device.cpp net_control_client.cpp -o net_control_client.exe -lboost_thread -lboost_system -lpthread

parse:
	g++ -std=c++17 -pthread parse.cpp -lboost_program_options 

clean:
	rm -rf reg_rw *.o *.exe

