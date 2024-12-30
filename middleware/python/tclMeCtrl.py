
def setSwitchManagerPortRoutingRange(tcl_user_app, switch_name, tdest_range_list):
    num_tdest = len(tdest_range_list)
    properties = []
    for i in range(0, num_tdest):
        if i < 10:
            manager_port = 'M0' + str(i)
        else:
            manager_port = 'M' + str(i)
        tdest_range = tdest_range_list[i]
        base_tdest_str = "0x{:08x}".format(tdest_range[0])
        high_tdest_str = "0x{:08x}".format(tdest_range[1])
        base_tdest_setting = 'CONFIG.' + manager_port + '_AXIS_BASETDEST {' + base_tdest_str + '}'
        properties.append(base_tdest_setting)
        high_tdest_setting = 'CONFIG.' + manager_port + '_AXIS_HIGHTDEST {' + high_tdest_str + '}'
        properties.append(high_tdest_setting)
    tcl_user_app.setProperties(switch_name, properties)

def buildControlInboundSwitchRange(tcl_user_app, switch_name, num_tdests, tdest_range_list):
    tcl_user_app.instBlock(
        {
            'name':'axis_switch',
            'inst': switch_name,
            'clks':['aclk'],
            'resetns_port': 'rstn',
            'resetns':['aresetn']
        }
    )
    # Configure the switch to have 1 Manager per TDEST and arbitrate on TLAST only.
    properties = [
        'CONFIG.NUM_SI {1}',
        'CONFIG.NUM_MI {' + str(num_tdests) + '}',
        'CONFIG.HAS_TLAST.VALUE_SRC USER'
    ]
    tcl_user_app.setProperties(switch_name,properties)
    properties = [
        'CONFIG.HAS_TLAST {1}'
    ]
    tcl_user_app.setProperties(switch_name, properties)
    properties = [
        'CONFIG.ARB_ON_MAX_XFERS {0}',
        'CONFIG.ARB_ON_TLAST {1}',
    ]
    tcl_user_app.setProperties(switch_name, properties)
    setSwitchManagerPortRoutingRange(tcl_user_app, switch_name, tdest_range_list)

def buildControlOutboundSwitch(tcl_user_app, switch_name, num_ctrl_instances):
    """
    Creates a single output switch for control kernels. This switch is used to aggregate all Control IP instances' signals for a data path. Eg. this switch will sit between Control API kernels and the LAN router, collecting all LAN messages from the Control API instances.    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        switch_name (str): Full name of the switch
        num_ctrl_instances (int): Number of inputs to the switch
    """
    tcl_user_app.instBlock(
        {
            'name':'axis_switch',
            'inst': switch_name,
            'clks':['aclk'],
            'resetns_port': 'rstn',
            'resetns':['aresetn']
        }
    )
    #Configure the switch to have 1 slave per kernel, 1 master, that it allows all messages through, and arbitrate on TLAST only.
    properties = [
        'CONFIG.NUM_SI {' + str(num_ctrl_instances) + '}',
        'CONFIG.NUM_MI {1}',
        'CONFIG.HAS_TLAST.VALUE_SRC USER',
        'CONFIG.M00_AXIS_HIGHTDEST {0xffffffff}'
    ]
    tcl_user_app.setProperties(switch_name,properties)
    properties = [
        'CONFIG.HAS_TLAST {1}'
    ]
    tcl_user_app.setProperties(switch_name, properties)
    properties = [
        'CONFIG.ARB_ON_MAX_XFERS {0}',
        'CONFIG.ARB_ON_TLAST {1}'
    ]
    tcl_user_app.setProperties(switch_name, properties)
