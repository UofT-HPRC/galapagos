import getopt, sys
import os
from cluster import cluster
from lancluster import lancluster
import subprocess

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
supercluster = False
if clusterFile == None:
    supercluster = False
    list_of_clusters.append([logicalFile,mapFile,projectName,False])
else:

    laniakea_inst = lancluster(projectName, clusterFile, path)
    list_of_clusters = laniakea_inst.list_of_clusters

for cluster_loc in list_of_clusters:
    print(cluster_loc)
    cluster_inst = cluster(cluster_loc[2], cluster_loc[0], cluster_loc[1], cluster_loc[3])
    cluster_inst.processMemoryBus()
    cluster_inst.makeProjectClusterScript(path)
    cluster_inst.writeClusterTCL(path, sim)
    cluster_inst.writeBRAMFile(path, 'mac')
    cluster_inst.writeBRAMFile(path, 'ip')