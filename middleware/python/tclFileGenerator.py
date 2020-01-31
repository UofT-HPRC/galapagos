#!/usr/bin/python
import copy
import sys
import subprocess
import os
from tclMe import tclMeFile
import string

"""
Most of these functions are called (directly or indirectly) by makeTclFiles.
Each one takes care of one self-contained part of the TCL file generation. 
"""

#interfaces constant
#creates the standard interfaces, same for all fpgas

def userApplicationRegionControlInst(tcl_user_app):
    """
    Connects the AXI control interface from the shell (through an AXI interconnect)
    to the various kernels in this FPGA (provided they declared control interfaces
    in the logical file).
    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
    """
    #initialize axi_control_interface interconnect slave side (1 slave)

    num_ctrl_interfaces = len(getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global'))
    # extra interfaces for the memories containing addresses in this mode
    if tcl_user_app.fpga['comm'] == 'raw':
        num_ctrl_interfaces = num_ctrl_interfaces + 2

    #make dummy bram for control interface if no control interfaces
    if(num_ctrl_interfaces == 0):
        tcl_user_app.instBlock(
                {'name':'axi_vip',
                'inst':'applicationRegion/axi_vip_ctrl',
                'clks':['aclk'],
                'resetns':['aresetn'],
                'properties':['CONFIG.PROTOCOL {AXI4LITE}', 'CONFIG.INTERFACE_MODE {SLAVE}']
                }
                )
        tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':None,
                    'type':'intf_port',
                    'port_name':'S_AXI_CONTROL'
                    },
                    {'name':'applicationRegion/axi_vip_ctrl',
                    'type':'intf',
                    'port_name':'S_AXI'
                    }
                    )
    else:
        #tcl_user_app.instBlock(
        #        {'name':'smartconnect',
        #        'inst':'applicationRegion/axi_interconnect_ctrl',
        #        'clks':['aclk'],
        #        'resetns':['aresetn'],
        #        'properties':['CONFIG.NUM_SI {1}',
        #            'CONFIG.NUM_MI {' + str(num_ctrl_interfaces) + '}']
        #        }
        #        )
        #
        
        inc_clks = ['ACLK', 'S00_ACLK']
        inc_resetns = ['ARESETN', 'S00_ARESETN']
        for inc_index in range(0, num_ctrl_interfaces):
            inc_index_str = "%02d"%inc_index
            inc_clks.append('M' + inc_index_str + '_ACLK')
            inc_resetns.append('M' + inc_index_str + '_ARESETN')

        tcl_user_app.instBlock(
                {'name':'axi_interconnect',
                'inst':'applicationRegion/axi_interconnect_ctrl',
                'clks':inc_clks,
                'resetns':inc_resetns,
                'properties':['CONFIG.NUM_SI {1}',
                    'CONFIG.NUM_MI {' + str(num_ctrl_interfaces) + '}']
                }
                )
        tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':None,
                    'type':'intf_port',
                    'port_name':'S_AXI_CONTROL'
                    },
                    {'name':'applicationRegion/axi_interconnect_ctrl',
                    'type':'intf',
                    'port_name':'S00_AXI'
                    }
                    )

def getInterfaces(fpga, intf, flag = None, scope = None):
    """
    Helper function to get a list of interfaces of a particular type from all
    the kernels in this particular node.
    
    Args:
        fpga: node object for this particular FPGA
        intf (string): the type of itnerface to look for. For example, "s_axi"
        flag: If specified, can ask the getInterfaces function to only match
              certain interfaces. Right now, the only thing you can do with it
              is set it to "scope" or leave it blank for no special behaviour
        scope: If flag is set to "scope", this variable is the scope to look for
               Can be "local" or "global", or left blank for no special behaviour
    
    Returns:
        An array of Python dicts, where each one is a subtree from the original
        mapping file. Note that this also adds a 'kernel_inst' member to the 
        interface dict which contains a pointer to its parent kernel dict (this
        is used in userApplicationRegionKernelConnectSwitches, among others)
    """
    interfaces = []
    
    # For each <kernel>...
    for kern in fpga['kernel']:
        
        #if global we can look for master or slave
        # ^(Not sure what that comment means)
        #if intf=='s_axis' and flag=='scope' and scope =='global':
        #    print('kernel is ' + str(kern.data)) 
        
        # If this kernel has at least one <intf> tag, where intf is the string
        # passed into this function...
        if kern[intf] != None:
            for kern_intf in kern[intf]:
                
                # If we don't need a specific scope, match everything
                if (scope == None):
                    kern_intf['kernel_inst'] = kern
                    interfaces.append(copy.deepcopy(kern_intf))
                
                # Otherwise, only match the right scope
                elif(flag == 'scope' and kern_intf['scope'] == scope):
                    kern_intf['kernel_inst'] = kern
                    interfaces.append(copy.deepcopy(kern_intf))
                
                # (Not really sure what this is for, so I'm ignoring it)
                elif(flag == 'debug' and 'debug' in kern_intf):
                    kern_intf['kernel_inst'] = kern
                    interfaces.append(copy.deepcopy(kern_intf))

    
    #if intf=='s_axis' and flag=='scope' and scope =='global':
    #    print("interfaces returned are " + str(interfaces))

    return interfaces

def strCompare(s1, s2):
    s1 = s1.replace(" ", "")
    s1 = s1.replace("\t", "")
    s1 = s1.replace("\n", "")
    s2 = s2.replace(" ", "")
    s2 = s2.replace("\t", "")
    s2 = s2.replace("\n", "")
    return s1 == s2

def getSlaveInterfaces(fpga, intf, master):
    """
    Gets all the particular type (s_axi, s_axis, or wire_slave)  of slave interfaces for a given FPGA  


    Args:
        fpga: The node object for this FPGA
        intf (string): The type of interface to look for
        master: The information associated with a particular master interface. 
                This will be a Python dict built by parsing the XML/JSON file,
                but it is augmented with some extra stuff by the cluster __init__
                function. Specifically, it will be a pointer from the kernels[]
                member var in the cluster object (and even more specifically, the
                fpga parameter to this function is actually a pointer to a member
                of the nodes[] array of the cluster object, which itself contains
                pointers to members of the kernels[] array).
    """

    interfaces = []
    
    # First get all the interfaces that could connect to this master
    slave_array = getInterfaces(fpga, intf, 'scope', 'local')
    
    for slave in slave_array:
        #print ("slave num " + slave['master']['num']) 
        if ( (int(slave['master']['num'])  == int(master['kernel_inst']['num'])) and strCompare(slave['master']['port'], master['name'])):
            interfaces.append(copy.deepcopy(slave))
    return interfaces

def userApplicationRegionMemInstLocal(tcl_user_app):
    """
    For locally connected memory mapped slaves. This instantiates a local axi interconnecte 
    between the master and the slaves, all within the given FPGA.

    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
    """
    m_axi_array = getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope', 'local')
    for m_axi in m_axi_array:
        s_axi_array = getSlaveInterfaces(tcl_user_app.fpga, 's_axi', m_axi)

        inc_clks = ['ACLK', 'S00_ACLK']
        inc_resetns = ['ARESETN', 'S00_ARESETN']
        for inc_index in range(0, len(s_axi_array)):
            inc_index_str = "%02d"%inc_index
            inc_clks.append('M' + inc_index_str + '_ACLK')
            inc_resetns.append('M' + inc_index_str + '_ARESETN')


        tcl_user_app.instBlock(
                {
                'name':'axi_interconnect',
                'inst': m_axi['kernel_inst']['inst'] + '_' + m_axi['name'] + '_inc_inst',
                'clks': inc_clks,
                'resetns': inc_resetns,
                'properties':['CONFIG.NUM_SI {1}', 'CONFIG.NUM_MI {' + str(len(s_axi_array)) + '}']
                }
                )
        tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name': m_axi['kernel_inst']['inst'],
                    'type':'intf',
                    'port_name': m_axi['name']
                    },
                    {'name': m_axi['kernel_inst']['inst'] + '_' + m_axi['name'] + '_inc_inst' ,
                    'type':'intf',
                    'port_name': 'S00_AXI'
                    }
                    )

        for s_axi_idx, s_axi in enumerate(s_axi_array):
            s_axi_idx_str = "%02d"%s_axi_idx
            tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name': m_axi['kernel_inst']['inst'] + '_' + m_axi['name'] + '_inc_inst',
                        'type':'intf',
                        'port_name':'M' + s_axi_idx_str + '_AXI'
                        },
                        {'name':s_axi['kernel_inst']['inst'],
                        'type':'intf',
                        'port_name': s_axi['name']
                        }
                        )

