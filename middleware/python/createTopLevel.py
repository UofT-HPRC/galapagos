import os
import math
aw_fields = ["id","addr","len","size","burst","lock","cache","prot","user","qos","region","valid","ready"]
aw_sizes = [16,40,8,3,2,1,4,3,16,4,4,1,1]
w_fields = ["data","strb","last","valid","ready"]
w_sizes = [128,16,1,1,1]
b_fields = ["id","resp","valid","ready"]
b_sizes = [16,4,1,1]
ar_fields = ["id","addr","len","size","burst","lock","cache","prot","user","qos","region","valid","ready"]
ar_sizes = [16,40,8,3,2,1,4,3,16,4,4,1,1]
r_fields = ["id","data","resp","last","valid","ready"]
r_sizes = [16,128,2,1,1,1]
axis_fields = ["data","keep","dest","id","user","last","valid","ready"]
axis_sizes = [512,64,24,24,16,1,1,1]
wan_axis_fields = ["data","keep","dest","user","last","valid","ready"]
wan_axis_sizes = [512,64,32,16,1,1,1]
axis_base_fields = ["data","keep","last","valid","ready"]
axis_base_sizes = [512,64,1,1,1]
# AXI-Lite Interface
axi_lite_aw_fields = ["addr","valid","ready"]
axi_lite_aw_sizes = [64,1,1]
axi_lite_w_fields = ["data","strb","valid","ready"]
axi_lite_w_sizes = [32,4,1,1]
axi_lite_b_fields = ["resp","valid","ready"]
axi_lite_b_sizes = [2,1,1]
axi_lite_ar_fields = ["addr","valid","ready"]
axi_lite_ar_sizes = [64,1,1]
axi_lite_r_fields = ["data","valid","ready"]
axi_lite_r_sizes = [32,1,1]
### changes for ddr - Charles
aw_ddr_fields = ["id","addr","len","size","burst","lock","cache","prot","qos","valid","ready"]
aw_ddr_sizes = [16,40,8,3,2,1,4,3,4,1,1]
ar_ddr_fields = ["id","addr","len","size","burst","lock","cache","prot","qos","valid","ready"]
ar_ddr_sizes = [16,40,8,3,2,1,4,3,4,1,1]
ddr_fields = ["act_n","adr","ba","bg","ck_c","ck_t","cke","cs_n","dq","dqs_c","dqs_t","odt","reset_n","par"]
b_ddr_sizes = [16,2,1,1]
###

def add_axi_defn_field(preamble,name,portname,cat,field,has_id,has_user):
    result_str = ""
    for i in range (len(field)):
        if ((field[i] != "id") or has_id) and ((field[i] != "user") or has_user):
            result_str = result_str + preamble+",."+portname+"_"+cat+field[i]+"("+name+"_"+cat+field[i]+")\n"
    return result_str + "\n";
def add_axi_defn_field_set_id_user(preamble,name,portname,cat,field,id,user):
    result_str = ""
    for i in range (len(field)):
        if (field[i] == 'id'):
            result_str = result_str + preamble + ",." + portname + "_" + cat + "id(" + str(id)+ ")\n"
        elif  (field[i] == "user"):
            result_str = result_str + preamble + ",." + portname + "_" + cat + "user(" + str(user) + ")\n"
        else:
            result_str = result_str + preamble+",."+portname+"_"+cat+field[i]+"("+name+"_"+cat+field[i]+")\n"
    return result_str + "\n";
def add_axim_masked_field(preamble,name,portname,cat,field,has_id,has_user):
    result_str = ""
    for i in range (len(field)):
        if ((field[i] != "id") or has_id) and ((field[i] != "user") or has_user) and (field[i]!='ready'):
            result_str = result_str + preamble+",."+portname+"_"+cat+field[i]+"(0)\n"
    return result_str + "\n";
