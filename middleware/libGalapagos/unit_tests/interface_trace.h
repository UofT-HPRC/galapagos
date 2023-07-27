
#ifndef UNIT_TEST_INTERFACE_TRACE
#define UNIT_TEST_INTERFACE_TRACE

//Test from packet filter on flit write
TEST_CASE( "INTERFACE:TRACE:PASS:1" ) {

    #if LOG_LEVEL > 0
    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    #else
    galapagos::interface <ap_uint <64> > source(std::string("source"));
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"));
    galapagos::interface <ap_uint <64> > sink(std::string("sink"));
    #endif
    
    gen_to_output.set_filter(0, 0x00);

    std::thread t1(kern_generate_flit, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
}


//Test from packet filter on flit write
TEST_CASE( "INTERFACE:TRACE:PASS:2" ) {

    #if LOG_LEVEL > 0
    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    #else
    galapagos::interface <ap_uint <64> > source(std::string("source"));
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"));
    galapagos::interface <ap_uint <64> > sink(std::string("sink"));
    #endif
    
    gen_to_output.set_filter(7, 0xde);
    gen_to_output.set_filter(6, 0xad);

    std::thread t1(kern_generate_flit, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
}

//Test from packet filter on flit write
TEST_CASE( "INTERFACE:TRACE:FAIL:1" ) {

    #if LOG_LEVEL > 0
    galapagos::interface <ap_uint <64> > source(std::string("source"), my_logger);
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"), my_logger);
    galapagos::interface <ap_uint <64> > sink(std::string("sink"), my_logger);
    #else
    galapagos::interface <ap_uint <64> > source(std::string("source"));
    galapagos::interface <ap_uint <64> > gen_to_output(std::string("gen_to_output"));
    galapagos::interface <ap_uint <64> > sink(std::string("sink"));
    #endif
    
    gen_to_output.set_filter(0, 0xff);

    std::thread t1(kern_generate_flit, 0, &source, &gen_to_output);
    std::thread t2(kern_output_packet_verify, 1, &gen_to_output, &sink);

    t1.join();
    t2.join();
   
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
}

#endif