def userApplicationRegionMemInstGlobal(tcl_user_app, shared):
    """
    Connects the kernels' AXI master port to the shell's off-chip memory
    controller. Also instantiates an AXI interconnect if there is more than
    one person trying to use the off-chip memory.
    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        shared: I'm not sure what this does, exactly.
    """
    num_mem_interfaces = len(getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope',  'global'))

    inc_clks = ['ACLK', 'M00_ACLK']
    inc_resetns = ['ARESETN', 'M00_ARESETN']
    if (num_mem_interfaces > 0):
        if shared:
            properties = ['CONFIG.NUM_MI {2}']
            inc_clks.append('M01_ACLK')
            inc_resetns.append('M01_ARESETN')
        else:
            properties = ['CONFIG.NUM_MI {1}']


#MAKES SMARTCONNECT
#DOESN'T PLAY WELL WITH ENCRYPTED CORES, REPLACING WITH INTERCONNECT

        properties.append('CONFIG.NUM_SI {' + str(num_mem_interfaces) + '}')
        # adds an interface for the second memory interface to be added
        if shared:
            properties.append('CONFIG.NUM_MI {2}')
#
#        tcl_user_app.instBlock(
#                {
#                'name':'smartconnect',
#                'inst':'applicationRegion/axi_interconnect_mem',
#                'clks':['aclk'],
#                'resetns':['aresetn'],
#                'properties':properties
#                }
#                )

#AXI INTERCONNECT
        for inc_index in range(0, num_mem_interfaces):
            inc_index_str = "%02d"%inc_index
            inc_clks.append('S' + inc_index_str + '_ACLK')
            inc_resetns.append('S' + inc_index_str + '_ARESETN')

        # print('axi interconnect mem properties ' + str(properties))

        enable_AXI_mem_interconnect = True

        if 'custom' in tcl_user_app.fpga:
            if tcl_user_app.fpga['custom'] == 'GAScore':
                enable_AXI_mem_interconnect = False

        if enable_AXI_mem_interconnect:
            tcl_user_app.instBlock(
                    {
                    'name':'axi_interconnect',
                    'inst':'applicationRegion/axi_interconnect_mem',
                    'clks':inc_clks,
                    'resetns':inc_resetns,
                    'properties':properties
                    }
                    )

            tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name':'applicationRegion/axi_interconnect_mem',
                        'type':'intf',
                        'port_name':'M00_AXI'
                        },
                        {'name':None,
                        'type':'intf_port',
                        'port_name':'S_AXI_MEM_0'
                        }
                        )
            if shared:
                tcl_user_app.makeConnection(
                            'intf',
                            {
                            'name':'applicationRegion/axi_interconnect_mem',
                            'type':'intf',
                            'port_name':'M01_AXI'
                            },
                            {'name':None,
                            'type':'intf_port',
                            'port_name':'S_AXI_MEM_1'
                            }
                            )


    else:
        #no mem interface use VIP instead
        tcl_user_app.instBlock(
                {
                'name':'axi_vip',
                'inst':'applicationRegion/axi_vip_mem_0',
                'clks':['aclk'],
                'resetns':['aresetn'],
                'properties':['CONFIG.INTERFACE_MODE {MASTER}', 'CONFIG.DATA_WIDTH {512}']
                }
                )
        tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/axi_vip_mem_0',
                    'type':'intf',
                    'port_name':'M_AXI'
                    },
                    {'name':None,
                    'type':'intf_port',
                    'port_name':'S_AXI_MEM_0'
                    }
                    )
        if shared:
            tcl_user_app.instBlock(
                     {
                      'name':'axi_vip',
                      'inst':'applicationRegion/axi_vip_mem_1',
                      'clks':['aclk'],
                      'resetns':['aresetn'],
                      'properties':['CONFIG.INTERFACE_MODE {MASTER}', 'CONFIG.DATA_WIDTH {512}']
                      }
                      )
            tcl_user_app.makeConnection(
                          'intf',
                          {
                          'name':'applicationRegion/axi_vip_mem_1',
                          'type':'intf',
                          'port_name':'M_AXI'
                          },
                          {
                          'name':None,
                          'type':'intf_port',
                          'port_name':'S_AXI_MEM_1'
                          }
                          )

def userApplicationRegionKernelsInst(tcl_user_app):
    """
    Loops through the list of kernels on one particular FPGA and generates the
    appropriate TCL commands to instantiate them in a block diagram.
    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
    """
    
    #instantiate kernels
    for kern_idx, kern in enumerate(tcl_user_app.fpga['kernel']):
        instName = kern['name'] + "_inst_" + str(kern['num'])
        #instantiate kernel
        tcl_user_app.fpga['kernel'][kern_idx]['inst'] = 'applicationRegion/' + instName
        tcl_user_app.instBlock(
                {
                'vendor':kern['vendor'],
                'lib': kern['lib'],
                'name': kern['name'],
                'inst':'applicationRegion/' + instName,
                'clks': kern['clk'],
                'resetns': kern['aresetn']
                }
                )
        #instantiate and connect constant for id
        if (kern['id_port'] != None):
            tcl_user_app.instBlock(
                    {
                    'name':'xlconstant',
                    'inst': 'applicationRegion/id_' + str(kern['num']),
                    'properties':['CONFIG.CONST_WIDTH {32}',
                        'CONFIG.CONST_VAL {'+ str(kern['num'])+'}']
                    }
                    )
            tcl_user_app.makeConnection(
                    'net',
                        {
                        'name':'applicationRegion/id_' + str(kern['num']),
                        'type':'pin',
                        'port_name':'dout'
                        },
                        {
                        'name':'applicationRegion/' + instName,
                        'type':'pin',
                        'port_name':kern['id_port']
                        }
                        )

        if kern['const'] != None:
            for const in kern['const']:
                tcl_user_app.instBlock(
                        {
                        'name':'xlconstant',
                        'inst': 'applicationRegion/' + instName + '_' + const['name'],
                        'properties':['CONFIG.CONST_WIDTH {' + const['width'] + '}',
                            ' CONFIG.CONST_VAL {'+ const['val'] + '}']
                        }
                        )
                tcl_user_app.makeConnection(
                        'net',
                        {
                        'name':'applicationRegion/' + instName + '_' + const['name'] ,
                        'type':'pin',
                        'port_name':'dout'
                        },
                        {
                        'name':'applicationRegion/' + instName,
                        'type':'pin',
                        'port_name':const['name']
                        }
                        )

