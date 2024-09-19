

from abstractDict import abstractDict
import os
import pickle
import subprocess
import gatewayFileGenerator


class lancluster(abstractDict):
    """ This class is the top-level interface to the myriad other objects used
    by Galapagos. Note that the globalFPGAParser provides a rudimentary command
    line tool to interact with these cluster objects. """

    def getDict(self, file_name):
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
                print(file_name)
                print(fd)
                contents = fd.read()
                print(contents)
                return xmltodict.parse(contents)
        elif extension == ".json":
            import json
            with open(file_name) as fd:
                return json.load(fd)
        else:
            print("Unhandled extension for " + file_name)
            return None

    def __init__(self, name, cluster_file, path, mode='file'):
        """
        Initializes the cluster object using logical file and mapping file

        Args:
            name (string?): Cluster's name. Set this to project name?
            kernel_file (string): Filename of XML logical file
            map_file (string): Filename of XML mapping file
        """
        self.name = name
        self.list_of_clusters = []
        if(mode=='file'):
            topClus = self.getDict(cluster_file)['superCluster']
        else:
            topClus = cluster_file
        if 'dns' not in topClus:
            raise ValueError ("dns must be specified in the cluster file")

        for cluster_inst in topClus['cluster']:
            cluster_name = name+"/"+cluster_inst["name"]
            if (" " in cluster_inst["name"]):
                raise ValueError ("Cluster names can not contain spaces")
            new_cluster = {"name":name+"_"+str(cluster_inst['name']), "logic":cluster_inst['logicalFile'],
                           "map":cluster_inst['mapFile'],"dns":topClus['dns'],"cl_name":cluster_name}
            if ("hasGateway" not in cluster_inst) or str(cluster_inst["hasGateway"]).lower().strip() == "false":
                new_cluster = {**new_cluster, 'gatewayIP': '0.0.0.0',
                               'gatewayMac': '00:00:00:00:00:00', 'gatewayBoard': 'sidewinder',
                               'apiRef': '', "has_dns": False}
                self.list_of_clusters.append(new_cluster)
            elif str(cluster_inst["hasGateway"]).lower().strip() == "true":
                new_cluster = {**new_cluster, 'gatewayIP': cluster_inst['gatewayIP'],
                               'gatewayMac': cluster_inst['gatewayMac'], 'gatewayBoard': cluster_inst['gatewayBoard'],
                               'apiRef': cluster_inst["apiFile"], "has_dns": True}
                self.list_of_clusters.append(new_cluster)
            else:
                raise ValueError("hasGateway must be either true or false")
        return
def save_api_info(array,filepath):
    fp=open(filepath+"clusterinfo.clinfo","wb")
    pickle.dump(array,fp)
    fp.close()


def process_api_info(files,destination_folder):
    infoArray = []
    test_list = open(destination_folder+"dns_map.txt","w")
    api_info_file = open(destination_folder+"api_plaintext.txt","w")
    api_csv_file = open(destination_folder+"api_database.csv","w")
    for file in files:
        fp=open(file,"rb")
        infoArray= infoArray + pickle.load(fp)
    subprocess.run(["cp", str(os.environ.get('GALAPAGOS_PATH'))+"/dns/dns.py",destination_folder+"/dns.py"])

    test_list.write("0:0.0.0.0\n")
    cur_num = 1
    There_are_inaccessible = False
    dns_ip = infoArray[0]['dns_ip']
    First = True
    for info in infoArray:
        if info['has_gateway']:
            if not First:
                api_csv_file.write("\n")
            First = False
            if dns_ip != info['dns_ip']:
                raise ValueError ("DNS IP is inconsistent between the clusters being merged")
            test_list.write(str(cur_num)+":"+info['gateway_ip'])
            api_info_file.write("Gateway: "+info['name']+"\n")
            api_csv_file.write(info['name']+"\n"+str(info["length"])+"\n")
            api_info_file.write("With Laniakea Cluster Number: " + str(cur_num) + "\n")
            api_csv_file.write(str(cur_num) + "\n")
            api_info_file.write("Located at Gateway IP: " + info['gateway_ip'] + "\n")
            api_csv_file.write(info['gateway_ip'] + "\n")
            api_info_file.write(gatewayFileGenerator.generate_api_report(info,True))
            api_csv_file.write(gatewayFileGenerator.generate_api_report(info, False))
            api_info_file.write("-"*50 +"\n"*3)
            cur_num = cur_num + 1
        else:
            There_are_inaccessible = True
    if There_are_inaccessible:
        api_info_file.write("The following Clusters were built without a Gateway and are inaccessible externally\n")
        api_info_file.write("They can however send requests to other clusters::\n")
        for info in infoArray:
            if not info['has_gateway']:
                api_info_file.write("Gateway: "+info['name']+"\n")
    dns_file = open(destination_folder + "/dns.py", "a")
    dns_file.write("\n    ip_server(\""+dns_ip+"\", DNS_PORT, \""+destination_folder+"dns_map.txt\")")
    dns_file.close()
