#===============================
# AUTHOR     : Naif Tarafdar
# CREATE DATE     : April 20, 2019
#===============================

include $(GALAPAGOS_PATH)/include.mk


DEBUG_FLAGS = -g -DLOG_LEVEL=2 
PRODUCTION_FLAGS = -O3 -DLOG_LEVEL=0
BOOST_LDFLAGS=-lboost_thread -lboost_system -lpthread
 
release: CXXFLAGS = -DCPU  -std=c++17 -isystem $(GALAPAGOS_HLS_PATH)/include -I$(GALAPAGOS_PATH)/middleware/include -I$(GALAPAGOS_PATH)/middleware/CPP_lib/Galapagos_lib -L/usr/local/lib $(INCLUDE_UTIL) ${PRODUCTION_FLAGS} 
release: test.exe 
debug: CXXFLAGS = -DCPU  -std=c++17 -isystem $(GALAPAGOS_HLS_PATH)/include -I$(GALAPAGOS_PATH)/middleware/include -I$(GALAPAGOS_PATH)/middleware/CPP_lib/Galapagos_lib -L/usr/local/lib $(INCLUDE_UTIL) ${DEBUG_FLAGS} 
debug: test.exe 
 
all: release 

test.exe: test.cpp *.hpp unit_tests/*
	$(CXX) $(CXXFLAGS) -o test.exe  test.cpp $(BOOST_LDFLAGS)
	mkdir -p send
	mkdir -p recv
	cp test.exe send/ && cp test.exe recv/


clean:
	rm -rf *.o
	rm -rf *.exe
	rm -rf *.txt 
	rm -rf send/*
	rm -rf recv/*