def userApplicationRegionSwitchesInst(tcl_user_app, sim):
    """
    I think this is for making the Galapagos router (i.e. the one that sits in
    the application region and takes care of routing packets to the network 
    switch or to another kernel in the same FPGA). This only instantiates IPs
    and does not make any connections (except to network table and IP/MAC consts)
    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        sim: I still don't really know what this does, exactly
    """
    
    # I think this is the BRAM which stores the routing table
    if tcl_user_app.fpga['comm'] != 'none':
        if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
            tcl_user_app.instBlock(
                    {
                    'name':'blk_mem_gen',
                    'inst':'applicationRegion/blk_mem_switch_rom',
                    }
                    )
    
    # The next 250 lines of code are a big if-elif-else statement which generate
    # the correct Galapagos router depending on whether the communication type is
    # "tcp", "eth", or "raw"
    if tcl_user_app.fpga['comm'] == 'tcp':
        tcl_user_app.instBlock(
            {'vendor':'xilinx.com',
            'lib':'hls',
            'name':'width32router',
            'inst':'applicationRegion/custom_switch_inst',
            'clks':['aclk'],
            'resetns':['aresetn']
            }
            )
            
        # Properties for routing table BRAM
        properties = ['CONFIG.Memory_Type {Single_Port_ROM}',
                    'CONFIG.Enable_32bit_Address {true}',
                    'CONFIG.Use_Byte_Write_Enable {false}',
                    'CONFIG.Byte_Size {8}',
                    'CONFIG.Write_Depth_A {256}',
                    'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
                    'CONFIG.Use_RSTA_Pin {true}',
                    'CONFIG.Port_A_Write_Rate {0}',
                    'CONFIG.use_bram_block {BRAM_Controller}',
                    'CONFIG.EN_SAFETY_CKT {true}',
                    'CONFIG.Load_Init_File {true}',
                    'CONFIG.Coe_File $top_path/projects/$default_dir/ip.coe'
                    ]

        tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom', properties)
        
        # I think this connects the board's local IP to the router (but I don't
        # know why this is needed)
        tcl_user_app.makeConnection(
            'net',
            {
            'name':'network/ip_constant_block_inst',
            'type':'pin',
            'port_name':'ip'
            },
            {
            'name':'applicationRegion/custom_switch_inst',
            'type':'pin',
            'port_name':'network_addr_V'
            }
            )
        
        # Connect routing table BRAM to Galapagos router
        tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/custom_switch_inst',
                    'type':'intf',
                    'port_name':'network_table_V_PORTA'
                    },
                    {
                    'name':'applicationRegion/blk_mem_switch_rom',
                    'type':'intf',
                    'port_name':'BRAM_PORTA'
                    }
                    )

    # Refer to comments in the case for TCP (above) 
    elif tcl_user_app.fpga['comm'] == 'eth':
        if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
            tcl_user_app.instBlock(
                    {'vendor':'xilinx.com',
                    'lib':'hls',
                    'name':'width48router',
                    'inst':'applicationRegion/custom_switch_inst',
                    'clks':['aclk'],
                    'resetns':['aresetn']
                    }
                    )

            properties =['CONFIG.Memory_Type {Single_Port_ROM}',
                        'CONFIG.Enable_32bit_Address {true}',
                        'CONFIG.Use_Byte_Write_Enable {false}',
                        'CONFIG.Byte_Size {8}',
                        'CONFIG.Write_Width_A {64}',
                        'CONFIG.Write_Depth_A {256}',
                        'CONFIG.Read_Width_A {64}',
                        'CONFIG.Write_Width_B {64}',
                        'CONFIG.Read_Width_B {64}',
                        'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
                        'CONFIG.Use_RSTA_Pin {true}',
                        'CONFIG.Port_A_Write_Rate {0}',
                        'CONFIG.use_bram_block {BRAM_Controller}',
                        'CONFIG.EN_SAFETY_CKT {true}',
                        'CONFIG.Load_init_file {true}',
                        'CONFIG.Coe_File $top_path/projects/$default_dir/mac.coe'
                        ]

            tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom', properties)

            tcl_user_app.makeConnection(
                        'net',
                        {
                        'name':'network/ip_constant_block_inst',
                        'type':'pin',
                        'port_name':'mac_big'
                        },
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'pin',
                        'port_name':'network_addr_V'
                        }
                        )

            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/custom_switch_inst',
                    'type':'intf',
                    'port_name':'network_table_V_PORTA'
                    },
                    {
                    'name':'applicationRegion/blk_mem_switch_rom',
                    'type':'intf',
                    'port_name':'BRAM_PORTA'
                    }
                    )

    elif tcl_user_app.fpga['comm'] == 'raw':

        # configures one memory to hold the IP addresses
        properties = ['CONFIG.Memory_Type {Single_Port_ROM}',
                    'CONFIG.Enable_32bit_Address {true}',
                    'CONFIG.Use_Byte_Write_Enable {false}',
                    'CONFIG.Byte_Size {8}',
                    'CONFIG.Write_Depth_A {256}',
                    'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
                    'CONFIG.Use_RSTA_Pin {true}',
                    'CONFIG.Port_A_Write_Rate {0}',
                    'CONFIG.use_bram_block {BRAM_Controller}',
                    'CONFIG.EN_SAFETY_CKT {true}',
                    'CONFIG.Load_Init_File {true}',
                    'CONFIG.Coe_File $top_path/projects/$default_dir/ip.coe'
                    ]

        tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom', properties)

        tcl_user_app.instBlock(
            {
            'name':'axi_bram_ctrl',
            'inst':'applicationRegion/ctrl_blk_mem_switch_rom',
            'clks':['s_axi_aclk'],
            'resetns':['s_axi_aresetn']
            }
        )
        tcl_user_app.setProperties('applicationRegion/ctrl_blk_mem_switch_rom', ["CONFIG.SINGLE_PORT_BRAM {1}"])

        # configures another memory to hold the MAC addresses
        tcl_user_app.instBlock(
            {
            'name':'blk_mem_gen',
            'inst':'applicationRegion/blk_mem_switch_rom_mac',
            }
        )

        tcl_user_app.instBlock(
            {
            'name':'axi_bram_ctrl',
            'inst':'applicationRegion/ctrl_blk_mem_switch_rom_mac',
            'clks':['s_axi_aclk'],
            'resetns':['s_axi_aresetn']
            }
        )
        tcl_user_app.setProperties('applicationRegion/ctrl_blk_mem_switch_rom_mac', ["CONFIG.SINGLE_PORT_BRAM {1}", "CONFIG.DATA_WIDTH {64}"])

        properties =['CONFIG.Memory_Type {Single_Port_ROM}',
                    'CONFIG.Enable_32bit_Address {true}',
                    'CONFIG.Use_Byte_Write_Enable {false}',
                    'CONFIG.Byte_Size {8}',
                    'CONFIG.Write_Width_A {64}',
                    'CONFIG.Write_Depth_A {256}',
                    'CONFIG.Read_Width_A {64}',
                    'CONFIG.Write_Width_B {64}',
                    'CONFIG.Read_Width_B {64}',
                    'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
                    'CONFIG.Use_RSTA_Pin {true}',
                    'CONFIG.Port_A_Write_Rate {0}',
                    'CONFIG.use_bram_block {BRAM_Controller}',
                    'CONFIG.EN_SAFETY_CKT {true}',
                    'CONFIG.Load_init_file {true}',
                    'CONFIG.Coe_File $top_path/projects/$default_dir/mac.coe'
                    ]

        tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom_mac', properties)

        # connect these two memories to the global interconnect
        app_interfaces = len(getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global'))
        idx_str = "%02d"%(app_interfaces)
        tcl_user_app.makeConnection(
                'intf',
                {'name':'applicationRegion/axi_interconnect_ctrl',
                'type':'intf',
                'port_name':'M' + idx_str + '_AXI'
                },
                {
                'name':'applicationRegion/ctrl_blk_mem_switch_rom',
                'type':'intf',
                'port_name':'S_AXI'
                }
                )
        idx_str = "%02d"%(app_interfaces + 1)
        tcl_user_app.makeConnection(
                'intf',
                {'name':'applicationRegion/axi_interconnect_ctrl',
                'type':'intf',
                'port_name':'M' + idx_str + '_AXI'
                },
                {
                'name':'applicationRegion/ctrl_blk_mem_switch_rom_mac',
                'type':'intf',
                'port_name':'S_AXI'
                }
                )

        # connect the BRAMs to their controllers
        tcl_user_app.makeConnection(
                'intf',
                {
                'name':'applicationRegion/ctrl_blk_mem_switch_rom',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                },
                {
                'name':'applicationRegion/blk_mem_switch_rom',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                }
                )
        tcl_user_app.makeConnection(
                'intf',
                {
                'name':'applicationRegion/ctrl_blk_mem_switch_rom_mac',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                },
                {
                'name':'applicationRegion/blk_mem_switch_rom_mac',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                }
                )

    elif tcl_user_app.fpga['comm'] == 'none':
        pass

    else:
        print("Unknown communication type: " + tcl_user_app.fpga['comm'])
        exit(1)

    # Ask how many (global) s_axis connections are in the user app region.
    num_slave_s_axis_global = len(getInterfaces(tcl_user_app.fpga, 's_axis', 'scope' , 'global'))


    if num_slave_s_axis_global == 0:
        ##TO DO: CHANGE TO VIP FOR 0 SLAVES
        print("TO DO: CHANGE TO VIP FOR 0 SLAVES in userApplicationRegionSwitchesInst")
        quit(0)
    
    else:
#for simulation purposes use custom arbiter instead of axis_switch
        if(sim == 0):
            # we don't want an input switch IFF 1 slave and mode is raw
            # if it is raw, we need just a single slave interface
            if num_slave_s_axis_global > 1 and tcl_user_app.fpga['comm'] in ['raw', 'none']:
                tcl_user_app.instBlock(
                            {
                            'name':'axis_switch',
                            'inst':'applicationRegion/input_switch',
                            'clks':['aclk'],
                            'resetns':['aresetn'],
                            'properties':['CONFIG.NUM_SI {1}',
                                'CONFIG.NUM_MI {' + str(num_slave_s_axis_global) + '}',
                                'CONFIG.ARG_ON_TLAST {1}',
                                'CONFIG.HAS_TLAST {1}'

                                ]
                            }
                        )
            elif tcl_user_app.fpga['comm'] not in ['raw', 'none']:
                if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                    tcl_user_app.instBlock(
                            {
                            'name':'axis_switch',
                            'inst':'applicationRegion/input_switch',
                            'clks':['aclk'],
                            'resetns':['aresetn'],
                            'properties':['CONFIG.NUM_SI {2}',
                                'CONFIG.NUM_MI {' + str(num_slave_s_axis_global) + '}',
                                'CONFIG.HAS_TLAST {1}',
                                'CONFIG.ARB_ON_TLAST {1}'
                                ]
                            }
                            )
                    
                else:
                    if num_slave_s_axis_global > 1:
                        tcl_user_app.instBlock(
                                {
                                'name':'axis_switch',
                                'inst':'applicationRegion/input_switch',
                                'clks':['aclk'],
                                'resetns':['aresetn'],
                                'properties':['CONFIG.NUM_SI {1}',
                                    'CONFIG.NUM_MI {' + str(num_slave_s_axis_global) + '}',
                                    'CONFIG.HAS_TLAST {1}',
                                    'CONFIG.ARB_ON_TLAST {1}'
                                    ]
                                }
                            )

            
            
        else:
            tcl_user_app.instBlock(
                    {
                    'name':'arbiter',
                    'lib':'hls',
                    'vendor':'xilinx.com',
                    'inst':'applicationRegion/arbiter',
                    'clks':['ap_clk'],
                    'resetns':['ap_rst_n'],
                    }
                    )

        switch_port_index = 0
        properties = ['CONFIG.ARB_ON_MAX_XFERS {0}']
        for kern in tcl_user_app.fpga['kernel']:
            if kern['s_axis'] != None:
                for s_axis in kern['s_axis']:
                    if s_axis['scope'] == 'global':
                        #print("adding kernel to switch " + kern['inst'])
                        kernel_index_str = "0x{:08x}".format(int(kern['num']))
                        switch_port_index_str = "%02d"%switch_port_index
                        properties.append('CONFIG.M' + switch_port_index_str + '_AXIS_BASETDEST {' + kernel_index_str + '}')
                        properties.append('CONFIG.M' + switch_port_index_str + '_AXIS_HIGHTDEST {' + kernel_index_str + '}')
                        switch_port_index = switch_port_index + 1

        # this condition is prerequisite to have an input_switch
        if num_slave_s_axis_global > 1 or tcl_user_app.fpga['comm'] != 'raw':
            if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                tcl_user_app.setProperties('applicationRegion/input_switch', properties)
    

    # Ask how many (global) m_axis connections are in the user app region.
    num_slave_m_axis_global = len(getInterfaces(tcl_user_app.fpga, 'm_axis', 'scope', 'global'))
    if num_slave_m_axis_global == 0:
        # TODO: CHANGE TO VIP FOR 0 SLAVES
        tcl_user_app.instBlock(
                {
                'name':'axis_switch',
                'inst':'applicationRegion/input_switch',
                'clks':['aclk'],
                'resetns':['aresetn'],
                'properties':['CONFIG.NUM_SI {2}',
                    'CONFIG.NUM_MI {' + num_slave_s_axis_global + '}',
                    'CONFIG.ARB_ON_TLAST {1}']
                }

                )
    #instantiate switch only if more than one output 
    elif num_slave_m_axis_global > 1:
        tcl_user_app.instBlock(
                {
                'name':'axis_switch',
                'inst':'applicationRegion/output_switch',
                'clks':['aclk'],
                'resetns':['aresetn'],
                'properties':['CONFIG.NUM_SI {' + str(num_slave_s_axis_global) + '}',
                    'CONFIG.NUM_MI {1}',
                    'CONFIG.ARB_ON_TLAST {1}',
                    'CONFIG.M00_AXIS_HIGHTDEST {0xffffffff}']
                }
                )

def userApplicationRegionKernelConnectSwitches(outDir, tcl_user_app, sim):
    """
    Now that the kernels, Galapagos router, and memory controllers are instantiated,
    it's time to connect them all together.
    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        sim: I still don't really know what this does, exactly
    """

    #iterate through all kernels on FPGA connecting them to the input and output switches and their control and memory interfaces
    ctrl_interface_index = 0
    mem_interface_index = 0

    # Get list of all (global) s_axis. That is, all the kernel input streams
    # By the way, the getInterfaces function has the side effect of adding refs
    # to the interface's dict represntation which links to its parent kernel
    # dict (under the 'kernel_inst' key).
    s_axis_array = getInterfaces(tcl_user_app.fpga, 's_axis', 'scope', 'global')

    
    # Now connect the Galapagos router through the input switch into all of 
    # the s_axis interfaces 
    if len(s_axis_array) > 1:
        if(sim == 1):
            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/arbiter',
                    'type':'intf',
                    'port_name':'M00_AXIS'
                    },
                    {'name':'applicationRegion/input_switch',
                    'type':'intf',
                    'port_name':'S00_AXIS'
                    }
                    )

        # For each s_axis connection
        for idx, s_axis in enumerate(s_axis_array):
            instName = s_axis['kernel_inst']['inst']
            idx_str = "%02d"%idx
            # Connect it to the correct port on the AXI switch (NOT directly into
            # the Galapagos router; there is an AXI stream switch IP between
            # the router and the kernel(s) )
            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/input_switch',
                    'type':'intf',
                    'port_name':'M' + idx_str + '_AXIS'
                    },
                    {
                    'name': instName,
                    'type':'intf',
                    'port_name':s_axis['name']
                    }
                    )
        # custom_switch_inst only exists without raw
        if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
            if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                # Connect the AXI input switch to the Galapagos router
                tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_out_switch_V'
                        },
                        {'name':'applicationRegion/input_switch',
                        'type':'intf',
                        'port_name':'S01_AXIS'
                        }
                        )

    elif len(s_axis_array) == 1:
        if (sim == 1):
            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/arbiter',
                    'type':'intf',
                    'port_name':'M00_AXIS'
                    },
                    {'name': s_axis_array[0]['kernel_inst']['inst'],
                    'type':'intf',
                    'port_name': s_axis_array[0]['name']
                    }
                    )
            if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
                tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_out_switch_V'
                        },
                        {'name':'applicationRegion/arbiter',
                        'type':'intf',
                        'port_name':'S01_AXIS'
                        }
                        )
        else:
            # there's no input switch in this case
            if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
                if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                    tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name':'applicationRegion/input_switch',
                        'type':'intf',
                        'port_name':'M00_AXIS'
                        },
                        {'name': s_axis_array[0]['kernel_inst']['inst'],
                        'type':'intf',
                        'port_name': s_axis_array[0]['name']
                        }
                    )
                    tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_out_switch_V'
                        },
                        {'name':'applicationRegion/input_switch',
                        'type':'intf',
                        'port_name':'S01_AXIS'
                        }
                    )
    

    m_axis_array = getInterfaces(tcl_user_app.fpga, 'm_axis', 'scope', 'global')

    # Now connect all m_axis interfaces through the output switch into the 
    # Galapagos router
    
    #no output switch, direct connect if only one
    if len(m_axis_array) == 1:
        if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
            instName = m_axis_array[0]['kernel_inst']['inst']
            if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name': instName,
                        'type':'intf',
                        'port_name': m_axis_array[0]['name']
                        },
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_in_V'
                        }
                        )
    elif len(m_axis_array) > 1:
        for idx, m_axis in enumerate(m_axis_array):
            instName = m_axis['kernel_inst']['inst']
            idx_str = "%02d"%idx
            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name': instName ,
                    'type':'intf',
                    'port_name': m_axis['name']
                    },
                    {
                    'name':'applicationRegion/output_switch',
                    'type':'intf',
                    'port_name':'S'+ idx_str + '_AXIS'
                    }
                    )
        if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
            if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                tcl_user_app.makeConnection(
                    'intf',
                    {
                        'name':'applicationRegion/output_switch',
                        'type':'intf',
                        'port_name':'M00_AXIS'
                    },
                    {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_in_V'
                    }
                )


    # Now handle the control interfaces

    s_axi_array = getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global')
    for idx, s_axi in enumerate(s_axi_array):
        instName = s_axi['kernel_inst']['inst']
        idx_str = "%02d"%idx
        tcl_user_app.makeConnection(
                'intf',
                {'name':'applicationRegion/axi_interconnect_ctrl',
                'type':'intf',
                'port_name':'M' + idx_str + '_AXI'
                },
                {'name': instName,
                'type':'intf',
                'port_name':s_axi['name']
                }
                )

    # And finally the off-chip memory interface

    enable_AXI_mem_interconnect = True

    if 'custom' in tcl_user_app.fpga:
        if tcl_user_app.fpga['custom'] == 'GAScore':
            enable_AXI_mem_interconnect = False

    m_axi_array = getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope', 'global')
    if enable_AXI_mem_interconnect:
        for idx, m_axi in enumerate(m_axi_array):
            instName = m_axi['kernel_inst']['inst']
            idx_str = "%02d"%idx
            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name': instName,
                    'type':'intf',
                    'port_name':m_axi['name']
                    },
                    {
                    'name':'applicationRegion/axi_interconnect_mem',
                    'type':'intf',
                    'port_name':'S' +idx_str + '_AXI'
                    }
                    )
    else:
        tcl_custom = tclMeFile( outDir + '/' + str(tcl_user_app.fpga['num']) + '_custom', tcl_user_app.fpga)
        memory_lines = []
        prev_instName = ""
        curr_row = -1
        curr_col = 0
        for idx, m_axi in enumerate(m_axi_array):
            instName = m_axi['kernel_inst']['inst']
            idx_str = "%02d"%idx
            if instName != prev_instName:
                curr_row += 1
                tcl_custom.tprint('set CUSTOM_arr(' + str(curr_row) + ',0) ' + instName)
                prev_instName = instName
                curr_col = 1
            else:
                curr_col += 1
            tcl_custom.tprint('set CUSTOM_arr(' + str(curr_row) + ',' + str(curr_col) + ') ' + m_axi['name'])

