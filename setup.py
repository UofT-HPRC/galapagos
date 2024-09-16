from __future__ import print_function, unicode_literals
from pyfiglet import Figlet

import subprocess
import argparse
import os
import regex

#import PyInquirer 
from PyInquirer import style_from_dict, Token, prompt, Validator, ValidationError
from pprint import pprint

style = style_from_dict({
        Token.QuestionMark: '#E91E63 bold',
        Token.Selected: '#673AB7 bold',
        Token.Instruction: '',  # default
        Token.Answer: '#2196f3 bold',
        Token.Question: '',
        })


'''
class directoryValidator(Validator):
  def validate(self, document):
        if not document.text=='':
            if not os.path.isdir("/home/el"):
                raise ValidationError(
                        message='Please enter valid directory for galapagos path',
                        cursor_position=len(document.text)
                        )

'''

f = Figlet(font='slant')
print(f.renderText('Welcome to Galapagos Setup'))

parser = argparse.ArgumentParser(description='Galapagos Menu')
parser.add_argument("-d", "--dir", help="absolute path where galapagos directory is located", default='')
parser.add_argument("-vd", "--vit_dir", help="absolute path of vitis", default='')

args = parser.parse_args()

questions = []

path_q = {
          'type': 'input',
          'name': 'galapagos_dir',
          'message': 'What is the absolute path where the galapagos directory is located? (default=$PWD)',
          }

vit_path_q = {
          'type': 'input',
          'name': 'vitis_dir',
          'message': 'What is the absolute path where vitis 2023.1 is installed? (default=/mnt/shares/tools/Xilinx/Vitis)',
          }



if(args.dir ==''):
    questions.append(path_q)
    galapagos_dir = ''
else:
    galapagos_dir = args.dir

if(args.vit_dir == ''):
    questions.append(vit_path_q)
    vitis_dir = ''
else:
    vitis_dir = args.vit_dir

vitis_ver = '2023.1'

hls_ver = '2023.1'



answers = prompt(questions, style=style)

if answers['galapagos_dir'] == '':
    answers['galapagos_dir']=os.getcwd()

if answers['vitis_dir'] == '':
    answers['vitis_dir'] = '/mnt/shares/tools/Xilinx/Vitis'



print('ENVIRONMENT VARIABLES SET:')
env_var = {'GALAPAGOS_PATH': answers['galapagos_dir'],
           'GALAPAGOS_VITIS_PATH' : answers['vitis_dir'],
           'GALAPAGOS_HLS_PATH' : answers['vitis_dir'],
           'GALAPAGOS_VITIS_VERSION' : '2023.1',
           'GALAPAGOS_HLS_VERSION' : '2023.1'
        }

pprint(env_var)

out_file = open("my_init.sh", "w") 
env_reset_file = open("environmental_reset.sh","w")
env_reset_file.write("source "+answers['galapagos_dir']+"/init_params.sh " + answers['galapagos_dir'] + ' ' + answers['vitis_dir'] + ' ' + answers['vitis_dir'] + ' 2023.1 2023.1 ' + '\n')
print("Galapagos requires boards to be installed in order to be used.\nThis process takes 20 minutes but only needs do be done once per board per project.\n Do you wish to install a board at this time?(Y/N)\n")
invalid = True
answer = str(input()).strip().lower()
while invalid:
  invalid = False
  if ((answer == "yes") or (answer == "y")):
    while ((answer == "yes") or (answer == "y")):
      print('What is the board name you want to install? or type CANCEL to cancel board instalation\n')
      print('options: sidewinder, u200, u250, u280, vck5000')
      board_name = str(input()).strip().lower()
      running = True
      if board_name == "cancel":
        running = False
        print("aborting board install, just installing parameters")
        out_file.close()
        out_file = open("my_init.sh","w")
        out_file.write("source init_params.sh " + answers['galapagos_dir'] + ' ' + answers['vitis_dir'] + ' ' + answers['vitis_dir'] + ' 2023.1 2023.1 ' + '\n')
        answer = "n"
      elif board_name == "sidewinder":
        answers['boa_name'] = 'sidewinder'
        answers['par_name'] = 'xczu19eg-ffvc1760-2-i'
      elif board_name == "u200":
        answers['boa_name'] = 'u200'
        answers['par_name'] = 'xcu200-fsgd2104-2-e'
      elif board_name == "u250":
        answers['boa_name'] = 'u250'
        answers['par_name'] = 'xcu250-figd2104-2l-e'
      elif board_name == "u280":
        answers['boa_name'] = 'u280'
        answers['par_name'] = 'xcu280-fsvh2892-2l-e'
      elif board_name == "vck5000":
        answers['boa_name'] = 'vck5000'
        answers['par_name'] = 'xcvc1902-vsvd1760-2mp-e-s'
      else:
        print("Unrecongnized board name, try again\n")
        running=False
      if running:
        print("Installing board "+answers['boa_name']+" which is part "+answers['par_name']+"\n Is this correct (Y/N)?")
        confirmation = str(input()).strip().lower()
        if ((confirmation == "no") or (confirmation == "n")):
          running = False
      if running:
        out_file.write("source init.sh " + answers['galapagos_dir'] + ' ' + answers['vitis_dir'] + ' ' + answers['vitis_dir'] + ' 2023.1 2023.1 ' + answers['par_name'] + ' ' + answers['boa_name'] +'\n')

        out_file.write("make hlsmiddleware\n")
        print("Are there other boards you wish to install in this project? (Y/N)")
        answer = str(input()).strip().lower()
        while ((answer not in ['y','yes','n','no'])):
          print("invalid answer, please enter y or n")
          answer = str(input()).strip().lower()
  elif ((answer == "no") or (answer == "n")):
    out_file.write("")
  else:
    print("<"+answer + "> is invalid, please enter y or n")
out_file.close()