def add_axi_wire_field(preamble,name,cat,field,size,id,data,addr):
    result_str = ""
    for i in range(len(field)):
        if field[i] == "id":
            if id > 0:
                result_str = result_str + preamble+"wire [" + str(id-1) + ":0]"+name+"_"+cat+"id;\n"
        elif field[i] == "data":
            result_str = result_str + preamble+"wire [" + str(data-1) + ":0]"+name+"_"+cat+"data;\n"
        elif field[i] == "addr":
            result_str = result_str + preamble+"wire [" + str(addr-1) + ":0]"+name+"_"+cat+"addr;\n"
        elif field[i] == "strb":
            result_str = result_str + preamble+"wire [" + str(int(data/8-1)) + ":0]"+name+"_"+cat+"strb;\n"
        elif field[i] == "keep":
            result_str = result_str + preamble+"wire [" + str(int(data/8-1)) + ":0]"+name+"_"+cat+"keep;\n"
        else:
            result_str = result_str + preamble+"wire [" + str(size[i]-1) + ":0]"+name+"_"+cat+field[i]+";\n"
    return result_str + "\n";

def construct_axi_wire(preamble,name,id_size,data_size,addr_size):
    result_str=add_axi_wire_field(preamble,name,"aw",aw_fields,aw_sizes,id_size,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"w",w_fields,w_sizes,id_size,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"b",b_fields,b_sizes,id_size,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"ar",ar_fields,ar_sizes,id_size,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"r",r_fields,r_sizes,id_size,data_size,addr_size)
    return(result_str+"\n")
    
def construct_axi_defn(preamble,name,portname,has_id,has_user):
    result_str=add_axi_defn_field(preamble,name,portname,"aw",aw_fields,has_id,has_user)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"w",w_fields,has_id,False)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"b",b_fields,has_id,False)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"ar",ar_fields,has_id,has_user)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"r",r_fields,has_id,False)
    return(result_str+"\n")

def construct_axi_lite_wire(preamble,name,data_size,addr_size):
    """
        Creates all main and side-channel signals for an AXI-Lite interface. Turns M_AXIL into:
        wire [63:0] M_AXIL_awaddr;
        wire [0:0] M_AXIL_awvalid;
        ...

        Args:
            preamble(string): How much to indent each line (eg. for 4 spaces use "    ")
            name(string): Name of the interface (eg. M_AXIL)
            data_size(int): Allows user to override the data size specified in fields above
            addr_size(int): Allows user to override the address size specified in fields above
    """
    # No IDs used in AXI-Lite, set width to 0
    result_str=add_axi_wire_field(preamble,name,"aw",axi_lite_aw_fields,axi_lite_aw_sizes,0,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"w",axi_lite_w_fields,axi_lite_w_sizes,0,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"b",axi_lite_b_fields,axi_lite_b_sizes,0,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"ar",axi_lite_ar_fields,axi_lite_ar_sizes,0,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"r",axi_lite_r_fields,axi_lite_r_sizes,0,data_size,addr_size)
    return(result_str+"\n")

def construct_axi_lite_defn(preamble,name,portname):
    """
        Connects the wire "name" to a port called "portname". Eg. construct_axi_lite_defn(" ", "M_AXIL", "eth_tx") results in:
        .eth_tx_awaddr(M_AXIL_awaddr),
        .eth_tx_awvalid(M_AXIL_awvalid),
        ...

        Args:
            preamble(string): How much to indent each line (eg. for 4 spaces use "    ")
            name(string): Name of the wire (eg. M_AXIL)
            portname(string): Name of the port (eg. eth_tx)
    """
    # AXI-Lite has no IDs or User fields, so set them to 0
    result_str=add_axi_defn_field(preamble,name,portname,"aw",axi_lite_aw_fields,False,False)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"w",axi_lite_w_fields,False,False)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"b",axi_lite_b_fields,False,False)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"ar",axi_lite_ar_fields,False,False)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"r",axi_lite_r_fields,False,False)
    return(result_str+"\n")

