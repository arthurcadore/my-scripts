
apt-get update 
apt-get upgrade 

egrep -c '(vmx|svm)' /proc/cpuinfo 

##check if the value is equal to "0", means that is compatible. 

sudo apt install qemu-kvm libvirt-daemon-system virtinst libvirt-clients bridge-utils

sudo apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager

sudo systemctl enable --now libvirtd
sudo systemctl enable --now virtlogd

echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs

sudo modprobe kvm