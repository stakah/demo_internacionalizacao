import json
import argparse
import sys

assert sys.version_info >= (3, 1), 'Voce deve executar este script com python 3.x'

parser = argparse.ArgumentParser(description='''Gera/atualiza arquivo .arb a partir de outro arquivo .arb.\n
Por exemplo: para gerar o arquivo intl_pt_BR.arb a partir do arquivo intl_message.arb\n
  utilize o comando: python update_intl.py --in lib/l10n/intl_messages.arb --out lib/l10n/intl_pt_BR.arb\n
  Se o arquivo intl_pt_BR.arb nao existir, ele sera criado. Se ja existir, apenas as novas chaves\n
  do arquivo intl_messages.arb serao adicionadas, mantendo as traducoes ja existentes.''')
parser.add_argument('--in', dest='in_file', action='store', required=True,
                    help='o arquivo de entrada. exemplo: intl_message.arb')
parser.add_argument('--out', dest='out_file', action='store', required=True,
                    help='o arquivo de destino. exemplo: intl_pt_BR.arb')

args = parser.parse_args()
in_file = args.in_file
out_file = args.out_file

print('update_intl.py\n   --in {}\n  --out {}'.format(in_file, out_file))

if in_file is None or out_file is None:
    parser.print_help()
    exit()

# read file
with open(in_file, 'r') as messages_file:
    data=messages_file.read()
with open(out_file, 'r') as ptbr_file:
    data_ptbr=ptbr_file.read()

# parse file
messages = json.loads(data)
messages_ptbr = json.loads(data_ptbr)

add_lines = {}

# print(dir(add_lines))

new_lines = 0
for k, v in messages.items():
    try:
        m2 = messages_ptbr[k]
        # print("Keep line: " + str(k) + ":" + str(messages_ptbr[k]))
        add_lines[k] = m2
    except KeyError as e:
        # Adionar essa chave
        # print("Add line: " + str(k) + ':' + str(messages[k]))
        new_lines += 1
        add_lines[k] = messages[k]


# show values
if new_lines == 1:
    print(str(new_lines) + " line added to {}".format(out_file,))
else:
    print(str(new_lines) + " lines added to {}".format(out_file,))

# test_file = 'lib/l10n/test.arb'
with open(out_file, 'w') as fp:
    json.dump(add_lines, fp, indent=2, ensure_ascii=False)