### changes for ddr - Charles
def construct_ddr_axi_wire(preamble,name,id_size,data_size,addr_size):
    result_str=add_axi_wire_field(preamble,name,"aw",aw_ddr_fields,aw_ddr_sizes,id_size,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"w",w_fields,w_sizes,id_size,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"b",b_fields,b_ddr_sizes,id_size,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"ar",ar_ddr_fields,ar_ddr_sizes,id_size,data_size,addr_size)
    result_str=result_str+add_axi_wire_field(preamble,name,"r",r_fields,r_sizes,id_size,data_size,addr_size)
    return(result_str+"\n")

def construct_ddr_wire(preamble, name):
    result_str = ""
    for i in range(len(ddr_fields)):
        if ddr_fields[i] == "ba":
            result_str = result_str + preamble + "wire [1:0] " + name + ddr_fields[i] + ";\n"
        elif ddr_fields[i] == "bg":
            result_str = result_str + preamble + "wire [1:0] " + name + ddr_fields[i] + ";\n"
        elif ddr_fields[i] == "adr":
            result_str = result_str + preamble + "wire [16:0] " + name + ddr_fields[i] + ";\n"
        elif ddr_fields[i] == "dq":
            result_str = result_str + preamble + "wire [71:0] " + name + ddr_fields[i] + ";\n"
        elif ddr_fields[i] == "dqs_c":
            result_str = result_str + preamble + "wire [17:0] " + name + ddr_fields[i] + ";\n"
        elif ddr_fields[i] == "dqs_t":
            result_str = result_str + preamble + "wire [17:0] " + name + ddr_fields[i] + ";\n"
        else:
            result_str = result_str + preamble + "wire [0:0] " + name + ddr_fields[i] + ";\n"
    return(result_str+"\n")

def construct_ddr_defn(preamble, name, portname):
    result_str = ""
    for i in range(len(ddr_fields)):
        result_str = result_str + preamble + ",." + portname + "_" + ddr_fields[i] + "(" + name + "_" + ddr_fields[i] + ")\n"
    return(result_str+"\n")

def construct_ddr_axi_defn(preamble,name,portname,has_id,has_user):
    result_str=add_axi_defn_field(preamble,name,portname,"aw",aw_ddr_fields,has_id,has_user)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"w",w_fields,has_id,False)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"b",b_fields,has_id,False)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"ar",ar_ddr_fields,has_id,has_user)
    result_str=result_str+add_axi_defn_field(preamble,name,portname,"r",r_fields,has_id,False)
    return(result_str+"\n")
###

def construct_axis_wire(preamble,name,data_size,id_size, has_ready):
    if has_ready:
        return(add_axi_wire_field(preamble,name,"t",axis_fields,axis_sizes,id_size,data_size,0)+"\n")
    else:
        return(add_axi_wire_field(preamble,name,"t",axis_fields[:-1],axis_sizes[:-1],id_size,data_size,0)+"\n")
    
def construct_axis_defn(preamble,name,portname, has_ready,has_user,has_id):
    if has_ready:
        return(add_axi_defn_field(preamble,name,portname,"t",axis_fields,has_id,has_user)+"\n")
    else:
        return(add_axi_defn_field(preamble,name,portname,"t",axis_fields[:-1],has_id,has_user)+"\n")

def construct_axis_base_defn(preamble,name,portname, has_ready):
    if has_ready:
        return(add_axi_defn_field(preamble,name,portname,"t",axis_base_fields,False,False)+"\n")
    else:
        return(add_axi_defn_field(preamble,name,portname,"t",axis_base_fields[:-1],False,False)+"\n")

def copy_file(dest_fp,src_filename):
    src_file = open(src_filename,"r")
    dest_fp.write(src_file.read())
    src_file.close()

