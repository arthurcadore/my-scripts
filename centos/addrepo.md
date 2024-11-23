
```shell
vim /etc/yum.repos.d/CentOS-Base.repo
```

```
[base]
name=CentOS-7 - Base
baseurl=http://vault.centos.org/7.9.2009/os/$basearch/
gpgcheck=1
gpgkey=http://vault.centos.org/7.9.2009/RPM-GPG-KEY-CentOS-7
enabled=1

[updates]
name=CentOS-7 - Updates
baseurl=http://vault.centos.org/7.9.2009/updates/$basearch/
gpgcheck=1
gpgkey=http://vault.centos.org/7.9.2009/RPM-GPG-KEY-CentOS-7
enabled=1

[extras]
name=CentOS-7 - Extras
baseurl=http://vault.centos.org/7.9.2009/extras/$basearch/
gpgcheck=1
gpgkey=http://vault.centos.org/7.9.2009/RPM-GPG-KEY-CentOS-7
enabled=1
```

```shell
yum clean all
yum makecache
```

```shell
yum install iperf3 --disablerepo=H3Linux_repo
``