def add_debug_interfaces(outDir, fpga):
    
    m_axi_interfaces = getInterfaces(tcl_debug_app.fpga, 'm_axi', 'debug')
    s_axi_interfaces = getInterfaces(tcl_debug_app.fpga, 's_axi', 'debug')
    s_axis_interfaces = getInterfaces(tcl_debug_app.fpga, 's_axis', 'debug')
    m_axis_interfaces = getInterfaces(tcl_debug_app.fpga, 'm_axis',  'debug')
    wire_master_interfaces = getInterfaces(tcl_debug_app.fpga, 'wire_master', 'debug')
    wire_slave_interfaces = getInterfaces(tcl_debug_app.fpga, 'wire_slave', 'debug')

    #instantiate ila
    if (len(m_axi_interfaces) + len(s_axi_interfaces) + len(s_axis_interfaces) + len(m_axis_interfaces) + len(wire_master_interfaces) + len(wire_slave_interfaces)) > 1:
        tcl_debug_app = tclMeFile( outDir + '/' + str(fpga['num']) + '_debug')
        tcl_debug_app.instBlock(
                {
                'name':'system_ila',
                'inst':'system_ila_inst',
                'clks':['clk'],
                'resetns':['resetn']
                }
                )

    
    #set properties
    properties = []
    #by default interface is AXI, only need to set interface for axis and wires
    len_native = len(wire_slave_interfaces) + len(wire_master_interfaces)
    len_interface = len(s_axis_interfaces) + len(m_axis_interfaces) + len(s_axi_interfaces) + len(m_axi_interfaces)

    if len_native > 0 and len_interface > 0:
        properties.append('CONFIG.C_MON_TYPE {MIXED}')
    elif len_native > 0 and len_interface == 0:
        properties.append('CONFIG.C_MON_TYPE {NATIVE}')



    starting_idx = len(s_axi_interfaces) + len(m_axi_interfaces)
    for axis_idx in range(starting_idx, starting_idx + len(s_axis_interfaces) + len(m_axis_interfaces)):
        properties.append('CONFIG.C_SLOT_' + str(axis_idx) + '_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0}')

        
    for axi_idx, axi_interface in enumerate(s_axi_interfaces):
        tcl_debug_app.makeConnection(
                'intf',
                {
                'name':'system_ila_inst',
                'type':'intf',
                'port_name':'SLOT_' + str(axi_idx) + '_AXI'
                },
                {
                'name': axi_interface['kernel_inst']['inst'],
                'type':'intf',
                'port_name': axi_interface['name']
                }
                )
        

    slot_offset = len(s_axi_interfaces)
    for axi_idx, axi_interface in enumerate(m_axi_interfaces):
        tcl_debug_app.makeConnection(
                'intf',
                {
                'name':'system_ila_inst',
                'type':'intf',
                'port_name':'SLOT_' + str(axi_idx + slot_offset) + '_AXI'
                },
                {
                'name': axi_interface['kernel_inst']['inst'],
                'type':'intf',
                'port_name': axi_interface['name']
                }
                )
        

    slot_offset = slot_offset + len(m_axi_interfaces)
    for axis_idx, axis_interface in enumerate(m_axis_interfaces):
        tcl_debug_app.makeConnection(
                'intf',
                {
                'name':'system_ila_inst',
                'type':'intf',
                'port_name':'SLOT_' + str(axis_idx + slot_offset) + '_AXIS'
                },
                {
                'name': axis_interface['kernel_inst']['inst'],
                'type':'intf',
                'port_name': axis_interface['name']
                }
                )

    slot_offset = slot_offset + len(m_axis_interfaces)
    for axis_idx, axis_interface in enumerate(s_axis_interfaces):
        tcl_debug_app.makeConnection(
                'intf',
                {
                'name':'system_ila_inst',
                'type':'intf',
                'port_name':'SLOT_' + str(axis_idx + slot_offset) + '_AXIS'
                },
                {
                'name': axis_interface['kernel_inst']['inst'],
                'type':'intf',
                'port_name': axis_interface['name']
                }
                )



    for wire_idx, wire_interface in enumerate(wire_master_interfaces):
        tcl_user_app.makeConnection(
                    'net',
                    {
                     'name':'system_ila_inst',
                     'type':'pin',
                     'port_name':'probe' + str(wire_idx)
                     },
                    {
                    'name': wire_interface['kernel_inst']['inst'],
                    'type':'pin',
                    'port_name': wire_interface['name']
                    }
                    )
    
    wire_offset = len(wire_master_interfaces)
    for wire_idx, wire_interface in enumerate(wire_slave_interfaces):
        tcl_user_app.makeConnection(
                    'net',
                    {
                     'name':'system_ila_inst',
                     'type':'pin',
                     'port_name':'probe' + str(wire_idx + wire_offset)
                     },
                    {
                    'name': wire_interface['kernel_inst']['inst'],
                    'type':'pin',
                    'port_name': wire_interface['name']
                    }
                    )

    tcl_debug_app.close()