def createTopLevelVerilog(target_files, source_dir, kernel_properties,ctrl_kernel_dict,fpga,is_gw):
    dst_file = open(target_files,"w")
    if fpga['board'] in ('u200','u250','u280'):
        if fpga.has_ddr:
            copy_file(dst_file, source_dir + "/../verilog/shellTop_u2xx_ddr/shellTop_u2xx_ddr_pt1.v")
            if fpga['slr_mappings']['SLR0']['kernel']:
                dst_file.write(",\n    SYSCLK0_300_clk_p")
                dst_file.write(",\n    SYSCLK0_300_clk_n")
                for i in range(len(ddr_fields)):
                    dst_file.write(",\n    c0_ddr4_" + ddr_fields[i])
            if fpga['slr_mappings']['SLR1']['kernel']:
                dst_file.write(",\n    SYSCLK1_300_clk_p")
                dst_file.write(",\n    SYSCLK1_300_clk_n")
                for i in range(len(ddr_fields)):
                    dst_file.write(",\n    c1_ddr4_" + ddr_fields[i])
            copy_file(dst_file, source_dir + "/../verilog/shellTop_u2xx_ddr/shellTop_u2xx_ddr_pt2.v")
            if fpga['slr_mappings']['SLR0']['kernel']:
                copy_file(dst_file, source_dir + "/../verilog/shellTop_u2xx_ddr/shellTop_u2xx_ddr_c0_inout.v")
            if fpga['slr_mappings']['SLR1']['kernel']:
                copy_file(dst_file, source_dir + "/../verilog/shellTop_u2xx_ddr/shellTop_u2xx_ddr_c1_inout.v")
        else:
            copy_file(dst_file, source_dir + "/../verilog/shellTop_pt1_u2xx.v")
    elif fpga.has_ddr:
        copy_file(dst_file, source_dir + "/../verilog/shellTop_pt1_ddr.v") # Charles
    else:
        copy_file(dst_file, source_dir + "/../verilog/shellTop_pt1.v")

    # Create the wires that connect PR, Shell, and user BD's
    dst_file.write(construct_axis_wire("  ","M_AXIS",512,0,True))
    dst_file.write(construct_axis_wire("  ","S_AXIS",512,0,False))
    for kern in ctrl_kernel_dict:
        kernel_dict = ctrl_kernel_dict[kern]
        if kernel_dict['control_type'] == 'm_axil' or kernel_dict['control_type'] == 'both':
            dst_file.write(construct_axi_lite_wire("  ", kern+"_M_AXIL",32,64))
        if kernel_dict['control_type'] == 's_axil' or kernel_dict['control_type'] == 'both':
            dst_file.write(construct_axi_lite_wire("  ", kern+"_S_AXIL",32,64))
    if fpga.has_ddr:
        if fpga['board'] in ('u200','u250','u280'):
            if fpga['slr_mappings']['SLR0']['kernel']:
                dst_file.write("  wire [0:0]SYSCLK0_300_clk_p;\n")
                dst_file.write("  wire [0:0]SYSCLK0_300_clk_n;\n")
                dst_file.write(construct_ddr_wire("  ", "c0_ddr4_"))
            if fpga['slr_mappings']['SLR1']['kernel']:
                dst_file.write("  wire [0:0]SYSCLK1_300_clk_p;\n")
                dst_file.write("  wire [0:0]SYSCLK1_300_clk_n;\n")
                dst_file.write(construct_ddr_wire("  ", "c1_ddr4_"))
        else:
            dst_file.write(construct_ddr_axi_wire("  ", "ddr4_AXI", fpga.max_ddr_id_width + math.ceil(math.log2(len(fpga['kernel']))),512, 34))
        for i in range(len(fpga['kernel'])):
            dst_file.write(construct_ddr_axi_wire("  ", "kernel" + str(fpga['kernel'][i]['num']) + "_ddr4_AXI", 8, 512,34))
    for props in kernel_properties:
        name=props['inst']
        dst_file.write(construct_axis_wire("  ", str(name) + "_MAXIS", 512, 24, True))
        dst_file.write(construct_axis_wire("  ", str(name) + "_SAXIS", 512, 24, True))
        if props['wan_enabled'][0]:
            dst_file.write(add_axi_wire_field("  ", str(name) + "_SWAN","t", wan_axis_fields, wan_axis_sizes, 0, 512, 0) + "\n")
        if is_gw:
            dst_file.write(add_axi_wire_field("  ","Direct_port","t",["data","keep","user","last","valid","ready"],[512,64,64,1,1,1],0,512,0)+"\n")

    # Instantiate Shell, and write additional connections under it
    if fpga['board'] in ('u200','u250','u280'):
        copy_file(dst_file, source_dir + "/../verilog/shellTop_pt2_u2xx.v")
    elif fpga.has_ddr:
        copy_file(dst_file, source_dir + "/../verilog/shellTop_pt2_ddr.v") # Charles
    else:
        copy_file(dst_file, source_dir + "/../verilog/shellTop_pt2.v")
    dst_file.write(construct_axis_base_defn("    ","M_AXIS","eth_tx",True))
    dst_file.write(construct_axis_base_defn("    ","S_AXIS","eth_rx",False))
    if fpga.has_ddr:
        if fpga['board'] not in ('u200', 'u250', 'u280'):
            dst_file.write(construct_ddr_axi_defn("    ", "ddr4_AXI", "ddr4_AXI", True, True))  # Charles
    copy_file(dst_file,source_dir+"/../verilog/shellTop_pt3.v")
    dst_file.write(construct_axis_base_defn("    ","M_AXIS","M_AXIS",True))
    dst_file.write(construct_axis_base_defn("    ","S_AXIS","S_AXIS",False))
    if fpga.has_ddr:
        if fpga['board'] not in ('u200', 'u250', 'u280'):
            dst_file.write(construct_ddr_axi_defn("    ", "ddr4_AXI", "ddr4_AXI", True, True))
        else:
            if fpga['slr_mappings']['SLR0']['kernel']:
                dst_file.write("    ,.SYSCLK0_300_clk_p(SYSCLK0_300_clk_p)\n")
                dst_file.write("    ,.SYSCLK0_300_clk_n(SYSCLK0_300_clk_n)\n")
                dst_file.write(construct_ddr_defn("    ", "c0_ddr4", "c0_ddr4"))
            if fpga['slr_mappings']['SLR1']['kernel']:
                dst_file.write("    ,.SYSCLK1_300_clk_p(SYSCLK1_300_clk_p)\n")
                dst_file.write("    ,.SYSCLK1_300_clk_n(SYSCLK1_300_clk_n)\n")
                dst_file.write(construct_ddr_defn("    ", "c1_ddr4", "c1_ddr4"))
    for props in kernel_properties:
        name=props['inst']
        dst_file.write("\n\n    //User: "+str(name)+"\n")
        if is_gw:
            dst_file.write(construct_axis_defn("      ",str(name)+"_MAXIS",str(name)+"_MAXIS",True,True,False))
        else:
            dst_file.write(construct_axis_defn("      ",str(name)+"_MAXIS",str(name)+"_MAXIS",True,True,True))
        dst_file.write(add_axi_defn_field_set_id_user("      ",str(name)+"_SAXIS",str(name)+"_SAXIS","t",axis_fields,props['id'],0))
        if fpga.has_ddr:
            for i in fpga['kernel']:
                if str(i['num']) == name[-1] and i['ddr']:
                    dst_file.write(construct_ddr_axi_defn("    ", "kernel" + str(name)[-1] + "_ddr4_AXI", str(name) + "_DDR_SAXI", True,True))  # Charles
        if props['wan_enabled'][0]:
            dst_file.write(add_axi_defn_field("      ",str(name) + "_SWAN",str(name) + "_SWAN","t",wan_axis_fields,False,True)+"\n")
        if is_gw:
            dst_file.write(add_axi_defn_field("      ","Direct_port","Direct_port","t",["data","keep","user","last","valid","ready"],0,1))
        # Control
        if name in ctrl_kernel_dict:
            kernel_dict = ctrl_kernel_dict[name]
            if kernel_dict['control_type'] == 'm_axil' or kernel_dict['control_type'] == 'both':
                dst_file.write(construct_axi_lite_defn("    ",name+"_M_AXIL",name+"_M_AXIL"))
            if kernel_dict['control_type'] == 's_axil' or kernel_dict['control_type'] == 'both':
                dst_file.write(construct_axi_lite_defn("    ",name+"_S_AXIL",name+"_S_AXIL"))
    dst_file.write("    );\n\n\n")
    
    # Instantiate all user Block Diagrams and add connections
    for props in kernel_properties:
        name=props['inst']
        Sname=props['slave_name']
        Mname=props['master_name']
        clkname = props['clock_name']
        rstname = props['reset_name']

        dst_file.write("  //User: "+str(name)+"\n  user_"+str(name)+"_i user_"+str(name)+"_i_i\n    (."+rstname+"(rstn)\n    ,."+clkname+"(CLK)\n")
        if props['has_id']:
            dst_file.write("    ,."+props['id_port']+"("+str(props['id'])+")\n")
        dst_file.write(construct_axis_defn("    ",str(name)+"_MAXIS",Sname,True,True, (not is_gw)))
        dst_file.write(construct_axis_defn("    ",str(name)+"_SAXIS",Mname,True,False,False))
        if fpga.has_ddr:
            for i in fpga['kernel']:
                if str(i['num']) == name[-1] and i['ddr']:
                    dst_file.write(construct_ddr_axi_defn("    ", "kernel" + str(name)[-1] + "_ddr4_AXI", "out_ddr", True,True))  # Charles
        if props['wan_enabled'][0]:
            dst_file.write(add_axi_defn_field("      ", str(name) + "_SWAN", props['wan_name'][0], "t", wan_axis_fields, False, True) + "\n")
        if is_gw:
            dst_file.write(add_axi_defn_field("      ","Direct_port","Direct_port","t",["data","keep","user","last","valid","ready"],0,1))
        # Control
        if name in ctrl_kernel_dict:
            kernel_dict = ctrl_kernel_dict[name]
            if kernel_dict['control_type'] == 'm_axil' or kernel_dict['control_type'] == 'both':
                dst_file.write(construct_axi_lite_defn("    ",name+"_M_AXIL","M_AXIL"))
            if kernel_dict['control_type'] == 's_axil' or kernel_dict['control_type'] == 'both':
                dst_file.write(construct_axi_lite_defn("    ",name+"_S_AXIL","S_AXIL"))
        dst_file.write("    );\n\n\n")
    dst_file.write("  endmodule")
    dst_file.close()

