import getopt, sys
import os
from cluster import cluster


try:
    opts, args = getopt.getopt(sys.argv[1:],"", ["logicalFile=", "mapFile=", "projectName=", "sim=", "path=", 'startSynth='])
except:
    usage()
    sys.exit(2)

logicalFile = None
mapFile = None
projectName = None
sim = 0
path = None
startSynth = 0

for o, a in opts:
    if o in ("--logicalFile"):
        logicalFile = a
    elif o in ("--mapFile"):
        mapFile = a
    elif o in ("--projectName"):
        projectName= a
    elif o in ("--sim"):
        sim = int(a)
    elif o in ("--path"):
        path = a
    elif o in ("--startSynth"):
        if(a):
            startSynth = int(a)
        else:
            startSynth = 0

print("Logical File: " + logicalFile)
print("Map File: " + mapFile)
print("Project Name: " + projectName)
if path is None:
    path = str(os.environ.get('GALAPAGOS_PATH'))+ "/projects"
print("Output path: " + path)


cluster_inst = cluster(projectName, logicalFile, mapFile)
cluster_inst.makeProjectClusterScript(path, startSynth)
cluster_inst.writeClusterTCL(path, sim)
cluster_inst.writeBRAMFile(path, 'mac')
cluster_inst.writeBRAMFile(path, 'ip')
