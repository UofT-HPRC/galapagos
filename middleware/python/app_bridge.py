from abstractDict import abstractDict


class appBridge(abstractDict):
    def __init__(self, **kwargs):
        self.cycle_count = 0
        mandatory_array = ('to_net', 'from_net', 'to_app', 'from_app', 'name', 'num', 'clk', 'aresetn')
        optional_array = ('vendor', 'lib', 'version', 'type', 'wan','wan_enabled','wan_name','s_axis', 'm_axis', 's_axi', 'm_axi', 'wire_master', 'wire_slave', 'const', 'properties', 'control', 'control_type')
        super().__init__(mandatory_array, optional_array, **kwargs)

        array_of_arrays = ['clk', 'aresetn', 'm_axi', 's_axi', 'm_axis', 's_axis', 'wire_slave', 'wire_master', 'const', 'properties']

        for elem in array_of_arrays:
            if type(self.data[elem]) != type([]) and self.data[elem] != None:
                self.data[elem] = [self.data[elem]]
