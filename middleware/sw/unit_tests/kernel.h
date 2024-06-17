#ifndef KERNELS

void kern_generate_flit(short id, galapagos_interface * in, galapagos_interface * out);
void kern_generate_packet(short id, galapagos_interface * in, galapagos_interface * out);
void kern_output_flit_verify(short id, galapagos_interface * in, galapagos_interface *out);
void kern_output_packet_verify(short id, galapagos_interface * in, galapagos_interface *out);
void kern_output_flit_perf(short id, galapagos_interface * in, galapagos_interface *out);
void kern_output_packet_perf(short id, galapagos_interface * in, galapagos_interface *out);
void axis_fifo(galapagos_interface * s_axis, galapagos_interface * m_axis, int count);
void kern_flit_loopback_perf(short id, galapagos_interface * in, galapagos_interface *out);
void kern_flit_loopback_verify(short id, galapagos_interface * in, galapagos_interface *out);
void kern_packet_loopback_perf(short id, galapagos_interface * in, galapagos_interface *out);
void kern_packet_loopback_verify(short id, galapagos_interface * in, galapagos_interface *out);
void kern_generate_output_flit_verify(short id, galapagos_interface * in, galapagos_interface *out);
void kern_generate_output_packet_verify(short id, galapagos_interface * in, galapagos_interface *out);
void kern_generate_output_flit_perf(short id, galapagos_interface * in, galapagos_interface *out);
void kern_generate_output_packet_perf(short id, galapagos_interface * in, galapagos_interface *out);
void send_single_flit(short id, galapagos_interface * in, galapagos_interface *out);
void recv_single_flit(short id, galapagos_interface * in, galapagos_interface *out);
void send_single_packet(short id, galapagos_interface * in, galapagos_interface *out);
void recv_single_packet(short id, galapagos_interface * in, galapagos_interface *out);


#endif
