import getopt, sys
import os
import lancluster

def getDict(file_name):
    """
    Checks whether a file's extension is ".xml" or ".json", and parses the
    file (depending on the extension) as XML or JSON.

    Args:
        file_name (string): File name

    Returns:
        Python dict filled with info from file. Hierarchy is faithfully
        reproduced.
    """
    filename, extension = os.path.splitext(file_name)
    if extension == ".xml":
        try:
            import xmltodict
        except ImportError:
            print("xmltodict module not installed in Python")
            exit(1)
        with open(file_name) as fd:
            return xmltodict.parse(fd.read())
    elif extension == ".json":
        import json
        with open(file_name) as fd:
            return json.load(fd)
    else:
        print("Unhandled exetension for " + file_name)
        return None

try:
    opts, args = getopt.getopt(sys.argv[1:],"", ["clinfoFiles=", "projectName=", "sim=", "path="])
except:
    usage()
    sys.exit(2)

apiFile = None
projectName = None
sim = 0
path = None

for o, a in opts:
    if o in ("--clinfoFiles"):
        apiFile = a
    elif o in ("--projectName"):
        projectName= a
    elif o in ("--sim"):
        sim = int(a)

clusterFilepath = str(os.environ.get('GALAPAGOS_PATH'))+ "/projects/"+projectName+"_cluster_files"
os.makedirs(clusterFilepath, exist_ok=True)
apiFile=apiFile.split(" ")
lancluster.process_api_info(apiFile,clusterFilepath)