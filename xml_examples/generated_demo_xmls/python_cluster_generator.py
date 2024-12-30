import os
cwd = os.getcwd()+"/"
ip_top = "10.2."
mac_top = "0c:c5:2b:3e:"
num_clusters = 200
num_kernels_per_cluster = 201
user_ip_path = "/home/savi/Desktop/imperial/imperial_ip_repo2"

#library variables
space = 0
a = 0

#Library to build xmls
def setup_file(name):
  global a
  a = open(name,"w")
  wr("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")

def close_file():
  global a
  a.close()

def wr(msg, end="\n"):
  a.write(" "*space + msg+ end)

def axp (param, data):
  wr("<"+param+"> "+data+ " </"+param+">")

def xml_open(name, appendix = ""):
  global space
  wr("<"+name+">"+appendix)
  space = space + 4

def xml_close(name):
  global space
  space = space - 4
  wr("</"+name+">")

def reset_space():
  global space
  space = 0

#Make cluster.xml

def make_cluster_entry(i):
  xml_open("cluster")
  axp("name","cluster_"+str(i)+"_inst")
  axp("logicalFile",cwd+"logical_"+"{:03d}".format(i)+".xml")
  axp("mapFile",cwd+"map_{:03d}.xml".format(i))
  axp("apiFile",cwd+"api_{:03d}.xml".format(i))
  axp("gatewayIP",ip_top+str(i)+".0")
  axp("gatewayMac",mac_top+"{:02x}:00".format(i))
  axp("hasGateway","True")
  axp("gatewayBoard", "sidewinder")
  xml_close("cluster")

def make_cluster_xml():
  reset_space()
  setup_file("cluster.xml")
  xml_open("superCluster")
  axp("dns","10.1.9.109")
  for i in range(num_clusters):
    make_cluster_entry(i)
  xml_close("superCluster")
  close_file()

#Make logical files

def make_logicalfile_xml():
  for i in range(num_clusters):
    reset_space()
    setup_file("logical_{:03d}.xml".format(i))
    xml_open("cluster")
    axp("userIpPath",user_ip_path)
    xml_open("kernel"," agregator core")
    axp("type", "open")
    axp("num", "1")
    axp("control", "False")
    axp("clk","ap_clk")
    xml_open("s_axis")
    axp("scope","global")
    axp("name","in_data")
    xml_close("s_axis")
    xml_open("m_axis")
    axp("scope","global")
    axp("name","in_data")
    xml_close("m_axis")
    xml_open("wan")
    axp("enabled","True")
    axp("name","lanniakea_wan")
    xml_close("wan")
    axp("aresetn","ap_rst_n")
    xml_close("kernel")
    xml_open("kernel"," worker_core")
    axp("type", "open")
    axp("num","2")
    axp("rep",str(num_kernels_per_cluster-1))
    axp("control","False")
    axp("clk","ap_clk")
    xml_open("s_axis")
    axp("scope","global")
    axp("name","in_data")
    xml_close("s_axis")
    xml_open("m_axis")
    axp("scope","global")
    axp("name","in_data")
    xml_close("m_axis")
    xml_open("wan")
    axp("enabled","True")
    axp("name","lanniakea_wan")
    xml_close("wan")
    axp("aresetn","ap_rst_n")
    xml_close("kernel")
    xml_close("cluster")
    close_file()

#Make map files

def make_mapfile_xml():
  for i in range(num_clusters):
    reset_space()
    setup_file("map_{:03d}.xml".format(i))
    xml_open("cluster")
    for node in range(num_kernels_per_cluster):
      j = node + 1
      xml_open("node")
      axp("board","sidewinder")
      axp("comm","udp")
      axp("type","hw")
      axp("kernel",str(j))
      axp("autorun","False")
      axp("mac",mac_top+"{:02x}".format(i)+":{:02x}".format(j))
      axp("ip",ip_top+str(i)+"."+str(j))
      xml_close("node")
    xml_close("cluster")
    close_file()

#Make API files

def make_apifile_xml():
  for i in range(num_clusters):
    reset_space()
    setup_file("api_{:03d}.xml".format(i))
    xml_open("cluster")
    xml_open("port")
    axp("form","direct")
    axp("tag","direct_to_1")
    axp("target","1")
    xml_close("port")
    xml_open("port")
    axp("form","broadcast")
    axp("tag","all_but_1")
    for j in range(num_kernels_per_cluster-1):
      axp("target",str(j+2))
    xml_close("port")
    xml_open("port") 
    axp("form","broadcast")
    axp("tag","all")
    for j in range(num_kernels_per_cluster):
      axp("target",str(j+1))
    xml_close("port")
    xml_close("cluster")
    close_file()

make_cluster_xml()
make_logicalfile_xml()
make_mapfile_xml()
make_apifile_xml()
