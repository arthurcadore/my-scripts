kubeadm reset
kubeadm join 

# get the token by env variable "ENV_KUBE_TOKEN"
KUBE_TOKEN=$(echo $ENV_KUBE_TOKEN)
KUBE_HASH=$(echo $ENV_KUBE_HASH)
KUBE_MASTER_ADDR=$(echo $KUBE_MASTER_ADDR)

echo "KUBE TOKEN: $KUBE_TOKEN"
echo "KUBE HASH: $KUBE_HASH"
echo "KUBE MASTER ADDR: $KUBE_MASTER_ADDR"

echo "trying to join the cluster..."

kubeadm join $KUBE_MASTER_ADDR:6443 --token $KUBE_TOKEN --discovery-token-ca-cert-hash sha256:$KUBE_HASH > init_worker.log 2>&1