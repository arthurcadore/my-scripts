#!/bin/bash
# Description: Install kubeadm, kubelet and kubectl (by package manager) on Linux
# Author: Arthur Cadore M. Barcella

# Dependencies:
#   netcat-openbsd 1.219-1 or above

KUBE_VERSION="v1.32"

echo "verify the UUID of the node..."
NODE_UUID=$(sudo cat /sys/class/dmi/id/product_uuid)
echo "node UUID: $NODE_UUID"

echo "checking if the 2379/TCP is open..."
while nc -z localhost 2379	; do
  echo "Port 2379/TCP that is used for 'etcd server client API'. Exiting script..."
  exit 1
done

echo "checking if the 2380/TCP is open..."
while nc -z localhost 2380	; do
  echo "Port 2380/TCP that is used for 'etcd server client API.' Exiting script..."
  exit 1
done

echo "checking if the 6443/TCP is open..."
while nc -z localhost 6443; do
  echo "Port 6443/TCP that is used for 'Kubernetes API server' is in use. Exiting script..."
  exit 1
done

echo "checking if the 10250/TCP is open..."
while nc -z localhost 10250	; do
  echo "Port 10250/TCP that is used for 'Kubelet API' is in use. Exiting script..."
  exit 1
done

echo "checking if the 10256/TCP is open..."
while nc -z localhost 10256	; do
  echo "Port 10256/TCP that is used for 'kube-proxy' is in use. Exiting script..."
  exit 1
done

echo "checking if the 10257/TCP is open..."
while nc -z localhost 10257	; do
  echo "Port 10257/TCP that is used for 'kube-controller-manager' is in use. Exiting script..."
  exit 1
done

echo "checking if the 10259/TCP is open..."
while nc -z localhost 10259	; do
  echo "Port 10259/TCP that is used for 'kube-scheduler' is in use. Exiting script..."
  exit 1
done

sudo apt-get update

# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

echo "installing kubeadm..."
if [ ! -d "/etc/apt/keyrings" ]; then
  echo "'/etc/apt/keyrings' does not exist, creating it..."
  sudo mkdir -p -m 755 /etc/apt/keyrings
fi

curl -fsSL "https://pkgs.k8s.io/core:/stable:/$KUBE_VERSION/deb/Release.key" | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/$KUBE_VERSION/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

sudo systemctl enable --now kubelet

# check if kubectl command is working
echo "checking the version of kubectl, and check if it's working..."
if kubectl version --client >/dev/null 2>&1; then
  version_installed=$(kubectl version --client | head -n 1 | awk '{print $3}')
  echo "kubectl $version_installed is installed!"
else
  echo "kubectl is not working, please check the installation..."
fi

echo "checking the version of kubeadm, and check if it's working..."
if kubeadm version >/dev/null 2>&1; then
  version_installed=$(kubeadm version)
  echo "kubeadm $version_installed is installed!"
else
  echo "kubeadm is not working, please check the installation..."
fi

echo "checking the version of kubelet, and check if it's working..."
if kubelet --version >/dev/null 2>&1; then
  version_installed=$(kubelet --version | head -n 1 | awk '{print $2}')
  echo "kubelet $version_installed is installed!"
else
  echo "kubelet is not working, please check the installation..."
fi