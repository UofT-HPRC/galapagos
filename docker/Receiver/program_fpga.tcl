#Open Hardware Manager (automatic)
open_hw
connect_hw_server

#opening hardware target
open_hw_target
set_property PROGRAM.FILE {shellTop.bit} [get_hw_devices xcku115_0]
current_hw_device [get_hw_devices xcku115_0]

#Programming device
set_property PROGRAM.FILE {shellTop.bit} [get_hw_devices xcku115_0]
program_hw_devices [get_hw_devices xcku115_0]


