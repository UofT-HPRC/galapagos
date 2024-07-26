
import copy
import tclFileGenerator
from abstractDict import abstractDict
from kernel import kernel
from collections import OrderedDict
from node import node
import os
import socket, struct
import glob
import subprocess



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
                return xmltodict.parse(fd.read())
        elif extension == ".json":
            import json
            with open(file_name) as fd:
                return json.load(fd)
        else:
            print("Unhandled exetension for " + file_name)
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
        for cluster_inst in topClus['cluster']:
            createGW(cluster_inst['apiFile'],cluster_inst['logicalFile'],cluster_inst['mapFile'],path)
            self.list_of_clusters.append([cluster_inst['logicalFile'],cluster_inst['mapFile'],name+"_"+str(cluster_inst['num']),True])
        return
def createGW(logical,map,api,path):
    '''
    creates our gateway
    '''
    print(logical)
    print(map)