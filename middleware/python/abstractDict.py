import warnings

class abstractDict():
    '''
    This class defines a dictionary with the additional enforcement of the 
    existence of keys as stated in the mandatory_array and optional keys that 
    may be included in optional_array.
    '''

    def __init__(self, mandatory_array, optional_array, **kwargs):
        '''
        Initializes the abstract dictionary
        
        Args:
            mandatory_array (list): list of keys that must exist in this dict
            optional_array (list): keys that may be optionally in this dict
        
        Raises:
            ValueError: Raised if unknown key is specified
        '''
        self.data = {}
        for mandatory_elem in mandatory_array:
            self.data[mandatory_elem] = None
        for optional_elem in optional_array:
            self.data[optional_elem] = None
        #special keys
        self.data['control'] = False
        for key, value in kwargs.items():
            if key in self.data:
                self.data[key] = value
            else:
                raise ValueError('Init with ' + key + ' failed. Key does not exist')
        if self.data['control']:
            if self.data['control']['enabled'].strip().lower() == 'true' and 'control_type' not in self.data['control']:
                raise ValueError('control_type missing when control is True')
        self.check_elements(mandatory_array, optional_array)

    def check_elements(self, mandatory_array, optional_array):
        '''
        Checks the initialized dictionary to enforce that all mandatory keys exist. 
        It issues a warning for optional keys that may be missing.
        
        Args:
            mandatory_array (list): keys that must exist in this dict
            optional_array (list): keys that may optionally exist in this dict
        
        Raises:
            ValueError: Raised if a mandatory key is missing
        '''

        for mandatory_elem in mandatory_array:
            if not(mandatory_elem in self.data):
                raise ValueError('Mandatory ' + mandatory_elem + ' must exist')

        for optional_elem in optional_array:
            if not(optional_elem in self.data):
                warnings.warn('Optional elem ' + optional_elem + ' does not exist')

    def __setitem__(self, key, item):
        self.data[key] = item

    def __getitem__(self, key):
        if key in self.data:
            return self.data[key]
        else:
            raise ValueError('Key \"' + key + '\"  not found')
    
    def __contains__(self, key):
        return self.data[key]

    def __str__(self):
        print(self.data)
