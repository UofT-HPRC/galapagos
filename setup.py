from __future__ import print_function, unicode_literals
from pyfiglet import Figlet

import subprocess
import argparse
import os
import regex

from PyInquirer import style_from_dict, Token, prompt, Validator, ValidationError
from pprint import pprint

style = style_from_dict({
        Token.QuestionMark: '#E91E63 bold',
        Token.Selected: '#673AB7 bold',
        Token.Instruction: '',  # default
        Token.Answer: '#2196f3 bold',
        Token.Question: '',
        })



class directoryValidator(Validator):
  def validate(self, document):
        if not document.text=='':
            if not os.path.isdir("/home/el"):
                raise ValidationError(
                        message='Please enter valid directory for galapagos path',
                        cursor_position=len(document.text)
                        )



f = Figlet(font='slant')
print(f.renderText('Welcome to Galapagos Setup'))

parser = argparse.ArgumentParser(description='Galapagos Menu')
parser.add_argument("-d", "--dir", help="absolute path where galapagos directory is located", default='')
parser.add_argument("-vd", "--viv_dir", help="absolute path of vivado", default='')
parser.add_argument("-hd", "--hls_dir", help="absolute path of vivado_hls", default='')
parser.add_argument("-vv", "--viv_ver", help="version of vivado", default='')
parser.add_argument("-hv", "--hls_ver", help="version of vivado_hls", default='')


args = parser.parse_args()

questions = []

path_q = {
          'type': 'input',
          'name': 'galapagos_dir',
          'message': 'What is the absolute path where the galapagos directory is located? (default=$PWD)',
          'validate': directoryValidator
          }

viv_path_q = {
          'type': 'input',
          'name': 'vivado_dir',
          'message': 'What is the directory vivado is located? (default=/opt/Xilinx/Vivado)',
          'validate': directoryValidator
          }

hls_path_q = {
          'type': 'input',
          'name': 'hls_dir',
          'message': 'What is the directory vivado_hls is located? (default=/opt/Xilinx/Vivado)',
          'validate': directoryValidator
          }

viv_ver_q = {
          'type': 'list',
          'name': 'vivado_ver',
          'message': 'What is the vivado version you want to use?',
          'choices': ['2018.1', '2018.2', '2018.3', '2019.2'],
          'filter': lambda val: val.lower()
          }

hls_ver_q = {
          'type': 'list',
          'name': 'hls_ver',
          'message': 'What is the vivado_hls version you want to use?',
          'choices': ['2018.1', '2018.2', '2018.3', '2019.2'],
          'filter': lambda val: val.lower()
          }



if(args.dir ==''):
    questions.append(path_q)
    galapagos_dir = ''
else:
    galapagos_dir = args.dir

if(args.viv_dir == ''):
    questions.append(viv_path_q)
    vivado_dir = ''
else:
    vivado_dir = args.viv_dir

if(args.hls_dir == ''):
    questions.append(hls_path_q)
    hls_dir = ''
else:
    hls_dir = args.hls_dir

if(args.viv_ver == ''):
    questions.append(viv_ver_q)
    vivado_ver = ''
else:
    vivado_ver = args.viv_ver

if(args.viv_ver == ''):
    questions.append(viv_ver_q)
    hls_ver = ''
else:
    hls_ver = args.viv_ver

answers = prompt(questions, style=style)

if galapagos_dir == '':
    galapagos_dir=os.getcwd()

if vivado_dir == '':
    vivado_dir = '/opt/Xilinx/Vivado'

if hls_dir == '':
    hls_dir = '/opt/Xilinx/Vivado'


if vivado_ver == '':
    vivado_ver = '2018.1'

if hls_ver == '':
    hls_ver = '2018.1'


print('ENVIRONMENT VARIABLES SET:')
env_var = {'GALAPAGOS_PATH': galapagos_dir,
           'GALAPAGOS_VIVADO_PATH' : vivado_dir,
           'GALAPAGOS_HLS_PATH' : hls_dir,
           'GALAPAGOS_VIVADO_VERSION' : vivado_ver,
           'GALAPAGOS_HLS_VERSION' : hls_ver
        }

pprint(env_var)

out_file = open("my_init.sh", "w") 

out_file.write("source init.sh " + galapagos_dir + ' ' + vivado_dir + ' ' + hls_dir + ' ' + vivado_ver + ' ' + hls_ver)



