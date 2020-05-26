import sys
from ruamel.yaml import YAML

# RECENT_BUILD = 'https://dev.azure.com/datatorchio/datatorch/_apis/build/builds?api-version=5.0&$top=20&statusFilter=completed'
PATH = './datatorch/values.yaml'

if len(sys.argv) != 3:
    sys.exit('container and tag is required.')

container = sys.argv[1]
tag = sys.argv[2]

yaml = YAML()
yaml.preserve_quotes = True

with open(PATH) as fp:
    data = yaml.load(fp)

data[container]['tag'] = tag

with open(PATH, 'w') as fp:
    yaml.dump(data, fp)

print(f'Done writing to {PATH} {container}.tag = {tag}')
