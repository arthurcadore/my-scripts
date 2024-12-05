```bash
curl -LO https://dl.k8s.io/release/v1.31.0/bin/linux/amd64/kubectl
```

```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

```bash
kubectl
``` 


```bash
apt-get update && \
apt-get install -y apt-transport-https ca-certificates curl gnupg
```

```bash
# If the folder `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to 9 days,  5:08,  3 users read this keyring
```

```bash
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly
```

```bash
sudo apt-get update && \
sudo apt-get install -y kubectl
```

# Configuration for the Kubernetes cluster Master Node: 
```bash
kubeadm reset
kubeadm init --v=5 --control-plane-endpoint=vm0.pji3.sj.ifsc.edu.br --pod-network-cidr=10.0.0.0/16,fc00::/48 --service-cidr=10.1.0.0/16,fc00:1::/112
``` 

# Configuration for the Kubernetes cluster Worker Nodes: 

```bash


containerd config default > /etc/containerd/config.toml


systemdCgroup = true

 systemctl restart containerd


kubeadm join vm0.pji3.sj.ifsc.edu.br:6443 --token pamif6.wjo6v48gp5fpbxit --discovery-token-ca-cert-hash sha256:9bdaaf33ad9675c5b467acbb031f34c8352f8d7df437a3655e2b48dd34c4d333 