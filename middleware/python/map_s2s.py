import getopt, sys
import json
import glob

def map_s2s(fpga_db, kernel_db, input_logical, input_map, output_map_file_name):

    util = 0.8


    output_map = {"cluster":{"node":[]}}
    available_nodes = []

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
            available_nodes.append(node_num)
            node_num = node_num+1;
            if('used' in fpga_db[node['board']]):
                fpga_db[node['board']]['used'] = fpga_db[node['board']]['used'] + 1
            else:
                fpga_db[node['board']]['used'] = 1

            for kernel in node['kernel']:
                if kernel> max_kernel:
                    max_kernel = kernel
                    print("1:updating max_kernel with " + str(max_kernel))

    floating_kernels = []
    if 'floating' in input_map['cluster']:
        for floating_kernel in input_map["cluster"]["floating"]:
            floating_kernels.append(floating_kernel)
            if floating_kernel > max_kernel:
                max_kernel = floating_kernel
                print("2:updating max_kernel with " + str(max_kernel))

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

    print("kernel size:" + str(len(kernel_list)))
    #first make a kernel num to kernel name mapping
    for kernel in input_logical['cluster']['kernel']:
        #print(kernel['rep'])
        for i in range(0, kernel['rep']):
            kernel_list[kernel['num'] + i - 1] = kernel

    for node_idx, node in enumerate(output_map["cluster"]["node"]):
        for kernel in node['kernel']:
            print (kernel_list[kernel])
            kern = kernel_db[kernel_list[kernel]['#text']]
            output_map["cluster"]["node"][node_idx]['dsp'] = node['dsp'] - kern['dsp']
            output_map["cluster"]["node"][node_idx]['bram'] = node['bram'] - kern['bram']
            output_map["cluster"]["node"][node_idx]['uram'] = node['uram'] - kern['uram']
            output_map["cluster"]["node"][node_idx]['ff'] = node['ff'] - kern['ff']
            output_map["cluster"]["node"][node_idx]['lut'] = node['lut'] - kern['lut']


    #while(len(input_logical) > 0):
    while(len(floating_kernels) > 0):
        #for kern_idx, kern_dict in enumerate(input_logical):
        max_kern_del = -1
        for float_idx, floating_kernel in enumerate(floating_kernels):
            if isinstance(floating_kernel, int):
                kern = kernel_db[kernel_list[floating_kernel]['#text']]
                #kern = kernel_db[kern_dict['#text']]
                available_nodes_temp = available_nodes
                for available_nodes_idx, node_idx in enumerate(available_nodes_temp):
                    if(node['dsp'] > kern['dsp'] and node['bram'] > kern['bram'] and node['lut'] > kern['lut'] and node['uram'] > kern['uram'] and node['ff'] > kern['ff']):
                        print("IN BIG IF")
                        output_map["cluster"]["node"][node_idx]['kernel'].append(floating_kernel)
                        output_map["cluster"]["node"][node_idx]['dsp'] = node['dsp'] - kern['dsp']
                        output_map["cluster"]["node"][node_idx]['bram'] = node['bram'] - kern['bram']
                        output_map["cluster"]["node"][node_idx]['uram'] = node['uram'] - kern['uram']
                        output_map["cluster"]["node"][node_idx]['ff'] = node['ff'] - kern['ff']
                        output_map["cluster"]["node"][node_idx]['lut'] = node['lut'] - kern['lut']
                        max_kern_del = float_idx
                    else:
                        print("Available nodes: " + str(available_nodes))
                        print("deleting node "  + str(node['num']))
                        del available_nodes[available_nodes_idx]
                        break
            elif isinstance(floating_kernel, list):

                hier = {'dsp':0, 'bram':0, 'lut':0, 'uram':0, 'ff':0}
                for _floating_kernel in floating_kernel:
                    kern = kernel_db[kernel_list[_floating_kernel]['#text']]
                    hier['dsp'] = hier['dsp'] + kern['dsp']
                    hier['bram'] = hier['bram'] + kern['bram']
                    hier['lut'] = hier['lut'] + kern['lut']
                    hier['ff'] = hier['ff'] + kern['ff']
                    
                if(node['dsp'] > hier['dsp'] and node['bram'] > hier['bram'] and node['lut'] > hier['lut'] and node['uram'] > hier['uram'] and node['ff'] > hier['ff']):
                    print("IN BIG IF")
                    for _floating_kernel in floating_kernel:
                        output_map["cluster"]["node"][node_idx]['kernel'].append(_floating_kernel)
                    output_map["cluster"]["node"][node_idx]['dsp'] = node['dsp'] - hier['dsp']
                    output_map["cluster"]["node"][node_idx]['bram'] = node['bram'] - hier['bram']
                    output_map["cluster"]["node"][node_idx]['uram'] = node['uram'] - hier['uram']
                    output_map["cluster"]["node"][node_idx]['ff'] = node['ff'] - hier['ff']
                    output_map["cluster"]["node"][node_idx]['lut'] = node['lut'] - hier['lut']
                    max_kern_del = float_idx
                else:
                    print("Available nodes: " + str(available_nodes))
                    print("deleting node "  + str(node['num']))
                    del available_nodes[available_nodes_idx]
                    break

                

        if not(max_kern_del == -1):
            del floating_kernels[:(max_kern_del+1)]

        print("number of floating kernels" + str(len(floating_kernels)))
        #more kernels to go  but no more nodes, gotta add more
        found = False
        if(len(floating_kernels)>0):
            for key in fpga_db.keys():
                print (fpga_db)
                print(fpga_db[key])
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
                    available_nodes.append(node_num)
                    node_num = node_num+1;
                    found = True

            if not found:
                try:
                    raise NameError('No more FPGAs available')
                except NameEror:
                    print ('Crashing')
                    raise


    print("OUTPUT MAP")
    print(output_map)
    print("num nodes " + str(len(output_map['cluster']['node'])))
    r = json.dumps(output_map, indent=4, separators=(',', ': '), sort_keys=True)
    f = open(output_map_file_name, "w")
    f.write(str(r))



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
        print("entering db_temp entry " + name)
        kernel_db_temp[name] = ip
        #kernel_db[name] = ip

    #print("Kernel DB Temp is:")

    log_files = glob.glob(kernel_dir + "/**/*_data.json", recursive = True)

    for log_file in log_files:
        with open(log_file) as json_file:
            log_file_array = log_file.split("/")
            dir_name = log_file_array[len(log_file_array) - 3]
            print(log_file_array)
            print(dir_name)
            data = json.load(json_file)
            print(kernel_db_temp)
            print(data['RtlTop'])
            print(data['Top'])
#            print(kernel_db_temp)
            kernel_db[data['RtlTop']] = kernel_db_temp[dir_name]


    print("Kernel DB is:")
    print(kernel_db)
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
    print ("partitioned map file is:" + paritioned_map)
    print ("mapFile.split:" + str(mapFile.split('.json')))
    map_s2s(fpga_db, kernel_db, input_logical, input_map, paritioned_map)
    print (fpga_db)
    print (kernel_db)
