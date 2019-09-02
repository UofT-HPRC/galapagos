#===============================
# AUTHOR     : Naif Tarafdar
# CREATE DATE     : April 20, 2019
#===============================

include $(GALAPAGOS_PATH)/include.mk

BOOST_LDFLAGS=-lboost_thread -lboost_system -lpthread

DEBUG_FLAGS = -g 
PRODUCTION_FLAGS = -O3 -DLOGGING_OFF



CXXFLAGS = -DCPU  -std=c++17 -pthread -isystem $(GALAPAGOS_HLS_PATH)/include -I$(GALAPAGOS_PATH)/middleware/include -I$(GALAPAGOS_PATH)/middleware/CPP_lib/Galapagos_lib $(INCLUDE_UTIL) ${DEBUG_FLAGS} 

test_stream.exe: test_stream.cpp galapagos_stream.hpp
	$(CXX) $(CXXFLAGS) -o test_stream.exe  test_stream.cpp $(BOOST_LDFLAGS)

test.exe: test.cpp *.hpp
	$(CXX) $(CXXFLAGS) -o test.exe  test.cpp $(BOOST_LDFLAGS)


clean:
	rm -rf *.o
	rm -rf *.exe 
