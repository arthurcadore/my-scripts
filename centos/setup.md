# Centos 7 setup

# set hostname

```bash
hostnamectl set-hostname node1
reboot now
cat /etc/hosts
```

# Enabling the IPv6 Stack protocol

```bash
echo "net.ipv6.conf.all.disable_ipv6=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=0" >> /etc/sysctl.conf
sysctl -p
```

# Configuring the network interface

## Displaying the network interfaces

```bash
ip link show
```

## Configuring the network interface

- Archive: /etc/sysconfig/network-scripts/<interface_name> 

- Example (for interface ens18): /etc/sysconfig/network-scripts/ifcfg-ens18

```bash
TYPE=Ethernet
BOOTPROTO=static
ONBOOT=yes
NAME=ens18
DEVICE=ens18
IPADDR=10.100.73.25
NETMASK=255.255.255.0
GATEWAY=10.100.73.2
DNS1=8.8.8.8
DNS2=8.8.4.4
```

## Restarting the network service

```bash
systemctl restart NetworkManager
nmcli connection reload
nmcli connection up ens18
```

# Configuring the ntp service to use "200.160.7.186" as the time server and UTC +3 as the timezone

```bash
yum install ntp -y
systemctl enable ntpd
systemctl start ntpd
timedatectl set-timezone America/Sao_Paulo
timedatectl set-ntp yes
```

# checking system time and date

```bash
timedatectl
```

---
# Installing Matrix: 

## Disabling the firewall 

```bash
systemctl status firewalld
systemctl stop firewalld && systemctl disable firewalld
systemctl status firewalld
```

## Editing the sudoers file

- In this example the user "cadore" will be allowed. 

```bash
## Allow root to run any commands anywhere
echo "root ALL=(ALL) ALL" >> /etc/sudoers
echo "cadore ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "cadore ALL=(root) NOPASSWD:/bin/bash" >> /etc/sudoers

## Allows members of the 'sys' group to run networking, software,
## service management apps and more.
# echo"%sys ALL = NETWORKING, SOFTWARE, SERVICES, STORAGE, DELEGATING, PROCESSES, LOCATE, DRIVERS" >> /etc/sudoers

## Allows people in group wheel to run all commands
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
echo "cadore ALL=(root) NOPASSWD:/bin/bash" >> /etc/sudoers
echo "cadore ALL=(root) NOPASSWD:/usr/bin/rpm,/bin/sh" >> /etc/sudoers
```

```bash
vim /etc/pam.d/login
```

```bash
auth    [user_unknown=ignore success=ok ignore=ignore auth_err=die default=bad] pam_securetty.so
```

```bash
#%PAM-1.0
auth       substack     system-auth
auth 	   [user_unknown=ignore success=ok ignore=ignore auth_err=die default=bad] pam_securetty.so
auth       include      postlogin
account    required     pam_nologin.so
account    include      system-auth
password   include      system-auth
# pam_selinux.so close should be the first session rule
session    required     pam_selinux.so close
session    required     pam_loginuid.so
# pam_selinux.so open should only be followed by sessions to be executed in the user context
session    required     pam_selinux.so open
session    required     pam_namespace.so
session    optional     pam_keyinit.so force revoke
session    include      system-auth
session    include      postlogin
-session   optional     pam_ck_connector.so
```

## Disabling SSH access for the root user

```bash
vim /etc/ssh/sshd_config
```

```bash
Port 2222
PermitRootLogin yes
```

```bash
systemctl restart sshd
```

## Transfering the platforms file: 

```bash
scp -P2222 infraremp@10.100.73.8:/home/infraremp/AD-CAMPUS/plat.zip /root/plat.zip
```

## Installing the unzip package

```bash
unzip /root/plat.zip
cd /root/plat/UDTP
unzip UDTP_Matrix_V900R001B07D015_x86_64.zip
cd Matrix-V900R001B07D015-x86_64/
./install.sh
```

## Verifying the installation

```bash
systemctl status matrix
```

## Configuration file: 

```bash
cat /opt/matrix/config/navigator_config.json
```
Example: 

```json
{ 
"productName": "hp", 
"pageList": ["SYS_CONFIG", "DEPLOY", "APP_DEPLOY"], 
"defaultPackages": ["UDTP_Middle_E0715_x86.zip", "UDTP_GlusterFS_E0715_x86.zip", "UDTP_Core_E0715_x86.zip"],
"url": "http://${vip}:30000/central/index.html#/ucenter-deploy",
"theme":"darkblue",
"matrixLeaderLeaseDuration": 30,
"matrixLeaderRetryPeriod": 2,
"sshPort": 22,
"sshLoginMode": "passwd",
"features":{"stopNtpServerBeyondThreshold":"false"}
}
```

## Adding preferences to the configuration file

```bash
vim /opt/matrix/config/navigator_config.json
```

```json
{
"defaultLanguage":"en",
"productName": "hp", 
"pageList": ["SYS_CONFIG", "DEPLOY", "APP_DEPLOY"], 
"defaultPackages": ["UDTP_Middle_E0715_x86.zip", "UDTP_GlusterFS_E0715_x86.zip", "UDTP_Core_E0715_x86.zip"],
"url": "http://${vip}:30000/central/index.html#/ucenter-deploy",
"theme":"darkblue",
"matrixLeaderLeaseDuration": 30,
"matrixLeaderRetryPeriod": 2,
"sshPort": 2222,
"sshLoginMode": "secret",
"features":{"stopNtpServerBeyondThreshold":"false"}
}
```

## Restarting the Matrix service

```bash
systemctl restart matrix
```

--- 
# Creating SSH keys

```bash
ssh-keygen -t ed25519
```

## Copying the public key to the remote server

```bash
ssh-copy-id -p 2222 -i ~/.ssh/id_ed25519.pub root@10.100.73.26
ssh-copy-id -p 2222 -i ~/.ssh/id_ed25519.pub root@10.100.73.27
```

## to test it: 
    
```bash
 ssh -p 22 root@10.100.73.26
```


# Installing the Unified Platform

```bash
sudo bash /opt/matrix/tools/env_check.sh -h
sudo bash /opt/matrix/tools/env_check.sh
```

# Parameters of configuration: 

```bash
Northbound IP: 192.168.0.100
Service Pool IP: 10.96.0.0/16
Container Pool: 177.177.0.0/16
VIP Mode: External
Cluster Network Mode: Single Subnet
NTP Server: Inner
```

For each node: 

```bash
IP: 10.100.73.25
IP: 10.100.73.26
IP: 10.100.73.27
usuário: cadore
senha: <senha>
```