#ifndef UNIT_TEST_NODE_PERF
#define UNIT_TEST_NODE_PERF

//Test from flit to flit
TEST_CASE( "NODE:PERF:1" ) {

   
    std::vector<std::string> kern_info_table;
    kern_info_table.push_back(std::string("10.1.2.155")); //kern 0 node address is 10.1.2.155
    kern_info_table.push_back(std::string("10.1.2.155")); //kern 1 node address is 10.1.2.155


    #if LOG_LEVEL > 0
    galapagos::node<ap_uint <64> > node0(kern_info_table, std::string("10.1.2.155"), std::vector<galapagos::external_driver <ap_uint<64> > * >(), my_logger);
    #else
    galapagos::node<ap_uint <64> > node0(kern_info_table, std::string("10.1.2.155"), std::vector<galapagos::external_driver <ap_uint<64> > * >());
    #endif
    node0.add_kernel(0, kern_generate_flit);
    node0.add_kernel(1, kern_output_flit_perf);

    node0.start();
    node0.end();
 
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;

}

//Test from flit to flit
TEST_CASE( "NODE:PERF:2" ) {

   
    std::vector<std::string> kern_info_table;
    kern_info_table.push_back(std::string("10.1.2.155")); //kern 0 node address is 10.1.2.155
    kern_info_table.push_back(std::string("10.1.2.155")); //kern 1 node address is 10.1.2.155


    #if LOG_LEVEL > 0
    galapagos::node<ap_uint <64> > node0(kern_info_table, std::string("10.1.2.155"), std::vector<galapagos::external_driver <ap_uint<64> > * >(), my_logger);
    #else
    galapagos::node<ap_uint <64> > node0(kern_info_table, std::string("10.1.2.155"), std::vector<galapagos::external_driver <ap_uint<64> > * >());
    #endif
    node0.add_kernel(0, kern_generate_packet);
    node0.add_kernel(1, kern_output_flit_perf);

    node0.start();
    node0.end();
 
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;

}

//Test from flit to flit
TEST_CASE( "NODE:PERF:3" ) {

   
    std::vector<std::string> kern_info_table;
    kern_info_table.push_back(std::string("10.1.2.155")); //kern 0 node address is 10.1.2.155
    kern_info_table.push_back(std::string("10.1.2.155")); //kern 1 node address is 10.1.2.155


    #if LOG_LEVEL > 0
    galapagos::node<ap_uint <64> > node0(kern_info_table, std::string("10.1.2.155"), std::vector<galapagos::external_driver <ap_uint<64> > * >(), my_logger);
    #else
    galapagos::node<ap_uint <64> > node0(kern_info_table, std::string("10.1.2.155"), std::vector<galapagos::external_driver <ap_uint<64> > * >());
    #endif
    node0.add_kernel(0, kern_generate_flit);
    node0.add_kernel(1, kern_output_packet_perf);

    node0.start();
    node0.end();
 
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;

}

//Test from flit to flit
TEST_CASE( "NODE:PERF:4" ) {

   
    std::vector<std::string> kern_info_table;
    kern_info_table.push_back(std::string("10.1.2.155")); //kern 0 node address is 10.1.2.155
    kern_info_table.push_back(std::string("10.1.2.155")); //kern 1 node address is 10.1.2.155


    #if LOG_LEVEL > 0
    galapagos::node<ap_uint <64> > node0(kern_info_table, std::string("10.1.2.155"), std::vector<galapagos::external_driver <ap_uint<64> > * >(), my_logger);
    #else
    galapagos::node<ap_uint <64> > node0(kern_info_table, std::string("10.1.2.155"), std::vector<galapagos::external_driver <ap_uint<64> > * >());
    #endif
    node0.add_kernel(0, kern_generate_packet);
    node0.add_kernel(1, kern_output_packet_perf);

    node0.start();
    node0.end();
 
    std::chrono::duration<double> diff = end-start;
    std::cout << std::endl << " ......................." << Catch::getResultCapture().getCurrentTestName() << "......................." << std::endl;
    std::cout << "RUNTIME:"  <<  diff.count() << " s" << std::endl;
    std::cout << "TRANSFER_RATE:"  <<  ((MAX_BUFFER*NUM_ITERATIONS*sizeof(ap_uint<64>))/diff.count()/(1000*1000/8)) << " Mb/s" << std::endl;

}

#endif
