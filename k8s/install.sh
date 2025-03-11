# Description: Install kubectl on Linux 
# Author: Arthur Cadore M. Barcella

echo "getting the latest stable version of kubectl..."
version=$(curl -L -s https://dl.k8s.io/release/stable.txt)
echo "downloading kubectl version $version..."
curl -LO "https://dl.k8s.io/release/$version/bin/linux/amd64/kubectl"

# validate the checksum
echo "downloading the checksum..."
curl -LO "https://dl.k8s.io/release/$version/bin/linux/amd64/kubectl.sha256"

echo "validating the checksum..."
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

echo "installing kubectl..."
# check if /usr/local/bin exists if not create it
if [ ! -d "/usr/local/bin" ]; then
  echo "'/usr/local/bin' does not exist, creating it..."
  sudo mkdir -p /usr/local/bin
fi

# move kubectl to /usr/local/bin and set the permissions
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl
sudo chown root:root /usr/local/bin/kubectl
sudo chmod 0755 /usr/local/bin/kubectl

# check if kubectl command is working
echo "checking the version of kubectl, and check if it's working..."
if kubectl version --client >/dev/null 2>&1; then
  version_installed=$(kubectl version --client | head -n 1 | awk '{print $3}')
  echo "kubectl $version_installed is installed!"
else
  echo "kubectl is not working, please check the installation..."
fi