import os
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

axis_base_fields = ["data","keep","last","valid","ready"]
axis_base_sizes = [512,64,1,1,1]
def add_axi_defn_field(preamble,name,portname,cat,field,has_id,has_user):
    result_str = ""
    for i in range (len(field)):
        if ((field[i] != "id") or has_id) and ((field[i] != "user") or has_user):
            result_str = result_str + preamble+",."+portname+"_"+cat+field[i]+"("+name+"_"+cat+field[i]+")\n"
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
    
def construct_axis_wire(preamble,name,data_size,id_size, has_ready):
    if has_ready:
        return(add_axi_wire_field(preamble,name,"t",axis_fields,axis_sizes,id_size,data_size,0)+"\n")
    else:
        return(add_axi_wire_field(preamble,name,"t",axis_fields[:-1],axis_sizes[:-1],id_size,data_size,0)+"\n")
    
def construct_axis_defn(preamble,name,portname, has_ready):
    if has_ready:
        return(add_axi_defn_field(preamble,name,portname,"t",axis_fields,True,True)+"\n")
    else:
        return(add_axi_defn_field(preamble,name,portname,"t",axis_fields[:-1],True,True)+"\n")

def construct_axis_base_defn(preamble,name,portname, has_ready):
    if has_ready:
        return(add_axi_defn_field(preamble,name,portname,"t",axis_base_fields,False,False)+"\n")
    else:
        return(add_axi_defn_field(preamble,name,portname,"t",axis_base_fields[:-1],False,False)+"\n")

def copy_file(dest_fp,src_filename):
    src_file = open(src_filename,"r")
    dest_fp.write(src_file.read())
    src_file.close()

def createTopLevelVerilog(target_files, source_dir, kernel_names):
    dst_file = open(target_files,"w")
    copy_file(dst_file,source_dir+"/../verilog/shellTop_pt1.v")
    dst_file.write(construct_axis_wire("  ","M_AXIS",512,0,True))
    dst_file.write(construct_axis_wire("  ","S_AXIS",512,0,False))
    dst_file.write(construct_axi_wire("  ","S_AXI_CONTROL",16,128,40))
    for i in kernel_names:
        dst_file.write(construct_axi_wire("  ",str(i)+"_CONTROL",16,128,40))
        dst_file.write(construct_axis_wire("  ",str(i)+"_MAXIS",512,24,True))
        dst_file.write(construct_axis_wire("  ",str(i)+"_SAXIS",512,24,True))
    copy_file(dst_file,source_dir+"/../verilog/shellTop_pt2.v")
    dst_file.write(construct_axis_base_defn("    ","M_AXIS","eth_tx",True))
    dst_file.write(construct_axis_base_defn("    ","S_AXIS","eth_rx",False))
    dst_file.write(construct_axi_defn("    ","S_AXI_CONTROL","S_AXI_CONTROL",True,True))
    copy_file(dst_file,source_dir+"/../verilog/shellTop_pt3.v")
    dst_file.write(construct_axis_base_defn("    ","M_AXIS","M_AXIS",True))
    dst_file.write(construct_axis_base_defn("    ","S_AXIS","S_AXIS",False))
    dst_file.write(construct_axi_defn("    ","S_AXI_CONTROL","S_AXI_CONTROL",True,True))
    for i in kernel_names:
        dst_file.write("\n\n    //User: "+str(i)+"\n")
        dst_file.write(construct_axi_defn("      ",str(i)+"_CONTROL",str(i)+"_CONTROL",True,True))
        dst_file.write(construct_axis_defn("      ",str(i)+"_MAXIS",str(i)+"_MAXIS",True))
        dst_file.write(construct_axis_defn("      ",str(i)+"_SAXIS",str(i)+"_SAXIS",True))
    dst_file.write("    );\n\n\n")
    
    for i in kernel_names:
        dst_file.write("  //User: "+str(i)+"\n  user_"+str(i)+"_i user_"+str(i)+"_i_i\n    (.rst(rst)\n    ,.CLK(CLK)\n")
        dst_file.write(construct_axi_defn("    ",str(i)+"_CONTROL","AXI_CONTROL",True,True))
        dst_file.write(construct_axis_defn("    ",str(i)+"_MAXIS","RX_AXIS",True))
        dst_file.write(construct_axis_defn("    ",str(i)+"_SAXIS","TX_AXIS",True))
        dst_file.write("    );\n\n\n")
    dst_file.write("  endmodule")
    dst_file.close()
