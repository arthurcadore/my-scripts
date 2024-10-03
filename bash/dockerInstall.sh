echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/dhcp-appliance
cd dhcp-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/pxe-appliance
cd pxe-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/ldap-appliance
cd ldap-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/smtp-appliance
cd smtp-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/speedtest-appliance
cd speedtest-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/syslog-appliance
cd syslog-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/zbx-grafana-appliance
cd zbx-grafana-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/asterisk-appliance
cd asterisk-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/netdump-appliance
cd netdump-appliance/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/transfer-appliances
cd transfer-appliances/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/capacita-radius
cd capacita-radius/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/ansible-comware
cd ansible-comware/
docker compose build
cd ../ 
echo "Executing Docker compilation..."
git clone https://github.com/arthurcadore/capacita-tacacs
cd capacita-tacacs/
docker compose build
cd ../ 

git clone https://github.com/arthurcadore/capacita-captures
git clone https://github.com/arthurcadore/monitoring-templates
