import getopt, sys
import os
import gatewayFileGenerator

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
    opts, args = getopt.getopt(sys.argv[1:],"", ["apiFile=", "projectName=", "sim=", "path="])
except:
    usage()
    sys.exit(2)

apiFile = None
projectName = None
sim = 0
path = None

for o, a in opts:
    if o in ("--apiFile"):
        apiFile = a
    elif o in ("--projectName"):
        projectName= a
    elif o in ("--sim"):
        sim = int(a)
    elif o in ("--path"):
        path = a

if path is None:
    path = str(os.environ.get('GALAPAGOS_PATH'))+ "/projects/"+projectName
list_of_clusters = []
supercluster = False
os.makedirs(path, exist_ok=True)
topAPI = getDict(apiFile)['cluster']
api_info = gatewayFileGenerator.query_API(path, topAPI)
