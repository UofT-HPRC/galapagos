#ifndef KERNELS

void kern_generate_flit(short id, galapagos_interface * in, galapagos_interface * out);
void kern_generate_packet(short id, galapagos_interface * in, galapagos_interface * out);
void kern_output_flit_verify(short id, galapagos_interface * in, galapagos_interface *out);
void kern_output_packet_verify(short id, galapagos_interface * in, galapagos_interface *out);
void kern_output_flit_perf(short id, galapagos_interface * in, galapagos_interface *out);
void kern_output_packet_perf(short id, galapagos_interface * in, galapagos_interface *out);
void axis_fifo(galapagos_interface * s_axis, galapagos_interface * m_axis, int count);


#endif
