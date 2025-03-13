kubeadm reset

echo "Copying containerd configuration file to /etc/containerd/config.toml..."
cat containerd-config2.toml | sudo tee /etc/containerd/config.toml

KUBE_TOKEN=$(echo $ENV_KUBE_TOKEN)
KUBE_HASH=$(echo $ENV_KUBE_HASH)
KUBE_MASTER_ADDR=$(echo $KUBE_MASTER_ADDR)

echo "KUBE TOKEN: $KUBE_TOKEN"
echo "KUBE HASH: $KUBE_HASH"
echo "KUBE MASTER ADDR: $KUBE_MASTER_ADDR"

echo "trying to join the cluster..."

kubeadm join $KUBE_MASTER_ADDR:6443 --token $KUBE_TOKEN --discovery-token-ca-cert-hash sha256:$KUBE_HASH > init_worker.log 2>&1

echo "Copy kubeconfig to $HOME/.kube/config..."
mkdir -p $HOME/.kube
sudo cp -i ./.kubectl-admin.env $HOME/.kube/config

echo "restart the containerd service..."
sudo systemctl restart containerd

echo "restarting the kubelet service..."
sudo systemctl restart kubelet
