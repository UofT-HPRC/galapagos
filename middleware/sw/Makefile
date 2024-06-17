#===============================
# AUTHOR     : Naif Tarafdar
# CREATE DATE     : April 20, 2019
#===============================

include $(GALAPAGOS_PATH)/include.mk


DEBUG_FLAGS = -g -DLOG_LEVEL=2
PRODUCTION_FLAGS = -O3 -DLOG_LEVEL=0
BOOST_LDFLAGS=-lboost_thread -lboost_system -lpthread
FLAGS=-DCPU  -std=c++17 -isystem $(GALAPAGOS_HLS_PATH)/include -I$(GALAPAGOS_PATH)/middleware/include -I$(GALAPAGOS_PATH)/middleware/libGalapagos -L/usr/local/lib $(INCLUDE_UTIL)

release: CXXFLAGS = $(FLAGS)  ${PRODUCTION_FLAGS}
release: test.exe
debug: CXXFLAGS = $(FLAGS) ${DEBUG_FLAGS}
debug: test.exe

all: release

DEBUG ?= 0
ifeq ($(DEBUG), 0)
OPT = $(FLAGS) $(PRODUCTION_FLAGS)
else
OPT = $(FLAGS) $(DEBUG_FLAGS)
endif

lib:
	rm *.o
	$(CXX) $(OPT) -c common.cpp
	ar -cr libGalapagos.a *.o

test.exe: test.cpp *.hpp unit_tests/* common.cpp
	$(CXX) $(CXXFLAGS) -o test.exe  test.cpp common.cpp $(BOOST_LDFLAGS)
	mkdir -p send
	mkdir -p recv
	cp test.exe send/ && cp test.exe recv/

reply: 
	$(CXX) $(FLAGS) ${PRODUCTION_FLAGS} -o test_0.exe  benchmark_0.cpp common.cpp $(BOOST_LDFLAGS)
	$(CXX) $(FLAGS) ${PRODUCTION_FLAGS} -o test_1.exe  benchmark_1.cpp common.cpp $(BOOST_LDFLAGS)

clean:
	rm -rf *.o
	rm -rf *.a
	rm -rf *.exe
	rm -rf *.txt
	rm -rf send/*
	rm -rf recv/*
