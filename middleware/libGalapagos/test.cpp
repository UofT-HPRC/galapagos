#define CATCH_CONFIG_RUNNER
#include "catch.hpp"

#include <string>
#include <math.h>
#include <thread>
#include <chrono>


#include "galapagos_interface.hpp"


#define NUM_ITERATIONS 10000
 

std::shared_ptr<spdlog::logger> my_logger;

std::chrono::time_point<std::chrono::high_resolution_clock> start, end;


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

void kern_output_flit_verify(short id, galapagos_stream * in, galapagos_stream *out){
    
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

void kern_output_packet_verify(short id, galapagos_stream * in, galapagos_stream *out){
    
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

void kern_output_flit_perf(short id, galapagos_stream * in, galapagos_stream *out){
    
    galapagos_packet gp;
    
    for(int j=0; j<NUM_ITERATIONS; j++){
        for(int i=0; i<MAX_BUFFER; i++){
            gp = in->read();
        }
    }
    end = std::chrono::high_resolution_clock::now();
}

void kern_output_packet_perf(short id, galapagos_stream * in, galapagos_stream *out){
    
    galapagos_packet gp;
    
   
    for(int j=0; j<NUM_ITERATIONS; j++){
	size_t size;
	short dest;
	short id;
        ap_uint<64> * ptr = (ap_uint<64> *)in->packet_read(&size, &dest, &id);
    }
    end = std::chrono::high_resolution_clock::now();
}



//Test from flit to flit
TEST_CASE( "INTERFACE:FUNC:1" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    std::thread t1(kern_generate_flit, 0, &source, &gen_to_output);
    std::thread t2(kern_output_flit_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;


}

//Test from packet to flit
TEST_CASE( "INTERFACE:FUNC:2" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    std::thread t1(kern_generate_packet, 0, &source, &gen_to_output);
    std::thread t2(kern_output_flit_verify, 1, &gen_to_output, &sink);



    t1.join();
    t2.join();

    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;
    

}

//Test from flit to packet
TEST_CASE( "INTERFACE:FUNC:3" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    std::thread t1(kern_generate_packet, 0, &source, &gen_to_output);
    std::thread t2(kern_output_flit_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
    
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;

}

//Test from packet to packet
TEST_CASE( "INTERFACE:FUNC:4" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    std::thread t1(kern_generate_packet, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
    
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;

}

//Test from flit to flit
TEST_CASE( "INTERFACE:PERF:1" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    std::thread t1(kern_generate_flit, 0, &source, &gen_to_output);
    std::thread t2(kern_output_flit_perf, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;

}

//Test from packet to flit
TEST_CASE( "INTERFACE:PERF:2" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    std::thread t1(kern_generate_packet, 0, &source, &gen_to_output);
    std::thread t2(kern_output_flit_perf, 1, &gen_to_output, &sink);



    t1.join();
    t2.join();

    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;
    

}

//Test from flit to packet
TEST_CASE( "INTERFACE:PERF:3" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    std::thread t1(kern_generate_packet, 0, &source, &gen_to_output);
    std::thread t2(kern_output_flit_perf, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
    
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;

}

//Test from packet to packet
TEST_CASE( "INTERFACE:PERF:4" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    std::thread t1(kern_generate_packet, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_perf, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
    
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;
}


//Test from packet filter on flit write
TEST_CASE( "INTERFACE:TRACE:FLIT:PASS:1" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    gen_to_output.set_filter_flit(0, 0x02);

    std::thread t1(kern_generate_flit, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;
}


//Test from packet filter on flit write
TEST_CASE( "INTERFACE:TRACE:FLIT:PASS:2" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    gen_to_output.set_filter_flit(7, 0xde);
    gen_to_output.set_filter_flit(6, 0xad);

    std::thread t1(kern_generate_flit, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;
}

//Test from packet filter on flit write
TEST_CASE( "INTERFACE:TRACE:FLIT:FAIL:1" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    gen_to_output.set_filter_flit(0, 0xff);

    std::thread t1(kern_generate_flit, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;
}

//Test from packet filter on flit write
TEST_CASE( "INTERFACE:TRACE:PACKET:PASS:1" ) {

    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    
    gen_to_output.set_filter_packet(0, 0x00);

    std::thread t1(kern_generate_packet, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1024*1024)) << " MB/s" << std::endl;
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
