import warnings
from abstractDict import abstractDict
from app_bridge import appBridge

# Why is this done differently than the kernel object?
# Whatever, it doesn't really matter.

class node(abstractDict):
    """
    Implements an abstractDict with certain mandatory and optional members
    specific to Galapagos nodes. The "num", "type", and "comm" fields are
    mandatory, but there are a whole bunch of optional ones too.
    """

    def __init__(self, address_space=32, **kwargs):
        """
        Fills underlying dict representation with kwargs. Since this uses the call
        to abstractDict's constructor, this will also check that all mandatory
        arguments are present and that there are no unrecognized arguments.

        Args:
            **kwargs: The stuff to put in this dictionary
        """

        self.address_space = address_space
        mandatory_array = ('num', 'type', 'comm')
        optional_array = ('board', 'mac', 'ip', 'app_bridge', 'debug', 'kernel', 'custom', 'kernel_map')

        super().__init__(mandatory_array, optional_array, **kwargs)

        if self.data['app_bridge'] != None:
            self.data['app_bridge'] = appBridge(**self.data['app_bridge'])

        if type(self.data['kernel']) != type([]) and self.data['kernel'] != None:
            self.data['kernel'] = [self.data['kernel']]
