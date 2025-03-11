
echo "resetting the kubeadm..."
kubeadm reset


echo "Initializing the kubeadm..."

# create a new cluster, and redirect all the logs to the file init_master.log
kubeadm init --v=5 --control-plane-endpoint=vm0.k8s.sj.ifsc.edu.br --pod-network-cidr=10.0.0.0/16 --service-cidr=10.1.0.0/16  > init_master.log 2>&1