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
parser.add_argument("-hd", "--hls_dir", help="absolute path of vitis_hls", default='')
parser.add_argument("-ohd", "--viv_hls_dir", help="absolute path of vivado_hls", default='')
parser.add_argument("-pn", "--par_name", help="set part name", default='')
parser.add_argument("-bn", "--boa_name", help="set board name", default='')

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
          'message': 'What is the directory vitis is located? (default=/mnt/shares/tools/Xilinx/Vitis)',
          }

hls_path_q = {
          'type': 'input',
          'name': 'hls_dir',
          'message': 'What is the directory vitis_hls is located? (default=/mnt/shares/tools/Xilinx/Vitis)',
          }
viv_hls_path_q = {
          'type': 'input',
          'name': 'viv_hls_dir',
          'message': 'What is the directory vivado_hls is located? (default=/mnt/shares/tools/Xilinx/Vivado)',
          }

par_name_q = {
          'type': 'input',
          'name': 'par_name',
          'message': 'What is the part name you want to use? (default=xczu19eg-ffvc1760-2-i)'
          }

boa_name_q = {
          'type': 'input',
          'name': 'boa_name',
          'message': 'What is the board name you want to use? (default=sidewinder)'
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

if(args.hls_dir == ''):
    questions.append(hls_path_q)
    hls_dir = ''
else:
    hls_dir = args.hls_dir
if(args.viv_hls_dir == ''):
    questions.append(viv_hls_path_q)
    viv_hls_dir = ''
else:
    viv_hls_dir = args.viv_hls_dir

vitis_ver = '2023.1'

hls_ver = '2023.1'


if(args.par_name == ''):
    questions.append(par_name_q)
    par_name = ''
else:
    par_name = args.par_name

if(args.boa_name == ''):
    questions.append(boa_name_q)
    boa_name = ''
else:
    boa_name = args.boa_name

answers = prompt(questions, style=style)

if answers['galapagos_dir'] == '':
    answers['galapagos_dir']=os.getcwd()

if answers['vitis_dir'] == '':
    answers['vitis_dir'] = '/mnt/shares/tools/Xilinx/Vitis'

if answers['hls_dir'] == '':
    answers['hls_dir'] = '/mnt/shares/tools/Xilinx/Vitis'

if answers['viv_hls_dir'] == '':
    answers['viv_hls_dir'] = '/mnt/shares/tools/Xilinx/Vivado'


if answers['par_name'] == '':
    answers['par_name'] = 'xczu19eg-ffvc1760-2-i'

if answers['boa_name'] == '':
    answers['boa_name'] = 'sidewinder'


print('ENVIRONMENT VARIABLES SET:')
env_var = {'GALAPAGOS_PATH': answers['galapagos_dir'],
           'GALAPAGOS_VITIS_PATH' : answers['vitis_dir'],
           'GALAPAGOS_HLS_PATH' : answers['hls_dir'],
           'GALAPAGOS_VITIS_VERSION' : '2023.1',
           'GALAPAGOS_HLS_VERSION' : '2023.1',
           'GALAPAGOS_VIV_HLS_VERSION' : '2018.3',
           'GALAPAGOS_PART': answers['par_name'],
           'GALAPAGOS_BOARD_NAME': answers['boa_name']
        }

pprint(env_var)

out_file = open("my_init.sh", "w") 

out_file.write("source "+answers['viv_hls_dir'] +"/2018.3/settings64.sh\n" )

out_file.write("source init_install.sh " + answers['galapagos_dir'] + ' ' + answers['vitis_dir'] + ' ' + answers['hls_dir'] + ' 2023.1 2023.1 ' + answers['par_name'] + ' ' + answers['boa_name'] +'\n')

out_file.write("make oldhls\n")
out_file.write("make hlsmiddleware\n")

print("Are there other boards present in this project? (Y/N)")

answer = str(input()).strip().lower()

while ((answer == "yes") or (answer == "y")):
  print('What is the other part name you want to use?')
  answers['par_name'] = str(input()).strip().lower()
  print('What is the board name of this part?')
  answers['boa_name'] = str(input()).strip().lower()
  out_file.write("source "+answers['viv_hls_dir'] +"/2018.3/settings64.sh\n" )

  out_file.write("source init_install.sh " + answers['galapagos_dir'] + ' ' + answers['vitis_dir'] + ' ' + answers['hls_dir'] + ' 2023.1 2023.1 ' + answers['par_name'] + ' ' + answers['boa_name'] +'\n')

  out_file.write("make oldhls\n")
  out_file.write("make hlsmiddleware\n")
  print("Are there other boards present in this project? (Y/N)")

  answer = str(input()).strip().lower()
