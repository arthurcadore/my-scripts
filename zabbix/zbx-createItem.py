# Install zabbix-api using "pip install zabbix-api" first. 

from zabbix_api import ZabbixAPI

zabbix_url = 'http://10.0.0.1:8080/api_jsonrpc.php'
zabbix_user = 'Admin'
zabbix_password = 'zbxpasswd'
network_prefix = '10.100.1.'  # Prefixo do seu range de IP

zapi = ZabbixAPI(server=zabbix_url)
zapi.login(zabbix_user, zabbix_password)

# Obter o ID do template
template_name = 'ICMP Ping'
template_id = zapi.template.get({
    'filter': {'host': template_name}
})[0]['templateid']

# Obter o ID do grupo
group_name = '10.100.1.0/24 - ICMPping'
group_id = zapi.hostgroup.get({
    'filter': {'name': group_name}
})[0]['groupid']

for i in range(1, 255):
    ip = f'{network_prefix}{i}'
    hostname = f'Host_{i}'
    host = zapi.host.create({
        'host': hostname,
        'interfaces': [{
            'type': 1,
            'main': 1,
            'useip': 1,
            'ip': ip,
            'dns': '',
            'port': '10050'
        }],
        'groups': [{'groupid': group_id}],
        'templates': [{'templateid': template_id}]
    })
    print(f'Host {hostname} com IP {ip} criado com sucesso!')

