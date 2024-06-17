#ifndef UNIT_TEST_KERNEL_FUNC
#define UNIT_TEST_KERNEL_FUNC

//Test from flit to flit
TEST_CASE( "KERNEL:FUNC:1" ) {

    #if LOG_LEVEL > 0
    galapagos::kernel<ap_uint<64> > kern0(0, my_logger);
    galapagos::kernel<ap_uint<64> > kern1(0, my_logger);
    #else
    galapagos::kernel<ap_uint<64> > kern0(0);
    galapagos::kernel<ap_uint<64> > kern1(0);
    #endif
   
    kern0.set_func(kern_generate_flit); 
    kern1.set_func(kern_output_flit_verify); 

    std::thread t(axis_fifo, kern0.get_m_axis(), kern1.get_s_axis(), NUM_ITERATIONS);
    
    kern0.start();
    kern1.start();
    kern0.barrier();
    kern1.barrier();
    t.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;

}

//Test from packet to flit
TEST_CASE( "KERNEL:FUNC:2" ) {


    #if LOG_LEVEL > 0
    galapagos::kernel<ap_uint<64> > kern0(0, my_logger);
    galapagos::kernel<ap_uint<64> > kern1(0, my_logger);
    #else
    galapagos::kernel<ap_uint<64> > kern0(0);
    galapagos::kernel<ap_uint<64> > kern1(0);
    #endif
   
    kern0.set_func(kern_generate_packet); 
    kern1.set_func(kern_output_flit_verify); 

    std::thread t(axis_fifo, kern0.get_m_axis(), kern1.get_s_axis(), NUM_ITERATIONS);
    
    kern0.start();
    kern1.start();
    kern0.barrier();
    kern1.barrier();
    t.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;


}

//Test from flit to packet
TEST_CASE( "KERNEL:FUNC:3" ) {

    #if LOG_LEVEL > 0
    galapagos::kernel<ap_uint<64> > kern0(0, my_logger);
    galapagos::kernel<ap_uint<64> > kern1(0, my_logger);
    #else
    galapagos::kernel<ap_uint<64> > kern0(0);
    galapagos::kernel<ap_uint<64> > kern1(0);
    #endif
   
    kern0.set_func(kern_generate_flit); 
    kern1.set_func(kern_output_packet_verify); 

    std::thread t(axis_fifo, kern0.get_m_axis(), kern1.get_s_axis(), NUM_ITERATIONS);
    
    kern0.start();
    kern1.start();
    kern0.barrier();
    kern1.barrier();
    t.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
    
}

//Test from packet to packet
TEST_CASE( "KERNEL:FUNC:4" ) {
    
    #if LOG_LEVEL > 0
    galapagos::kernel<ap_uint<64> > kern0(0, my_logger);
    galapagos::kernel<ap_uint<64> > kern1(0, my_logger);
    #else
    galapagos::kernel<ap_uint<64> > kern0(0);
    galapagos::kernel<ap_uint<64> > kern1(0);
    #endif
   
    kern0.set_func(kern_generate_packet); 
    kern1.set_func(kern_output_packet_verify); 

    std::thread t(axis_fifo, kern0.get_m_axis(), kern1.get_s_axis(), NUM_ITERATIONS);
    
    kern0.start();
    kern1.start();
    kern0.barrier();
    kern1.barrier();
    t.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
    
}


#endif