def getKernel(fpga, num):
    
    for kern in fpga['kernel']:
        if int(kernel['num']) == num:
            return kern

    return None

def getSlaveAddressInfo(s_axi):
    slave_inst = s_axi['kernel_inst']['inst']
    slave_inst = slave_inst.split('/')[1]    
    if (s_axi['kernel_inst']['lib'] == 'hls'):
        slave_port = 'Data_' + s_axi['name']
    else:
        slave_port = s_axi['name']
    
    if 'base' in s_axi:
        slave_base = s_axi['base']
    else:
        slave_base = 'Reg' 
    
    
    properties = {}
    if 'offset' in s_axi:
        properties.update({'offset': s_axi['offset']})
    if 'range' in s_axi:
        properties.update({'range': s_axi['range']})
   
    return slave_inst, slave_port, slave_base, properties

def userApplicationRegionAssignAddresses(tcl_user_app, shared):
    """
    connect mem interconnect and assign addresses, all kernels need to be 32 bit addressable
    connect ctrl interconnect and assign addresses
    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        shared: Not really sure what this is for
    """

    if 'custom' in tcl_user_app.fpga and tcl_user_app.fpga['custom'] == 'GAScore':
        s_axi_array = getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global')
        master = 'S_AXI_CONTROL'
        for global_s_axi in s_axi_array:
            slave_inst = global_s_axi['kernel_inst']['inst']
            slave_inst, slave_port, slave_base, properties = getSlaveAddressInfo(global_s_axi) 
            tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
            if 'offset' in properties:
                prop = {'offset': properties['offset']}
                tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
            if 'range' in properties:
                prop = {'range': properties['range']}
                tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
        return

    #global m_axi
    m_axi_array = getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope', 'global')

    tcl_user_app.assign_address(None, 'S_AXI_MEM_0', 'Reg')
    if shared:
        tcl_user_app.assign_address(None, 'S_AXI_MEM_1', 'Reg')

    for global_m_axi in m_axi_array:
        instName = global_m_axi['kernel_inst']['inst']
        
        if(global_m_axi['kernel_inst']['lib'] == 'hls'):
            master = instName + '/Data_' + global_m_axi['name']
        else:
            master = instName + '/' + global_m_axi['name']
        
        properties = {'offset': '0x00000000', 'range': '4G'}
        
        tcl_user_app.set_address_properties(None, 'S_AXI_MEM_0', 'Reg', master, offset='0x00000000')
        if shared:
            tcl_user_app.set_address_properties(None, 'S_AXI_MEM_1', 'Reg', master, offset='0x00000000')
            
    for global_m_axi in m_axi_array:
        instName = global_m_axi['kernel_inst']['inst']
        
        if(global_m_axi['kernel_inst']['lib'] == 'hls'):
            master = instName + '/Data_' + global_m_axi['name']
        else:
            master = instName + '/' + global_m_axi['name']
        
        properties = {'range': '4G'}
        
        tcl_user_app.set_address_properties(None, 'S_AXI_MEM_0', 'Reg', master, **properties)
        if shared:
            tcl_user_app.set_address_properties(None, 'S_AXI_MEM_1', 'Reg', master, **properties)
            





    #global s_axi
    s_axi_array = getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global')
    master = 'S_AXI_CONTROL'

    # set up the address space for the memories that were added in raw mode
    if tcl_user_app.fpga['comm'] == 'raw':
        slave_inst = "applicationRegion/ctrl_blk_mem_switch_rom"
        slave_port = "S_AXI"
        slave_base = "Mem0"
        tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
        slave_inst = "ctrl_blk_mem_switch_rom"
        # range is done first because if offset is done first, depending on the range, it can be misaligned
        prop = {'range': '4K'}
        tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
        prop = {'offset': "0x0000"}
        tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
        slave_inst = "applicationRegion/ctrl_blk_mem_switch_rom_mac"
        tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
        slave_inst = "ctrl_blk_mem_switch_rom_mac"
        prop = {'range': '4K'}
        tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
        prop = {'offset': "0x1000"}
        tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)

    for global_s_axi in s_axi_array:
        slave_inst = global_s_axi['kernel_inst']['inst']
        slave_inst, slave_port, slave_base, properties = getSlaveAddressInfo(global_s_axi) 
        tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
        if 'offset' in properties:
            prop = {'offset': properties['offset']}
            tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
        if 'range' in properties:
            prop = {'range': properties['range']}
            tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)





    #local m_axi and s_axi
    m_axi_array = getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope', 'local')


    for local_m_axi in m_axi_array:
        if (local_m_axi['kernel_inst']['lib'] == 'hls'):
            master_port = 'Data_' + local_m_axi['name'] 
        else:
            master_port =  local_m_axi['name']
        
        s_axi_array = getSlaveInterfaces(tcl_user_app.fpga, 's_axi', local_m_axi)
        
        for local_s_axi in s_axi_array:
            slave_inst, slave_port, slave_base, properties = getSlaveAddressInfo(local_s_axi) 
            tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
            if 'offset' in properties:
                prop = {'offset': properties['offset']}
                tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, local_m_axi['kernel_inst']['inst'] + '/' + master_port, **prop)
            if 'range' in properties:
                prop = {'range': properties['range']}
                tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, local_m_axi['kernel_inst']['inst'] + '/' + master_port, **prop)

