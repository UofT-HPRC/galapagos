#ifndef UNIT_TEST_SYSTEM_FUNC
#define UNIT_TEST_SYSTEM_FUNC

#define GALAPAGOS_PORT 8889

std::string my_address("10.1.2.155");
std::string remote_address("10.1.2.156");
typedef ap_uint<64> T;



//Test from flit to flit
TEST_CASE( "SYSTEM:FUNC:1" ) {

    std::vector<std::string> kern_info_table;
    kern_info_table.push_back(my_address); 
    kern_info_table.push_back(remote_address); 
    std::vector < galapagos::external_driver<T> * > ext_drivers;
   
    my_logger->info("system_func");
    my_logger->flush(); 
    galapagos::net::tcp <T> my_tcp(
                    GALAPAGOS_PORT, 
                    kern_info_table, 
                    my_address, 
                    my_logger
                    );
    ext_drivers.push_back(&my_tcp);
    galapagos::node<T> node0(kern_info_table, my_address, ext_drivers, my_logger);
    node0.add_kernel(0, kern_generate_output_flit_verify);
    node0.start();
    node0.end();
 
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(T))/diff.count()/(1024*1024)) << " MB/s" << std::endl;

}

//Test from flit to flit
TEST_CASE( "SYSTEM:FLIT:LOOPBACK" ) {

    std::vector<std::string> kern_info_table;
    kern_info_table.push_back(my_address); 
    kern_info_table.push_back(remote_address); 
    std::vector < galapagos::external_driver<T> * > ext_drivers;
    
    galapagos::net::tcp <T> my_tcp(
                    GALAPAGOS_PORT, 
                    kern_info_table, 
                    remote_address, 
                    my_logger
                    );
    ext_drivers.push_back(&my_tcp);
    galapagos::node<T> node0(kern_info_table, remote_address, ext_drivers, my_logger);
    node0.add_kernel(0, kern_flit_loopback);
    node0.start();
    node0.end();
 
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(T))/diff.count()/(1024*1024)) << " MB/s" << std::endl;

}


//Test from flit to flit
TEST_CASE( "SYSTEM:PACKET:LOOPBACK" ) {

    std::vector<std::string> kern_info_table;
    kern_info_table.push_back(my_address); 
    kern_info_table.push_back(remote_address); 
    std::vector < galapagos::external_driver<T> * > ext_drivers;
    
    galapagos::net::tcp <T> my_tcp(
                    GALAPAGOS_PORT, 
                    kern_info_table, 
                    remote_address, 
                    my_logger
                    );
    ext_drivers.push_back(&my_tcp);
    galapagos::node<T> node0(kern_info_table, remote_address, ext_drivers, my_logger);
    node0.add_kernel(0, kern_packet_loopback);
    node0.start();
    node0.end();
 
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(T))/diff.count()/(1024*1024)) << " MB/s" << std::endl;

}
#endif
