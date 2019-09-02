#define CATCH_CONFIG_RUNNER
#include "catch.hpp"

#include <string>
#include <math.h>
#include <thread>
#include <chrono>

#include "galapagos_kernel.hpp"
#include "galapagos_router_node.hpp"


std::shared_ptr<spdlog::logger> my_logger;

void kern_generate(short id, galapagos_stream * in, galapagos_stream *out)
{


    galapagos_stream_packet gp;
    gp.id = id;
    gp.dest = id+1;
    gp.last = 0;
    for(int i=0; i<10; i++){
        ap_uint <32> lower = i;
        ap_uint <32> higher = 0xdeadbeef;
        gp.data = (higher(31, 0), lower(31,0));
        if(i==9)
            gp.last = 1;
        out->write(gp);
    }




}

void kern_reverseEndian(short id, galapagos_stream * in, galapagos_stream *out)
{

    galapagos_stream_packet gp_in, gp_out;
    gp_out.dest = id+1;
    gp_out.id = id;
    for(int i=0; i<10; i++){
        gp_in = in->read();
        gp_out.data  = (gp_in.data.range(7,0), gp_in.data(15, 8), gp_in.data(23, 16), gp_in.data(31, 24), gp_in.data(39, 32), gp_in.data(47, 40), gp_in.data(55, 48), gp_in.data(63, 56));
        gp_out.last = gp_in.last;
        out->write(gp_out);
    }
}


void kern_output(short id, galapagos_stream * in, galapagos_stream *out){
    
    galapagos_stream_packet gp;
    
    for(int i=0; i<10; i++){
        gp = in->read();
        std::cout << "READ BACK " << std::hex << gp.data << std::endl;
    }

}

TEST_CASE( "KERNEL:1" ) {

    int source = 0;
    std::string str_in = "kern_in";
    std::string str_out = "kern_out";
    galapagos::stream<ap_uint <64> > in(str_in, spdlog::get("basic_logger"));
    galapagos::stream<ap_uint <64> > out(str_out, spdlog::get("basic_logger"));
    galapagos::kernel <ap_uint<64> > gk(source, spdlog::get("basic_logger"));
    
    gk.set_func(kern_generate);
    gk.in = &in;
    gk.out = &out;
    
    gk.start();
    gk.barrier(); 

    REQUIRE(out.size() == 10);
}


TEST_CASE( "ROUTER_NODE:1" ) {


    std::string my_address = "10.0.0.1";
    bool done = false;
    std::mutex mutex;
    
    int packets_in_flight = 0;
    std::mutex mutex_packets_in_flight;
    
    std::vector<std::string> kern_info_table;
    kern_info_table.push_back(my_address);
    kern_info_table.push_back(my_address);
    kern_info_table.push_back(my_address);
            
    galapagos::router_node <ap_uint<64> > router(kern_info_table, 
                                                 my_address, 
                                                 &done, 
                                                 &mutex, 
                                                 0, 
                                                 &mutex_packets_in_flight,
                                                 &packets_in_flight,
                                                 spdlog::get("basic_logger")
                                                );


    galapagos::kernel <ap_uint<64> > gk_generate(0, spdlog::get("basic_logger"));
    gk_generate.set_func(kern_generate);
    router.add_kernel(&gk_generate, 0);
    
    galapagos::kernel <ap_uint<64> > gk_reverseEndian(1, spdlog::get("basic_logger"));
    gk_reverseEndian.set_func(kern_reverseEndian);
    router.add_kernel(&gk_reverseEndian, 1);
    
    galapagos::kernel <ap_uint<64> > gk_output(2, spdlog::get("basic_logger"));
    gk_output.set_func(kern_output);
    router.add_kernel(&gk_output, 2);


    gk_generate.start();
    gk_reverseEndian.start();
    gk_output.start();
    router.start();

    gk_generate.barrier();
    gk_reverseEndian.barrier();
    gk_output.barrier();
    
    int numPacketsLeft;
    do{
        std::lock_guard < std::mutex> guard(mutex_packets_in_flight);
        numPacketsLeft = router.num_packets();

    }while(numPacketsLeft!=0);
}


int main(int argc, char * argv[]){
    
    my_logger = spdlog::basic_logger_mt("basic_logger", "unit_test.txt"); 
    spdlog::set_level(spdlog::level::debug); // Set global log level to debug
    spdlog::flush_every(std::chrono::seconds(2));
    my_logger->info("Starting Unit Tests");
    int result = Catch::Session().run(argc, argv);


}
