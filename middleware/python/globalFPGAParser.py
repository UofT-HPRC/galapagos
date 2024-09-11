import getopt, sys
import os
from cluster import cluster
import lancluster
CAMILO_TEMP_DEBUG = False
try:
    opts, args = getopt.getopt(sys.argv[1:],"", ["logicalFile=", "mapFile=", "projectName=", "clusterFile=", "sim=", "path="])
except:
    usage()
    sys.exit(2)

logicalFile = None
mapFile = None
projectName = None
sim = 0
path = None
clusterFile = None

for o, a in opts:
    if o in ("--logicalFile"):
        logicalFile = a
    elif o in ("--mapFile"):
        mapFile = a
    elif o in ("--clusterFile"):
        clusterFile = a
    elif o in ("--projectName"):
        projectName= a
    elif o in ("--sim"):
        sim = int(a)
    elif o in ("--path"):
        path = a

if path is None:
    path = str(os.environ.get('GALAPAGOS_PATH'))+ "/projects"
list_of_clusters = []
list_of_api_info = []
lan_flow = True
if clusterFile == None:
    lan_flow = False
    new_cluster = {"name": projectName, "logic": logicalFile,'apiRef': '', "has_dns": False,
                   "map": mapFile, "dns": '0.0.0.0', "cl_name": projectName+"/Galapagos_main",
                   'gatewayIP': '0.0.0.0', 'gatewayMac': '00:00:00:00:00:00', 'gatewayBoard': 'sidewinder'}
    list_of_clusters.append(new_cluster)
else:

    laniakea_inst = lancluster.lancluster(projectName, clusterFile, path)
    list_of_clusters = laniakea_inst.list_of_clusters

for cluster_loc in list_of_clusters:
    cluster_inst = cluster(cluster_loc,lan_flow)
    cluster_inst.processMemoryBus()
    cluster_inst.checkDDR()  # Charles
    cluster_inst.makeProjectClusterScript(path,cluster_loc['has_dns'])
    if cluster_loc['has_dns']:
        api_info = cluster_inst.writeGatewayFile(path,cluster_loc['apiRef'])
    else:
        api_info = {"has_gateway": False,"num":0}
    api_info['name'] = cluster_loc['cl_name']
    api_info['dns_ip'] = cluster_loc['dns']
    list_of_api_info.append(api_info)
    cluster_inst.writeClusterTCL(path, sim, cluster_loc['has_dns'],api_info,CAMILO_TEMP_DEBUG)

    cluster_inst.writeBRAMFile(path, 'mac')
    cluster_inst.writeBRAMFile(path, 'ip')
if lan_flow:
    clusterFilepath = str(os.environ.get('GALAPAGOS_PATH'))+ "/projects/"+projectName+"_cluster_files/"
    os.makedirs(clusterFilepath, exist_ok=True)
    lancluster.save_api_info(list_of_api_info,clusterFilepath)
    lancluster.process_api_info([clusterFilepath +"clusterinfo.clinfo"],clusterFilepath)