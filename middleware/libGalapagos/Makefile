#===============================
# AUTHOR     : Naif Tarafdar
# CREATE DATE     : April 20, 2019
#===============================

include $(GALAPAGOS_PATH)/include.mk

BOOST_LDFLAGS=-lboost_thread -lboost_system -lpthread

DEBUG_FLAGS = -g -DLOG_LEVEL=2 


PRODUCTION_FLAGS = -O3 -DLOG_LEVEL=1


CXXFLAGS = -DCPU  -std=c++17 -isystem $(GALAPAGOS_HLS_PATH)/include -I$(GALAPAGOS_PATH)/middleware/include -I$(GALAPAGOS_PATH)/middleware/CPP_lib/Galapagos_lib $(INCLUDE_UTIL) ${PRODUCTION_FLAGS} 

test.exe: test.cpp *.hpp unit_tests/*
	$(CXX) $(CXXFLAGS) -o test.exe  test.cpp $(BOOST_LDFLAGS)


clean:
	rm -rf *.o
	rm -rf *.exe 
