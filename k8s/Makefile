export ENV_KUBE_TOKEN ?= TOKEN_HERE
export ENV_KUBE_HASH ?= HASH_HERE
export KUBE_MASTER_ADDR ?= ADDRESS_HERE

master: install-kubectl configure-runtime install-kubeadm
	./init-master.sh

worker: install-kubectl configure-runtime install-kubeadm
	ENV_KUBE_TOKEN=$(ENV_KUBE_TOKEN) ENV_KUBE_HASH=$(ENV_KUBE_HASH) KUBE_MASTER_ADDR=$(KUBE_MASTER_ADDR) ./init-worker.sh

install-kubeadm: 
	./install-kubeadm.sh

install-kubectl:
	./install-kubectl.sh

configure-runtime: 
	./container-runtime.sh
