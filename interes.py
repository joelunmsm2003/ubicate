import json
from pprint import pprint

with open('interes.json') as data_file:    
    data = json.load(data_file)

pprint(data)


for d in data['theme']:

	print d['label']


