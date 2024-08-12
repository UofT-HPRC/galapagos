import copy


def parseAPI(topAPI):
    direct = []
    broadcast = []
    register = []
    register_multiple = []
    for port in topAPI['port']:
        local_port = copy.deepcopy(port)
        if port['form'].strip().lower()=="direct":
            direct.append(local_port)
        elif port['form'].strip().lower() == "broadcast":
            broadcast.append(local_port)
        elif port['form'].strip().lower() == "register":
            register.append(local_port)
        elif port['form'].strip().lower() == "register_multiple":
            broadcast.append(register_multiple)
    current_port = 1
    for idx in range(len(direct)):
        direct[idx]['num'] = current_port
        current_port = current_port + 1
    broadcast_start = current_port
    for idx in range(len(broadcast)):
        broadcast[idx]['num'] = current_port
        current_port = current_port + 1
    register_start = current_port
    for idx in range(len(register)):
        register[idx]['num'] = current_port
        current_port = current_port + 1
    register_multiple_start = current_port
    for idx in range(len(register_multiple)):
        register_multiple[idx]['num'] = current_port
        current_port = current_port + 1
    last_port = current_port-1
    return direct,broadcast,register,register_multiple,broadcast_start,register_start,register_multiple_start,last_port
def makeGWFiles(fpga, outDir,topAPI):
    (direct,broadcast,register,register_multiple,bc_s,r_s,rm_s,lp) = parseAPI(topAPI)
    print("Gateway Processing Start")
    print(direct)
    print(broadcast)
    print(register)
    print(register_multiple)
    print(bc_s)
    print(r_s)
    print(rm_s)
    print(lp)
    print("Gateway Processing End")