def userApplicationLocalConnections(tcl_user_app):
    """
    Takes care of generating the TCL commands for wiring up the <scope>local</scope>
    connections between kernels, as defined in the logical file.
    
    THIS NEEDS AN OVERHAUL!
    
    Args:
        tcl_user_app: Basically a handle to a file on disk, but in a fancy tclMe
                      object with a bunch of helper functions to make writing to
                      it a little easier.
    
    Raises:
        ValueError: If the local connection specification doesn't make sense
    """
    #connect local axis and wires

    m_axis_array = getInterfaces(tcl_user_app.fpga, 'm_axis', 'scope', 'local')

    for local_m_axis in m_axis_array:
        s_axis_array = getSlaveInterfaces(tcl_user_app.fpga, 's_axis', local_m_axis)
        
        #insert broadcaster
        if (len(s_axis_array) > 1):
            tcl_user_app.instBlock(
                    {
                    'name':'axis_broadcaster',
                    'inst': local_m_axis['kernel_inst']['inst'] + '_' +local_m_axis['name'] + '_broadcaster',
                    'clks':['aclk'],
                    'resetns':['aresetn'],
                    'properties':['CONFIG.NUM_MI {'+ str(len(s_axis))  +'}']
                    }
                    )
            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name': local_m_axis['kernel_inst']['inst'] + '_' +local_m_axis['name'] + '_broadcaster',
                    'type':'intf',
                    'port_name':'S_AXIS'
                    },
                    {
                    'name': local_m_axis['kernel_inst']['inst'],
                    'type':'intf',
                    'port_name': local_m_axis['name']
                    }
                    )
            for s_axis_idx, s_axis in enumerate(s_axis_array):
                s_axis_idx_str = "%02d"%s_axis_idx
                tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name': local_m_axis['kernel_inst']['inst'] + '_' +local_m_axis['name'] + '_broadcaster',
                        'type':'intf',
                        'port_name':'M' + s_axis_idx_str + '_AXIS'
                        },
                        {
                        'name':  s_axis['kernel_inst']['inst'],
                        'type':'intf',
                        'port_name': s_axis['name']
                        }
                        )
        elif (len(s_axis_array) == 1):
            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name': local_m_axis['kernel_inst']['inst'],
                    'type':'intf',
                    'port_name': local_m_axis['name']
                    },
                    {
                    'name':  s_axis['kernel_inst']['inst'],
                    'type':'intf',
                    'port_name': s_axis['name']
                    }
                    )

        else:
            raise ValueError("Local Master needs at least one local slave")

   
    wire_master_array = getInterfaces(tcl_user_app.fpga, 'wire_master', 'scope' ,'local')

    for wire_master in wire_master_array:
        wire_slave_array = getSlaveInterfaces(tcl_user_app.fpga, 'wire_slave', wire_master)


        for wire_slave in wire_slave_array:
            tcl_user_app.makeConnection(
                    'net',
                        {
                        'name': wire_master['kernel_inst']['inst'],
                        'type':'pin',
                        'port_name': wire_master['name']
                        },
                        {
                        'name': wire_slave['kernel_inst']['inst'],
                        'type':'pin',
                        'port_name': wire_slave['name']
                        }
                        )

def userApplicationRegion(outDir, fpga, sim):
    """
    Takes care of calling a bunch of functions for assembling the user application
    region part of the block diagram. To be specific, this function takes care
    of generating a single TCL file whose only purpose is to draw up the user's
    IPs and connections into a sub-heirarchy named "applicationRegion". The shell
    is then done in another TCL file by another function
    
    Args:
        outDir (string): The output location for this TCL file
        fpga: the node object for this FPGA
        sim: some boolean for turning on sims or something
    """
    tcl_user_app = tclMeFile( outDir + '/' + str(fpga['num']) + '_app', fpga)
    #tcl_user_app = open( outDir + '/' + str(fpga['num']) + '_app.tcl', 'w')
    tcl_user_app.createHierarchy('applicationRegion')


    userApplicationRegionKernelsInst(tcl_user_app)
    userApplicationRegionControlInst(tcl_user_app)
    #if communication medium is ethernet then combine offchip memory into one shared address space
    userApplicationRegionMemInstGlobal(tcl_user_app, tcl_user_app.fpga['comm'] != 'tcp')
    userApplicationRegionMemInstLocal(tcl_user_app)
    userApplicationRegionSwitchesInst(tcl_user_app, sim)
    userApplicationRegionKernelConnectSwitches(outDir, tcl_user_app, sim)
    userApplicationRegionAssignAddresses(tcl_user_app, tcl_user_app.fpga['comm'] !='tcp' and tcl_user_app.fpga.address_space == 64)
    userApplicationLocalConnections(tcl_user_app)

    tcl_user_app.close()
    #return num_debug_interfaces

