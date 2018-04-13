import sys
import json

config = json.loads(sys.stdin.read())  

def service_to_filename(service):
    params = service['hostname'].split('/')
    return (params[0] + 
        ((':' + str(service['port'])) if service['port'] > 0 else "") + 
        (service['hostname'].replace(params[0], "", 1) if len(params) > 0 else ""))

# Debug mode
if '-d' in sys.argv:
    print('--------------------------------------------- Debug mode')
    print('sysargv :', sys.argv)
    print('config object :', config)
    print('--------------------------------------------- Debug mode')

if sys.argv[1] == '-s':
    for service in config['services']:
        print(service_to_filename(service))

if sys.argv[1] == '-email':
    print(config['allert']['email'])

if sys.argv[1] == '-a':
    for service in config['services']:
        if sys.argv[2] == service_to_filename(service): 
            email = ('Email ' + ('Y' if service['email'] == 'Yes' else 'N'))
            slack = ('Slack ' + ('Y' if service['slack'] == 'Yes' else 'N'))
            print(email, slack)

sys.exit(0)