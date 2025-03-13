
echo "resetting the kubeadm..."
kubeadm reset


echo "Initializing the kubeadm..."

# create a new cluster, and redirect all the logs to the file init_master.log
kubeadm init --v=5 --control-plane-endpoint=vm0.k8s.sj.ifsc.edu.br --pod-network-cidr=10.0.0.0/16 --service-cidr=10.1.0.0/16  > init_master.log 2>&1


echo "Copying containerd configuration file to /etc/containerd/config.toml..."
cat containerd-config2.toml | sudo tee /etc/containerd/config.toml


echo "Copying kubeconfig to $HOME/.kube/config..."
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

echo "restart the containerd service..."
sudo systemctl restart containerd

echo "restarting the kubelet service..."
sudo systemctl restart kubelet

echo "installing the kubeflannel-mod file..."
kubectl apply -f ./kubeflannel-mod.yaml