### changes for ddr - Charles
def createMemoryPartitioner(target_files, source_dir, phy_addr_prefix, vir_addr_len, num, id_width):
    dst_file = open(target_files,"w")
    dst_file.write("`timescale 1 ps / 1ps\n\n")
    dst_file.write("module addr_translator_kern" + num + "(\n")
    copy_file(dst_file, source_dir + "/../verilog/memPartitioner_pt1.v")

    prefix_len = phy_addr_prefix.bit_length()
    # print(phy_addr_prefix)
    # print(prefix_len)
    width = int(id_width) - 1
    dst_file.write("    input wire [" + str(width) + ":0] s0_axi_awid;\n")
    dst_file.write("    input wire [" + str(width) + ":0] s0_axi_arid;\n")
    dst_file.write("    output wire [" + str(width) + ":0] s0_axi_bid;\n")
    dst_file.write("    output wire [" + str(width) + ":0] s0_axi_rid;\n")
    dst_file.write("    output wire [" + str(width) + ":0] m0_axi_awid;\n")
    dst_file.write("    output wire [" + str(width) + ":0] m0_axi_arid;\n")
    dst_file.write("    input wire [" + str(width) + ":0] m0_axi_bid;\n")
    dst_file.write("    input wire [" + str(width) + ":0] m0_axi_rid;\n\n")

    if prefix_len == 0:
        dst_file.write("    assign m0_axi_awaddr = s0_axi_awaddr;\n")
        dst_file.write("    assign m0_axi_araddr = s0_axi_araddr;\n")
    else:
        dst_file.write("    assign m0_axi_awaddr = {" + str(prefix_len) + "'h" + hex(phy_addr_prefix)[2:] + ", " + "s0_axi_awaddr[" + str(vir_addr_len - 1) + ":0]};\n")
        dst_file.write("    assign m0_axi_araddr = {" + str(prefix_len) + "'h" + hex(phy_addr_prefix)[2:] + ", " + "s0_axi_araddr[" + str(vir_addr_len - 1) + ":0]};\n")

    for i in range(len(aw_ddr_fields)):
        if aw_ddr_fields[i] is not "addr":
            if aw_ddr_fields[i] is not "ready":
                dst_file.write("    assign m0_axi_aw" + aw_ddr_fields[i] + " = " + "s0_axi_aw" + aw_ddr_fields[i] + ";\n")
            else:
                dst_file.write("    assign s0_axi_aw" + aw_ddr_fields[i] + " = " + "m0_axi_aw" + aw_ddr_fields[i] + ";\n")
    dst_file.write("\n")
    for i in range(len(ar_ddr_fields)):
        if ar_ddr_fields[i] is not "addr":
            if ar_ddr_fields[i] is not "ready":
                dst_file.write("    assign m0_axi_ar" + ar_ddr_fields[i] + " = " + "s0_axi_ar" + ar_ddr_fields[i] + ";\n")
            else:
                dst_file.write("    assign s0_axi_ar" + ar_ddr_fields[i] + " = " + "m0_axi_ar" + ar_ddr_fields[i] + ";\n")
    dst_file.write("\n")
    for i in range(len(b_fields)):
        if b_fields[i] is not "ready":
            dst_file.write("    assign s0_axi_b" + b_fields[i] + " = " + "m0_axi_b" + b_fields[i] + ";\n")
        else:
            dst_file.write("    assign m0_axi_b" + b_fields[i] + " = " + "s0_axi_b" + b_fields[i] + ";\n")
    dst_file.write("\n")
    for i in range(len(w_fields)):
        if w_fields[i] is not "ready":
            dst_file.write("    assign m0_axi_w" + w_fields[i] + " = " + "s0_axi_w" + w_fields[i] + ";\n")
        else:
            dst_file.write("    assign s0_axi_w" + w_fields[i] + " = " + "m0_axi_w" + w_fields[i] + ";\n")
    dst_file.write("\n")
    for i in range(len(r_fields)):
        if r_fields[i] is not "ready":
            dst_file.write("    assign s0_axi_r" + r_fields[i] + " = " + "m0_axi_r" + r_fields[i] + ";\n")
        else:
            dst_file.write("    assign m0_axi_r" + r_fields[i] + " = " + "s0_axi_r" + r_fields[i] + ";\n")
    # dst_file.write(construct_ddr_axi_wire("  ", "s_axi", 1, 512, 34))
    # for idx, (start, end) in enumerate(partition):
    #     dst_file.write("34'h" + str(hex(start)[2:]))
    #     if idx != len(partition) - 1:
    #         dst_file.write(", ")
    # dst_file.write("};\n")
    #
    # dst_file.write("  always @(*) begin\n")
    # dst_file.write("      s_axi_awaddr <= s_axi_awaddr + addr_map[kernel_id];\n")
    # dst_file.write("      s_axi_araddr <= s_axi_araddr + addr_map[kernel_id];\n")
    # copy_file(dst_file, source_dir + "/../verilog/memPartitioner_pt2.v")

    dst_file.write("  endmodule")
    dst_file.close()
###