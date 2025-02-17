import os

def convertTernaryStatement(line):
    """
    Converts a ternary statement from a vh parameter file into python compatibility. A ternary statement looks like:

    declaration = condition ? expression_if_true : expression_if_false

    Args:
        line (str): a ternary statement from a vh parameter file
    """
    # Split Ternary statement according to operators
    declaration_and_condition, expressions = line.split(" ? ")
    declaration, condition = declaration_and_condition.split(" = ")
    condition = condition.replace("&&", "and")
    condition = condition.replace("||", "or")
    expression_if_true, expression_if_false = expressions.split(" : ")
    converted_line = declaration + " = "  + expression_if_true + " if "  + condition + " else " + expression_if_false
    return converted_line

def convertParameterLineToPython(line):
    """
    Converts a line from a vh parameter file into python compatibility.

    Args:
        line (str): a line from a vh parameter file
    """
    converted_line = line.replace("parameter ", "")
    converted_line = converted_line.replace("localparam ", "")
    converted_line = converted_line.replace(",", "")
    converted_line = converted_line.replace(";", "")
    converted_line = converted_line.replace("//", "#")
    if "?" in converted_line:
        converted_line = convertTernaryStatement(converted_line)
    return converted_line
    
def convertParametersToPython(python_parameter_file, vh_parameter_filename):
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
    # Read Parameters
    vh_parameter_file = open(vh_parameter_filename, "r")
    vh_parameters = [line.rstrip() for line in vh_parameter_file]
    vh_parameter_file.close()
    # Convert to Python
    python_parameters = []
    python_parameters = [convertParameterLineToPython(line) for line in vh_parameters]
    # Print to Python parameter file
    python_parameter_file.write("# " + vh_parameter_filename + "\n")
    for line in python_parameters:
        python_parameter_file.write(line + "\n")

if __name__ == '__main__':
    vh_parameter_filenames = ["ctrl_api_header_parameters.vh", 
                              "ctrl_api_reliability_header_parameters.vh", 
                              "ctrl_api_message_parameters.vh",
                              "ctrl_api_reliability_message_parameters.vh"]
    python_parameter_file = open("ctrl_api_params.py", "w+")
    for vh_parameter_filename in vh_parameter_filenames:
        convertParametersToPython(python_parameter_file, vh_parameter_filename)
    python_parameter_file.close()