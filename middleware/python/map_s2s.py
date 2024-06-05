import getopt, sys
import json
import glob
import queue

def map_s2s(fpga_db, kernel_db, input_logical, input_map, output_map_file_name):

    util = 0.8


    output_map = {"cluster":{"node":[]}}
    available_nodes = queue.Queue() 
    curr_node = 0 

    # first add nodes that are explicitly defined
    node_num = 0


    max_kernel = 0
    if 'node' in input_map["cluster"]:
        for node in input_map["cluster"]["node"]:
            dsp_remaining = util*(fpga_db[node['board']]['total']['dsp'] - fpga_db[node['board']]['shell']['dsp'])
            bram_remaining = util*(fpga_db[node['board']]['total']['bram'] - fpga_db[node['board']]['shell']['bram'])
            uram_remaining = util*(fpga_db[node['board']]['total']['uram'] - fpga_db[node['board']]['shell']['uram'])
            lut_remaining = util*(fpga_db[node['board']]['total']['lut'] - fpga_db[node['board']]['shell']['lut'])
            ff_remaining = util*(fpga_db[node['board']]['total']['ff'] - fpga_db[node['board']]['shell']['ff'])
            node['num'] = node_num;

            node['dsp'] = dsp_remaining
            node['bram'] = bram_remaining
            node['uram'] = uram_remaining
            node['lut'] = lut_remaining
            node['ff'] = ff_remaining
            output_map["cluster"]["node"].append(node)
            available_nodes.put(node_num)
            node_num = node_num+1
            if('used' in fpga_db[node['board']]):
                fpga_db[node['board']]['used'] = fpga_db[node['board']]['used'] + 1
            else:
                fpga_db[node['board']]['used'] = 1

            for kernel in node['kernel']:
                if kernel> max_kernel:
                    max_kernel = kernel

    floating_kernels = []
    if 'floating' in input_map['cluster']:
        for floating_kernel in input_map["cluster"]["floating"]:
            floating_kernels.append(floating_kernel)
            if isinstance(floating_kernel, int):
                if floating_kernel > max_kernel:
                    max_kernel = floating_kernel
            elif isinstance(floating_kernel, list):
                for _floating_kernel in floating_kernel:
                    if _floating_kernel > max_kernel:
                        max_kernel = _floating_kernel


    #print("max_kernel", max_kernel)
    subnet = '10.1.3.0'
    subnet_array = []
    starting_ip = '10.1.3.212'
    if 'subnet' in input_map['cluster']:
        subnet = input_map['cluster']['subnet']
        if 'starting_ip' in input_map['cluster']:
            starting_ip = input_map['cluster']['starting_ip']
    ip_array = starting_ip.split(".")
    ip = int(ip_array[3])
    subnet_array = subnet.split(".")
    subnet = subnet_array[0] + "." + subnet_array[1] + "." + subnet_array[2]

    vendor_mac = 'fa:16:3e'
    comm = 'udp'

    if 'comm' in input_map['cluster']:
        comm = input_map['cluster']['comm']
    #update resource util with anchored kernels

    kernel_list = [None] * (max_kernel + 1)

    #first make a kernel num to kernel name mapping
    for kernel in input_logical['cluster']['kernel']:
        #print(kernel['rep'])
        #print(kernel['num'])
        for i in range(0, kernel['rep']):
            #print(kernel['num'])
            kernel_list[kernel['num'] + i - 1] = kernel

    for node_idx, node in enumerate(output_map["cluster"]["node"]):
        for kernel in node['kernel']:
            kern = kernel_db[kernel_list[kernel]['#text']]
            output_map["cluster"]["node"][curr_node]['dsp'] = node['dsp'] - kern['dsp']
            output_map["cluster"]["node"][curr_node]['bram'] = node['bram'] - kern['bram']
            output_map["cluster"]["node"][curr_node]['uram'] = node['uram'] - kern['uram']
            output_map["cluster"]["node"][curr_node]['ff'] = node['ff'] - kern['ff']
            output_map["cluster"]["node"][curr_node]['lut'] = node['lut'] - kern['lut']


    while(len(floating_kernels) > 0):
        max_kern_del = -1
        for float_idx, floating_kernel in enumerate(floating_kernels):
            if isinstance(floating_kernel, int) and (len(output_map["cluster"]["node"]) > 0):
                kern = kernel_db[kernel_list[floating_kernel]['#text']]
                node = output_map["cluster"]["node"][curr_node]
                if(node['dsp'] > kern['dsp'] and node['bram'] > kern['bram'] and node['lut'] > kern['lut'] and node['uram'] > kern['uram'] and node['ff'] > kern['ff']):
                    output_map["cluster"]["node"][curr_node]['kernel'].append(floating_kernel)
                    output_map["cluster"]["node"][curr_node]['dsp'] = node['dsp'] - kern['dsp']
                    output_map["cluster"]["node"][curr_node]['bram'] = node['bram'] - kern['bram']
                    output_map["cluster"]["node"][curr_node]['uram'] = node['uram'] - kern['uram']
                    output_map["cluster"]["node"][curr_node]['ff'] = node['ff'] - kern['ff']
                    output_map["cluster"]["node"][curr_node]['lut'] = node['lut'] - kern['lut']
                    max_kern_del = float_idx
                else:
                    curr_node = available_nodes.get()
                    break #exit kernel loop when we need a new node

            #when we want to place a group of kernels together, group resources in one "kernel"
            elif isinstance(floating_kernel, list) and (len(output_map["cluster"]["node"]) > 0):

                hier = {'dsp':0, 'bram':0, 'lut':0, 'uram':0, 'ff':0}
                for _floating_kernel in floating_kernel:
                    kern = kernel_db[kernel_list[_floating_kernel]['#text']]
                    hier['dsp'] = hier['dsp'] + kern['dsp']
                    hier['bram'] = hier['bram'] + kern['bram']
                    hier['lut'] = hier['lut'] + kern['lut']
                    hier['ff'] = hier['ff'] + kern['ff']

                #print("current node", curr_node)    
                node = output_map["cluster"]["node"][curr_node]
                if(node['dsp'] > hier['dsp'] and node['bram'] > hier['bram'] and node['lut'] > hier['lut'] and node['uram'] > hier['uram'] and node['ff'] > hier['ff']):
                    output_map["cluster"]["node"][curr_node]['dsp'] = node['dsp'] - hier['dsp']
                    output_map["cluster"]["node"][curr_node]['bram'] = node['bram'] - hier['bram']
                    output_map["cluster"]["node"][curr_node]['uram'] = node['uram'] - hier['uram']
                    output_map["cluster"]["node"][curr_node]['ff'] = node['ff'] - hier['ff']
                    output_map["cluster"]["node"][curr_node]['lut'] = node['lut'] - hier['lut']
                    max_kern_del = float_idx
                else:
                    curr_node = available_nodes.get()
                    break #exit kernel loop when we need a new node


        #delete kernels from floating list that have already been placed
        if not(max_kern_del == -1):
            del floating_kernels[:(max_kern_del+1)]

        #more kernels to go  but no more nodes, gotta add more
        found = False
        if(len(floating_kernels)>0):
            for key in fpga_db.keys():
                if not('used' in fpga_db[key]):
                    fpga_db[key]['used'] = 0

                if(fpga_db[key]['used']< int(fpga_db[key]['num'])):
                    node = {}
                    node['board'] = key
                    dsp_remaining = util*(fpga_db[node['board']]['total']['dsp'] - fpga_db[node['board']]['shell']['dsp'])
                    bram_remaining = util*(fpga_db[node['board']]['total']['bram'] - fpga_db[node['board']]['shell']['bram'])
                    uram_remaining = util*(fpga_db[node['board']]['total']['uram'] - fpga_db[node['board']]['shell']['uram'])
                    lut_remaining = util*(fpga_db[node['board']]['total']['lut'] - fpga_db[node['board']]['shell']['lut'])
                    ff_remaining = util*(fpga_db[node['board']]['total']['ff'] - fpga_db[node['board']]['shell']['ff'])
                    node['num'] = node_num;

                    node['dsp'] = dsp_remaining
                    node['bram'] = bram_remaining
                    node['uram'] = uram_remaining
                    node['lut'] = lut_remaining
                    node['ff'] = ff_remaining
                    node['kernel'] = []
                    node['comm'] = comm
                    node['ip'] = subnet + '.' + str(ip)
                    node['mac'] = vendor_mac + ':55:ca:' +  format(ip, '02x')
                    ip = ip + 1
                    output_map["cluster"]["node"].append(node)
                    available_nodes.put(node_num)
                    node_num = node_num+1;
                    found = True

            if not found:
                try:
                    raise NameError('No more FPGAs available')
                except NameEror:
                    print ('Crashing')
                    raise

    #print(kernel_list)
    f_csv = open("resources.csv", "w")
    f_csv.write("FPGA,Kernel_Num,Layers,FF,LUT,DSP,URAM,BRAM_ADDR_BITS,BRAM_DATA_BITS,BRAM_MB\n")

    change = True
    while(change):
        for node_idx, node in enumerate(output_map['cluster']['node']):
            if (len(node['kernel']) == 0):
                output_map['cluster']['node'].pop(node_idx)
                #change = True
                break
        change = False


    for node_idx, node in enumerate(output_map['cluster']['node']):
        print("**********************************************")
        print("Node " + str(node_idx))
        node_ff = 0
        node_lut = 0
        node_uram = 0
        node_dsp = 0
        node_clb = 0
        node_bram = 0
        print("Kernels in Node:")
        for kernel in node['kernel']:
            print(str(kernel_list[kernel]['#text']) + " " + str(kernel_db[str(kernel_list[kernel]['#text'])]))
            f_csv.write(str(node_idx) + "," + str(kernel) + "," + kernel_list[kernel]["#text"] + ","  + str(kernel_db[str(kernel_list[kernel]['#text'])]['ff']) + "," + str(kernel_db[str(kernel_list[kernel]['#text'])]['lut']) + "," + str(kernel_db[str(kernel_list[kernel]['#text'])]['dsp']) + "," + str(kernel_db[str(kernel_list[kernel]['#text'])]['uram']) + "," + "," + ",\n")
            node_ff = kernel_db[str(kernel_list[kernel]['#text'])]['ff'] + node_ff
            node_lut = kernel_db[str(kernel_list[kernel]['#text'])]['lut'] + node_lut
            node_uram = kernel_db[str(kernel_list[kernel]['#text'])]['uram'] + node_uram
            node_dsp = kernel_db[str(kernel_list[kernel]['#text'])]['dsp'] + node_dsp
            node_clb = kernel_db[str(kernel_list[kernel]['#text'])]['clb'] + node_clb
            node_bram = kernel_db[str(kernel_list[kernel]['#text'])]['bram'] + node_bram
        #print("\nResource Summary of Node:")
        #print("FF USED: " + str(node_ff) + " out of " + str(fpga_db['sidewinder']['total']['ff']) + " percent:" +  str(float(node_ff)/float(fpga_db['sidewinder']['total']['ff']) * 100.0)) 
        #print("LUT USED: " + str(node_lut) + " out of " + str(fpga_db['sidewinder']['total']['lut']) + " percent:" +  str(float(node_lut)/float(fpga_db['sidewinder']['total']['lut']) * 100.0)) 
        #print("URAM USED: " + str(node_uram) + " out of " + str(fpga_db['sidewinder']['total']['uram']) + " percent:" +  str(float(node_uram)/float(fpga_db['sidewinder']['total']['uram']) * 100.0)) 
        #print("DSP USED: " + str(node_dsp) + " out of " + str(fpga_db['sidewinder']['total']['dsp']) + " percent:" +  str(float(node_dsp)/float(fpga_db['sidewinder']['total']['dsp']) * 100.0)) 
       ## print("CLB USED: " + str(node_clb) + " out of " + str(fpga_db['sidewinder']['total']['clb'])) 
        #print("BRAM USED: " + str(node_bram) + " out of " + str(fpga_db['sidewinder']['total']['bram']) + " percent:" +  str(float(node_bram)/float(fpga_db['sidewinder']['total']['bram']) * 100.0)) 
        #f_csv.write(str(node_idx) + "," +kernel_list[kernel]["#text"] + ","  + str(node_ff) + "," + str(node_dsp) + "," + str(node_uram) + "," + "," + ",\n")
        print("\n")
        print("\n")
    f_csv.close()
    r = json.dumps(output_map, indent=4, separators=(',', ': '), sort_keys=True)
    f = open(output_map_file_name, "w")
    f.write(str(r))
    #print(output_map)
    #print(input_map)
    #print(fpga_db)

