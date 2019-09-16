#define CATCH_CONFIG_RUNNER
#include "catch.hpp"

#include <string>
#include <math.h>
#include <thread>
#include <chrono>

#include "galapagos_interface.hpp"
#include "galapagos_kernel.hpp"

#define NUM_ITERATIONS 10000
std::shared_ptr<spdlog::logger> my_logger;
std::chrono::time_point<std::chrono::high_resolution_clock> start, end;

#include "unit_tests/kernel.h"
#include "unit_tests/interface_func.h"
#include "unit_tests/interface_perf.h"
#include "unit_tests/interface_splice_func.h"
#include "unit_tests/interface_splice_perf.h"
#include "unit_tests/interface_trace.h"
#include "unit_tests/kernel_func.h"
#include "unit_tests/kernel_perf.h"




 



//************** INPUT GENERATION KERNELS *************************//

void kern_generate_flit(short id, galapagos_interface * in, galapagos_interface * out){

    galapagos_packet gp;
    gp.id = id;
    gp.dest = id+1;
    gp.last = 0;
    start = std::chrono::high_resolution_clock::now();
    for(int j=0; j<NUM_ITERATIONS; j++){
        for(int i=0; i<MAX_BUFFER; i++){
            ap_uint <32> lower = i;
            ap_uint <32> higher = 0xdeadbeef;
            gp.data = (higher(31, 0), lower(31,0));
            gp.last = (i==(MAX_BUFFER - 1));
	    out->write(gp);
        }
    }
}

void kern_generate_packet(short id, galapagos_interface * in, galapagos_interface * out){
    
    galapagos_packet gp;
    gp.id = id;
    gp.dest = id+1;
    gp.last = 0;
   
    std::vector<ap_uint<64> > vec(MAX_BUFFER);
    start = std::chrono::high_resolution_clock::now();
    for(int j=0; j<NUM_ITERATIONS; j++){
        for(int i=0; i<MAX_BUFFER; i++){
            ap_uint <32> lower = i;
            ap_uint <32> higher = 0xdeadbeef;
            gp.data = (higher(31, 0), lower(31,0));
            gp.last = (i==(MAX_BUFFER - 1));
            vec[i] = gp.data;
	}

	out->packet_write((char *)vec.data(), MAX_BUFFER*sizeof(ap_uint<64>), gp.dest, id);
    }
}


//************** OUTPUT VERIFICATION KERNELS *************************//

void kern_output_flit_verify(short id, galapagos_interface * in, galapagos_interface *out){
    
    galapagos_packet gp;
    
    for(int j=0; j<NUM_ITERATIONS; j++){
        for(int i=0; i<MAX_BUFFER; i++){
            gp = in->read();
	    REQUIRE(gp.data.range(63,32) == 0xdeadbeef);
	    REQUIRE(gp.data.range(31,0) == i);
	    REQUIRE(gp.last == (i==(MAX_BUFFER - 1)));	
        }
    }
    end = std::chrono::high_resolution_clock::now();
}

void kern_output_packet_verify(short id, galapagos_interface * in, galapagos_interface *out){
    
    galapagos_packet gp;
    
   
    for(int j=0; j<NUM_ITERATIONS; j++){
	size_t size;
	short dest;
	short id;
        ap_uint<64> * ptr = (ap_uint<64> *)in->packet_read(&size, &dest, &id);
	for(int i=0; i<MAX_BUFFER; i++){
	    REQUIRE(ptr[i].range(63,32) == 0xdeadbeef);
	    REQUIRE(ptr[i].range(31,0) == i);
        }
    }
    end = std::chrono::high_resolution_clock::now();
}

//************** OUTPUT PERFORMANCE KERNELS *************************//

void kern_output_flit_perf(short id, galapagos_interface * in, galapagos_interface *out){
    
    galapagos_packet gp;
    
    for(int j=0; j<NUM_ITERATIONS; j++){
        for(int i=0; i<MAX_BUFFER; i++){
            gp = in->read();
        }
    }
    end = std::chrono::high_resolution_clock::now();
}

void kern_output_packet_perf(short id, galapagos_interface * in, galapagos_interface *out){
    
    galapagos_packet gp;
    
   
    for(int j=0; j<NUM_ITERATIONS; j++){
	size_t size;
	short dest;
	short id;
        ap_uint<64> * ptr = (ap_uint<64> *)in->packet_read(&size, &dest, &id);
    }
    end = std::chrono::high_resolution_clock::now();
}


void axis_fifo(galapagos_interface * s_axis, galapagos_interface * m_axis, int count){

    for(int i=0; i<count; i++){
        m_axis->splice(s_axis);	
    }

}






int main(int argc, char * argv[]){
    
    my_logger = spdlog::basic_logger_mt("basic_logger", "unit_test.txt"); 
#if LOG_LEVEL==0
    spdlog::set_level(spdlog::level::off); // Set global log level to off
#elif LOG_LEVEL==1
    spdlog::set_level(spdlog::level::info); // Set global log level to info
#elif LOG_LEVEL==2
    spdlog::set_level(spdlog::level::debug); // Set global log level to debug
#endif
    spdlog::flush_every(std::chrono::seconds(2));
    my_logger->info("Starting Unit Tests");
    int result = Catch::Session().run(argc, argv);

}
