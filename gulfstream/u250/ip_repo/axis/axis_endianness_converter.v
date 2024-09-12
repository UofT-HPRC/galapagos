`timescale 1ps/1ps
module axis_endianness_converter #
(
	parameter DATA_WIDTH	=	8,
	parameter HAS_DATA	=	1,
	parameter HAS_KEEP	=	0,
	parameter HAS_LAST	=	0,
	parameter HAS_READY	=	0,
	parameter HAS_DEST	=	0,
	parameter HAS_USER	=	0,
	parameter HAS_ID	=	0,
	parameter HAS_STRB	=	0,
	parameter ID_WIDTH	=	1,
	parameter DEST_WIDTH	=	1,
	parameter USER_WIDTH	=	1
)
(
	input wire			clk,
	input wire			s_valid,
	output wire			s_ready,
	input wire [DATA_WIDTH-1:0]	s_data,
	input wire [DATA_WIDTH/8-1:0]	s_keep,
	input wire			s_last,
	input wire [DEST_WIDTH-1:0]	s_dest,
	input wire [USER_WIDTH-1:0]	s_user,
	input wire [ID_WIDTH-1:0]	s_id,
	input wire [DATA_WIDTH/8-1:0]	s_strb,
	output wire			m_valid,
	input wire			m_ready,
	output wire [DATA_WIDTH-1:0]	m_data,
	output wire [DATA_WIDTH/8-1:0]   m_keep,
	output wire			m_last,
	output wire [DEST_WIDTH-1:0]	m_dest,
	output wire [USER_WIDTH-1:0]	m_user,
	output wire [ID_WIDTH-1:0]	m_id,
	output wire [DATA_WIDTH/8-1:0]	m_strb
);
	wire [DATA_WIDTH-1:0]	data_in;
	wire [DATA_WIDTH/8-1:0]	keep_in;
	wire			last_in;
	wire [DEST_WIDTH-1:0]	dest_in;
	wire [USER_WIDTH-1:0]	user_in;
	wire [ID_WIDTH-1:0]	id_in;
	wire [DATA_WIDTH/8-1:0]	strb_in;

genvar i;
generate
	for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin: loop1
		assign m_data[DATA_WIDTH-1-i*8:DATA_WIDTH-8-i*8] = data_in[i*8+7:i*8];
		assign m_keep[DATA_WIDTH/8-1-i] = keep_in[i];
		assign m_strb[DATA_WIDTH/8-1-i] = strb_in[i];
	end
	for (i = 0; i < DEST_WIDTH; i = i + 1) begin: loop2
		assign m_dest[DEST_WIDTH-1-i] = dest_in[i];
	end
	for (i = 0; i < USER_WIDTH; i = i + 1) begin: loop3
		assign m_user[USER_WIDTH-1-i] = user_in[i];
	end
	for (i = 0; i < ID_WIDTH; i = i + 1) begin: loop4
		assign m_id[ID_WIDTH-1-i] = id_in[i];
	end
endgenerate

	assign m_valid = s_valid;
	assign m_last = last_in;
	assign s_ready = ready_in;

	assign data_in = HAS_DATA ? s_data : {DATA_WIDTH{1'b0}};
	assign keep_in = HAS_KEEP ? s_keep : {{DATA_WIDTH/8}{1'b1}};
	assign last_in = HAS_LAST ? s_last : 1'b1;
	assign ready_in = HAS_READY ? m_ready : 1'b1;
	assign dest_in = HAS_DEST ? s_dest : {DEST_WIDTH{1'b0}};
	assign user_in = HAS_USER ? s_user : {USER_WIDTH{1'b0}};
	assign id_in = HAS_ID ? s_id : {ID_WIDTH{1'b0}};
	assign strb_in = HAS_STRB ? s_strb : {{DATA_WIDTH/8}{1'b0}};
endmodule
