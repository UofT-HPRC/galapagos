from abstractDict import abstractDict

class kernel(abstractDict):
    """
    Implements an abstractDict with certain mandatory and optional members
    specific to Galapagos kernels. The "name", "num", and "#text" fields are
    mandatory, but there are a whole bunch of optional ones too.
    """
    def __init__(self, **kwargs):
        """
        Fills underlying dict representation with kwargs. Since this uses the call
        to abstractDict's constructor, this will also check that all mandatory
        arguments are present and that there are no unrecognized arguments.

        Args:
            **kwargs: The stuff to put in this dictionary
        """
        self.has_ddr = False  # Charles
        self.cycle_count, mandatory_array,optional_array = self.init_vars()
        super().__init__(mandatory_array, optional_array, **kwargs)
        array_of_arrays = ['clk', 'aresetn', 'm_axi', 's_axi', 'm_axis', 's_axis', 'wan', 'wan_enabled','wan_name', 'wire_slave', 'wire_master', 'const', 'properties']

        for elem in array_of_arrays:
            if type(self.data[elem]) != type([])  and self.data[elem] != None:
                self.data[elem] = [self.data[elem]]



    def init_vars(self):
        """
        Used by the constructor. Simply creates the default values for the
        kernel's member vars

        Returns:
            The intial cycle count, mandatory arguments array, and optional
            arguments array
        """
        cycle_count = 0
        mandatory_array = ('name',
                                'num',
                                '#text')
        optional_array = (
            'rep',
            'clk',
            'aresetn',
            'vendor',
            'lib',
            'type',
            'version',
            'id_port',
            'm_axi',
            's_axi',
            's_axis',
            'm_axis',
            'wan',
            'has_id_port',
            'wan_enabled',
            'wan_name',
            'm_axis',
            'wire_master',
            'wire_slave',
            'm_axi_map',
            's_axi_map',
            's_axis_map',
            'm_axis_map',
            'wire_master_map',
            'wire_slave_map',
            'ip',
            'mac',
            'const',
            'properties',
            'board',
            'note',
            'control',
            'control_range',
            'ddr',
            'ddr_size',
            'ddr_id_width'
        )


        return cycle_count, mandatory_array, optional_array
