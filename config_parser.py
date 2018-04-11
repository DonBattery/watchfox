import sys
import json

config = json.loads(sys.stdin.read())  

# Debug mode
if '-d' in sys.argv:
    print('--------------------------------------------- Debug mode')
    print('sysargv :', sys.argv)
    print('config object :', config)
    print('--------------------------------------------- Debug mode')


for arg in sys.argv:
    if arg == '-s':
        for service in config['services']:
            params = service['hostname'].split('/')
            print(
                params[0] +
                ((':' + str(service['port'])) if service['port'] > 0 else "") +
                (service['hostname'].replace(params[0], "", 1) if len(params) > 0 else "")
            )

sys.exit(0)