def netBridgeConstants(tcl_net):
    """
    Generate ip_constant_blocks related to the network bridge. For example, this
    would make a block for the MAC address and the IP address
    
    Args:
        tcl_net: A tclMe object for the TCL file for generating the network stuff
    """

    # these constants are unneeded in raw mode
    if tcl_net.fpga['comm'] != "raw":
        ip_addr = tcl_net.fpga['ip'].split(".")
        #tcl_net.write('create_bd_cell -type ip -vlnv user.org:user:ip_constant_block:1.0 network/ip_constant_block_inst\n')
        
        # Not sure where this vendor and lib came from
        tcl_net.instBlock(
                {
                'vendor':'user.org',
                'lib':'user',
                'name':'ip_constant_block',
                'inst':'network/ip_constant_block_inst'
                }
                )
        
        # I guess this is a custom module that Naif made? The regular IP for
        # constants doesn't have these properties
        properties = ['CONFIG.C_IP_B0 {'+ ip_addr[3] + '}',
                    'CONFIG.C_IP_B1 {'+ ip_addr[2] + '}',
                    'CONFIG.C_IP_B2 {'+ ip_addr[1] + '}',
                    'CONFIG.C_IP_B3 {'+ ip_addr[0] + '}']

        properties = properties + ['CONFIG.C_GATEWAY_B0 {100}',
                    'CONFIG.C_GATEWAY_B1 {' + ip_addr[2] +'}',
                    'CONFIG.C_GATEWAY_B2 {' + ip_addr[1] +'}',
                    'CONFIG.C_GATEWAY_B3 {' + ip_addr[0] +'}']

        properties = properties + ['CONFIG.C_SUBNET_B0 {0}',
                'CONFIG.C_SUBNET_B1 {255}',
                'CONFIG.C_SUBNET_B2 {255}',
                'CONFIG.C_SUBNET_B3 {255}']
        
        # MAC address
        properties = properties + ['CONFIG.C_MAC {0x' + tcl_net.fpga['mac'].replace(":","") + '}']

        tcl_net.setProperties('network/ip_constant_block_inst', properties)

    # Instantiate the proper netBridge depending on the comm type
    # By the way, these scripts also take care of hooking up the constants
    # This should really be in the netBridge function instead of in this one...
    galapagos_path = str(os.environ.get('GALAPAGOS_PATH'))
    if tcl_net.fpga['comm'] == 'tcp':
        tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_tcp_bridge.tcl')
    elif tcl_net.fpga['comm'] == 'eth':
        tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_eth_bridge.tcl')
    elif tcl_net.fpga['comm'] == 'raw':
        tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_raw_bridge.tcl')

def netBridge(outDir, fpga):
    """
    Handles makign a TCL file for generating this FPGA's network bridge. 
    All IPs are made in a hierarchy called "network"
    
    Args:
        outDir (string): The output location for this TCL file
        fpga: the node object for this FPGA
    """
    tcl_net = tclMeFile( outDir + '/' + str(fpga['num']) + '_net', fpga)

    tcl_net.createHierarchy('network')
    netBridgeConstants(tcl_net)
    tcl_net.close()