def make_list_from_json(file_name):


    db = {}
    with open(file_name) as json_file:
        db = json.load(json_file)


    return db

def make_kernel_db(kernel_dir):
    log_files = glob.glob(kernel_dir + "/**/impl/report/*/*.rpt", recursive = True)
    kernel_db = {}
    kernel_db_temp = {}
    for log_file in log_files:
        f = open(log_file, "r")
        name = ''
        ip = {'clb':0, 'lut':0, 'ff':0, 'dsp':0.0, 'bram':0.0, 'uram':0.0}
        for line in f:
            if(":" in line):
                line_array = line.split(':')
                if line_array[0] == 'Project':
                    name = line_array[1].strip()
                elif line_array[0] == 'CLB':
                    ip['clb'] = int(line_array[1])
                elif line_array[0] == 'LUT':
                    ip['lut'] = int(line_array[1])
                elif line_array[0] == 'FF':
                    ip['ff'] = int(line_array[1])
                elif line_array[0] == 'DSP':
                    ip['dsp'] = float(line_array[1])
                elif line_array[0] == 'BRAM':
                    ip['bram'] = float(line_array[1])
                elif line_array[0] == 'URAM':
                    ip['uram'] = float(line_array[1])
        kernel_db_temp[name] = ip
        #kernel_db[name] = ip

    #print("Kernel DB Temp is:")

    log_files = glob.glob(kernel_dir + "/**/*_data.json", recursive = True)

    #print ("kernel_db is " + str(kernel_db_temp))

    for log_file in log_files:
        with open(log_file) as json_file:
            log_file_array = log_file.split("/")
            dir_name = log_file_array[len(log_file_array) - 3]
            data = json.load(json_file)
            if dir_name in kernel_db_temp:
                kernel_db[data['RtlTop']] = kernel_db_temp[dir_name]
            else:
                print("Warning: " + data['RtlTop'] + " not found in kernel database")


    return kernel_db


if __name__=='__main__':

    try:
        opts, args = getopt.getopt(sys.argv[1:],"", ["fpgaFile=","ipDir=", "mapFile=", "logicalFile="])
    except:
        usage()
        sys.exit(2)

    fpgaFile = None
    ipDir = None
    logicalFile = None
    mapFile = None

    for o, a in opts:
        if o in ("--fpgaFile"):
            fpgaFile = a
        elif o in ("--ipDir"):
            ipDir = a
        elif o in ("--mapFile"):
            mapFile = a
        elif o in ("--logicalFile"):
            logicalFile = a


    fpga_db = make_list_from_json(fpgaFile)
    kernel_db = make_kernel_db(ipDir)
    input_logical = make_list_from_json(logicalFile)
    input_map = make_list_from_json(mapFile)
    paritioned_map = mapFile.split('.json')[0] + '_partitioned.json' 
    map_s2s(fpga_db, kernel_db, input_logical, input_map, paritioned_map)

