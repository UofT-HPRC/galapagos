
#ifndef UNIT_TEST_INTERFACE_SPLICE_PERF
#define UNIT_TEST_INTERFACE_SPLICE_PERF
TEST_CASE( "INTERFACE:SPLICE:PERF:1" ) {

    #if LOG_LEVEL > 0
    galapagos::interface <ap_uint <64> > kern_generate_s_axis(std::string("generate_s_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_generate_m_axis(std::string("generate_m_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_output_s_axis(std::string("output_s_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_output_m_axis(std::string("output_m_axis"), my_logger);
    #else
    galapagos::interface <ap_uint <64> > kern_generate_s_axis(std::string("generate_s_axis"));
    galapagos::interface <ap_uint <64> > kern_generate_m_axis(std::string("generate_m_axis"));
    galapagos::interface <ap_uint <64> > kern_output_s_axis(std::string("output_s_axis"));
    galapagos::interface <ap_uint <64> > kern_output_m_axis(std::string("output_m_axis"));
    #endif
    
    std::thread t1(kern_generate_flit, 0, &kern_generate_s_axis, &kern_generate_m_axis);
    std::thread t3(axis_fifo, &kern_generate_m_axis, &kern_output_s_axis, NUM_ITERATIONS);
    std::thread t2(kern_output_flit_perf, 1, &kern_output_s_axis, &kern_output_m_axis);
    
    t1.join();
    t2.join();
    t3.join();
    
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
}

TEST_CASE( "INTERFACE:SPLICE:PERF:2" ) {

    #if LOG_LEVEL > 0
    galapagos::interface <ap_uint <64> > kern_generate_s_axis(std::string("generate_s_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_generate_m_axis(std::string("generate_m_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_output_s_axis(std::string("output_s_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_output_m_axis(std::string("output_m_axis"), my_logger);
    #else
    galapagos::interface <ap_uint <64> > kern_generate_s_axis(std::string("generate_s_axis"));
    galapagos::interface <ap_uint <64> > kern_generate_m_axis(std::string("generate_m_axis"));
    galapagos::interface <ap_uint <64> > kern_output_s_axis(std::string("output_s_axis"));
    galapagos::interface <ap_uint <64> > kern_output_m_axis(std::string("output_m_axis"));
    #endif
    
    std::thread t1(kern_generate_packet, 0, &kern_generate_s_axis, &kern_generate_m_axis);
    std::thread t3(axis_fifo, &kern_generate_m_axis, &kern_output_s_axis, NUM_ITERATIONS);
    std::thread t2(kern_output_flit_perf, 1, &kern_output_s_axis, &kern_output_m_axis);
    
    t1.join();
    t2.join();
    t3.join();
    
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
}

TEST_CASE( "INTERFACE:SPLICE:PERF:3" ) {

    #if LOG_LEVEL > 0
    galapagos::interface <ap_uint <64> > kern_generate_s_axis(std::string("generate_s_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_generate_m_axis(std::string("generate_m_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_output_s_axis(std::string("output_s_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_output_m_axis(std::string("output_m_axis"), my_logger);
    #else
    galapagos::interface <ap_uint <64> > kern_generate_s_axis(std::string("generate_s_axis"));
    galapagos::interface <ap_uint <64> > kern_generate_m_axis(std::string("generate_m_axis"));
    galapagos::interface <ap_uint <64> > kern_output_s_axis(std::string("output_s_axis"));
    galapagos::interface <ap_uint <64> > kern_output_m_axis(std::string("output_m_axis"));
    #endif
    
    std::thread t1(kern_generate_flit, 0, &kern_generate_s_axis, &kern_generate_m_axis);
    std::thread t3(axis_fifo, &kern_generate_m_axis, &kern_output_s_axis, NUM_ITERATIONS);
    std::thread t2(kern_output_packet_perf, 1, &kern_output_s_axis, &kern_output_m_axis);
    
    t1.join();
    t2.join();
    t3.join();
    
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
}

TEST_CASE( "INTERFACE:SPLICE:PERF:4" ) {

    #if LOG_LEVEL > 0
    galapagos::interface <ap_uint <64> > kern_generate_s_axis(std::string("generate_s_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_generate_m_axis(std::string("generate_m_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_output_s_axis(std::string("output_s_axis"), my_logger);
    galapagos::interface <ap_uint <64> > kern_output_m_axis(std::string("output_m_axis"), my_logger);
    #else
    galapagos::interface <ap_uint <64> > kern_generate_s_axis(std::string("generate_s_axis"));
    galapagos::interface <ap_uint <64> > kern_generate_m_axis(std::string("generate_m_axis"));
    galapagos::interface <ap_uint <64> > kern_output_s_axis(std::string("output_s_axis"));
    galapagos::interface <ap_uint <64> > kern_output_m_axis(std::string("output_m_axis"));
    #endif
    
    std::thread t1(kern_generate_packet, 0, &kern_generate_s_axis, &kern_generate_m_axis);
    std::thread t3(axis_fifo, &kern_generate_m_axis, &kern_output_s_axis, NUM_ITERATIONS);
    std::thread t2(kern_output_packet_perf, 1, &kern_output_s_axis, &kern_output_m_axis);
    
    t1.join();
    t2.join();
    t3.join();
    
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;
}

#endif