def bridgeConnections(outDir, fpga, sim):
    """
    At this point, the IP blocks for the network bridge and user app region are
    in place, and the user app region is completely connected. This takes care
    of stringing up all the stuff for the network bridge (and I think it also
    takes care of the user appBridge option?)
    
    Args:
        outDir (string): The output location for this TCL file
        fpga: the node object for this FPGA
        sim: some boolean for turning on sims or something
    """
    tcl_bridge_connections = tclMeFile( outDir + '/' + str(fpga['num']) + '_bridge_connections', fpga)
    if 'custom' in tcl_bridge_connections.fpga:
        tcl_custom = tclMeFile( outDir + '/' + str(fpga['num']) + '_custom', fpga)

    tcl_bridge_connections.instBlock(
        {'name':'galapagos_bridge',
            'inst':'network/galapagos_bridge_inst',
            'vendor':'xilinx.com',
            'lib':'hls',
            'clks':['aclk'],
            'resetns':['aresetn']
        }
    )
    tcl_bridge_connections.instBlock(
        {
            'name':'blk_mem_gen',
            'inst':'network/galapagos_bridge_buffer'
        }
    ) 
    
    
    properties = ['CONFIG.Memory_Type {True_Dual_Port_RAM}',
                  'CONFIG.Enable_B {Use_ENB_Pin}', 
                  'CONFIG.Use_RSTB_Pin {true}', 
                  'CONFIG.Port_B_Clock {100}', 
                  'CONFIG.Port_B_Write_Rate {50}', 
                  'CONFIG.Port_B_Enable_Rate {100}']
    tcl_bridge_connections.setProperties('network/galapagos_bridge_buffer', properties)
   
    tcl_bridge_connections.makeConnection(
            'intf',
            {
            'name':'network/galapagos_bridge_inst',
            'type':'intf',
            'port_name':'buffer_storage_A_V_PORTA'
            },
            {
            'name':'network/galapagos_bridge_buffer',
            'type':'intf',
            'port_name':'BRAM_PORTA'
            }
            )
    
    tcl_bridge_connections.makeConnection(
            'intf',
            {
            'name':'network/galapagos_bridge_inst',
            'type':'intf',
            'port_name':'buffer_storage_B_V_PORTA'
            },
            {
            'name':'network/galapagos_bridge_buffer',
            'type':'intf',
            'port_name':'BRAM_PORTB'
            }
            )
    
    #no bridge directly connect
    if tcl_bridge_connections.fpga['app_bridge'] == None:

        # custom_switch_inst only exists without raw
        if tcl_bridge_connections.fpga['comm'] not in ['raw', 'none']:
            if 'custom' not in tcl_bridge_connections.fpga or tcl_bridge_connections.fpga['custom'] != 'GAScore':
                tcl_bridge_connections.makeConnection(
                        'intf',
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_out_network_V'
                        },
                        {
                        'name':'network/galapagos_bridge_inst',
                        'type':'intf',
                        'port_name':'s_axis_g2N'
                        }
                        )
                
                tcl_bridge_connections.makeConnection(
                        'intf',
                        {
                        'name':'network/galapagos_bridge_inst',
                        'type':'intf',
                        'port_name':'m_axis_g2N'
                        },
                        {
                        'name':'network/network_bridge_inst',
                        'type':'intf',
                        'port_name':'${netBridge_from_app}'
                        }
                        )
            else:
                tcl_custom.tprint('set CUSTOM_net_out network/network_bridge_inst/${netBridge_from_app}')
                s_axis_array = getInterfaces(tcl_bridge_connections.fpga, 's_axis', 'scope', 'global')
                if len(s_axis_array) > 1:
                    tcl_custom.tprint('set CUSTOM_kernel_in applicationRegion/input_switch/S00_AXIS')
                    tcl_custom.tprint('set CUSTOM_kernels_stream_in ' + str(len(s_axis_array)))
                else:
                    instName = s_axis_array[0]['kernel_inst']['inst'] 
                    tcl_custom.tprint('set CUSTOM_kernel_in ' + instName + '/' + s_axis_array[0]['name'])
                    tcl_custom.tprint('set CUSTOM_kernels_stream_in 1')
                
                m_axis_array = getInterfaces(tcl_bridge_connections.fpga, 'm_axis', 'scope', 'global')
                if len(m_axis_array) > 1:
                    tcl_custom.tprint('set CUSTOM_kernel_out applicationRegion/output_switch/M00_AXIS')
                    tcl_custom.tprint('set CUSTOM_kernels_stream_out ' + str(len(m_axis_array)))
                else:
                    instName = m_axis_array[0]['kernel_inst']['inst'] 
                    tcl_custom.tprint('set CUSTOM_kernel_out ' + instName + '/' + m_axis_array[0]['name'])
                    tcl_custom.tprint('set CUSTOM_kernels_stream_out 1')
        else:
                
            
            # depending on the number of slaves, either connect the network to a switch or the slave
            s_axis_array = getInterfaces(tcl_bridge_connections.fpga, 's_axis', 'scope', 'global')
            if len(s_axis_array) > 1:
                if tcl_bridge_connections.fpga['comm'] != 'none':
                    tcl_bridge_connections.makeConnection(
                                'intf',
                                {
                                'name':'network/network_bridge_inst',
                                'type':'intf',
                                'port_name':'${netBridge_to_app}'
                                },
                                {'name':'applicationRegion/input_switch',
                                'type':'intf',
                                'port_name':'S00_AXIS'
                                }
                                )
                else:
                    tcl_custom.tprint('set CUSTOM_kernel_in applicationRegion/input_switch/S00_AXIS')
                    tcl_custom.tprint('set CUSTOM_kernels_stream_in ' + str(len(s_axis_array)))
            else:
                instName = s_axis_array[0]['kernel_inst']['inst']
                if tcl_bridge_connections.fpga['comm'] != 'none':
                    tcl_bridge_connections.makeConnection(
                                'intf',
                                {
                                'name':'network/network_bridge_inst',
                                'type':'intf',
                                'port_name':'${netBridge_to_app}'
                                },
                                {'name': instName,
                                'type':'intf',
                                'port_name': s_axis_array[0]['name']
                                }
                                )
                else:
                    tcl_custom.tprint('set CUSTOM_kernel_in ' + instName + '/' + s_axis_array[0]['name'])
                    tcl_custom.tprint('set CUSTOM_kernels_stream_in 1')

            m_axis_array = getInterfaces(tcl_bridge_connections.fpga, 'm_axis', 'scope', 'global')
            if len(m_axis_array) > 1:
                if tcl_bridge_connections.fpga['comm'] != 'none':
                    tcl_bridge_connections.makeConnection(
                                'intf',
                                {
                                'name':'applicationRegion/output_switch',
                                'type':'intf',
                                'port_name':'M00_AXIS'
                                },
                                {
                                'name':'network/network_bridge_inst',
                                'type':'intf',
                                'port_name':'${netBridge_from_app}'
                                }
                                )
                else:
                    tcl_custom.tprint('set CUSTOM_kernel_out applicationRegion/output_switch/M00_AXIS')
                    tcl_custom.tprint('set CUSTOM_kernels_stream_out ' + str(len(m_axis_array)))
            else:
                instName = m_axis_array[0]['kernel_inst']['inst'] 
                if tcl_bridge_connections.fpga['comm'] != 'none':
                    tcl_bridge_connections.makeConnection(
                            'intf',
                            {
                            'name': instName,
                            'type':'intf',
                            'port_name': m_axis_array[0]['name']
                            },
                            {
                            'name':'network/network_bridge_inst',
                            'type':'intf',
                            'port_name':'${netBridge_from_app}'
                            }
                            )
                else:
                    tcl_custom.tprint('set CUSTOM_kernel_out ' + instName + '/' + m_axis_array[0]['name'])
                    tcl_custom.tprint('set CUSTOM_kernels_stream_out 1')

    
        if tcl_bridge_connections.fpga['comm'] not in ['raw', 'none']:
            if (sim == 0):
                if 'custom' not in tcl_bridge_connections.fpga or tcl_bridge_connections.fpga['custom'] != 'GAScore':
                    tcl_bridge_connections.makeConnection(
                            'intf',
                            {
                            'name':'network/network_bridge_inst',
                            'type':'intf',
                            'port_name':'${netBridge_to_app}'
                            },
                            {
                            'name':'network/galapagos_bridge_inst',
                            'type':'intf',
                            'port_name':'s_axis_n2G'
                            }
                            )
                    tcl_bridge_connections.makeConnection(
                            'intf',
                            {
                            'name':'network/galapagos_bridge_inst',
                            'type':'intf',
                            'port_name':'m_axis_n2G'
                            },
                            {
                            'name':'applicationRegion/input_switch',
                            'type':'intf',
                            'port_name':'S00_AXIS'
                            }
                            )
                else:
                    tcl_custom.tprint('set CUSTOM_net_in network/network_bridge_inst/${netBridge_to_app}')
            else: #sim == 1
                tcl_bridge_connections.makeConnection(
                        'intf',
                        {
                        'name':'network/network_bridge_inst',
                        'type':'intf',
                        'port_name':'${netBridge_to_app}'
                        },
                        {
                        'name':'applicationRegion/arbiter',
                        'type':'intf',
                        'port_name':'S00_AXIS'
                        }
                        )
    else:
        tcl_bridge_connections.instBlock(
                {
                'name': tcl_bridge_connections.fpga['app_bridge']['name'],
                'inst':'application_bridge_inst',
                'lib': tcl_bridge_connections.fpga['app_bridge']['lib'],
                'vendor': tcl_bridge_connections.fpga['app_bridge']['vendor'],
                'clks':tcl_bridge_connections.fpga['app_bridge']['clk'],
                'resetns':tcl_bridge_connections.fpga['app_bridge']['aresetn']
                }
                )
        if (sim == 1):
            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['to_app']
                    },
                    {
                    'name':'applicationRegion/arbiter',
                    'type':'intf',
                    'port_name':'S00_AXIS'
                    }
                    )
        else: #sim == 0
            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['to_app']
                    },
                    {
                    'name':'applicationRegion/input_switch',
                    'type':'intf',
                    'port_name':'S00_AXIS'
                    }
                    )
        if tcl_bridge_connections.fpga['comm'] not in ['raw', 'none']:
            
            
            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/custom_switch_inst',
                    'type':'intf',
                    'port_name':'stream_out_network_V'
                    },
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['from_app']
                    }
                    )
        else:
            m_axis_array = getInterfaces(tcl_bridge_connections.fpga, 'm_axis', 'scope', 'global')
            if len(m_axis_array) > 1:
                tcl_bridge_connections.makeConnection(
                        'intf',
                        {
                        'name':'applicationRegion/output_switch',
                        'type':'intf',
                        'port_name':'M00_AXIS'
                        },
                        {
                        'name':'application_bridge_inst',
                        'type':'intf',
                        'port_name':tcl_bridge_connections.fpga['app_bridge']['from_app']
                        }
                        )
            else:
                instName = m_axis_array[0]['kernel_inst']['inst'] 
                tcl_bridge_connections.makeConnection(
                        'intf',
                        {
                        'name': instName,
                        'type':'intf',
                        'port_name': m_axis_array[0]['name']
                        },
                        {
                        'name':'application_bridge_inst',
                        'type':'intf',
                        'port_name':tcl_bridge_connections.fpga['app_bridge']['from_app']
                        }
                        )

        if tcl_bridge_connections.fpga['comm'] != 'none':
            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['to_net']
                    },
                    {
                    'name':'network/network_bridge_inst',
                    'type':'intf',
                    'port_name':'${netBridge_from_app}'
                    }
                    )

            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'network/network_bridge_inst',
                    'type':'intf',
                    'port_name':'${netBridge_to_app}'
                    },
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['from_net']
                    }
                    )
    if tcl_bridge_connections.fpga['comm'] == 'none':
        tcl_custom.close()
    tcl_bridge_connections.close()


def makeTCLFiles(fpga, projectName, output_path, sim):
    """
    Top-level function call for TCL file generation functions.
    
    Args:
        fpga: a node object which has already been determined to be hw type
        projectName (string): The project name
        output_path (string): The folder path where the output TCL files will go
        sim: I think you set this to nonzero if you want your design to be
             intrumented for simulation or something
    """

    outDir = output_path + '/' + projectName + '/' + str(fpga['num'])
    
    #make bridge to network
    if fpga['comm'] != 'none':
        netBridge(outDir, fpga)

    userApplicationRegion(outDir, fpga, sim)
    bridgeConnections(outDir, fpga, sim)
    #if(num_debug_interfaces > 0):
    #    add_debug_interfaces(outDir, num_debug_interfaces, fpga)

    galapagos_path = str(os.environ.get('GALAPAGOS_PATH'))
    tclMain = tclMeFile( outDir + '/' + str(fpga['num']), fpga)
    tclMain.tprint(
"if { ! [info exists top_dir] } {\n\
    set top_path ${::env(GALAPAGOS_PATH)}\n\
}\n\
if { ! [info exists default_dir] } {\n\
    set default_dir " + projectName + "\n\
}\n\
"
    )
    tclMain.addSource(galapagos_path + '/shells/tclScripts/pr_standard_interfaces.tcl')
    if fpga['comm'] != 'none':
        tclMain.addSource(outDir + '/' + str(fpga['num']) + '_net.tcl')
    tclMain.addSource(outDir + '/' + str(fpga['num']) + '_app.tcl')
    tclMain.addSource(outDir + '/' + str(fpga['num']) + '_bridge_connections.tcl')

    #if(num_debug_interfaces > 0):
    #    tclMain.addSource(outDir + '/' + str(fpga['num']) + '_debug.tcl')

    if 'custom' in fpga:
        tclMain.addSource(outDir + '/' + str(fpga['num']) + '_custom.tcl')
        tclMain.addSource(galapagos_path + '/middleware/tclScripts/custom/' + fpga['custom'] + '.tcl')

    tclMain.tprint('validate_bd_design')
    tclMain.tprint('save_bd_design')
    tclMain.close()
