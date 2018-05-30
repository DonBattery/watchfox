import sys
import json

config = json.loads(sys.stdin.read())  

def service_to_URL(service):
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

if sys.argv[1] == 'site':
    print(config['site'])

if sys.argv[1] == 'email':
    print(config['allert']['email'])

if sys.argv[1] == 'slack':
    print(config['allert']['slack_channel'])

if sys.argv[1] == 'services':
    for service in config['services']:
        print(service_to_URL(service))

if sys.argv[1] == 'name':
    for service in config['services']:
        if sys.argv[2] == service_to_URL(service): 
            print(service['name'])

if sys.argv[1] == 'allert':
    for service in config['services']:
        if sys.argv[2] == service_to_URL(service): 
            email = ('Email ' + ('Y' if service['email'] == 'Yes' else 'N'))
            slack = ('Slack ' + ('Y' if service['slack'] == 'Yes' else 'N'))
            print(email, slack)

sys.exit(0)