include ./env/.credentials.env
export

master: install-docker install-kubectl configure-runtime install-kubeadm
	./init_master.sh

worker: install-docker install-kubectl configure-runtime install-kubeadm
	ENV_KUBE_TOKEN=$(ENV_KUBE_TOKEN) ENV_KUBE_HASH=$(ENV_KUBE_HASH) KUBE_MASTER_ADDR=$(KUBE_MASTER_ADDR) ./init_worker.sh

install-kubeadm: 
	./install_kubeadm.sh

install-kubectl:
	./install_kubectl.sh

configure-runtime: 
	./container_runtime.sh

install-docker:
	./install_docker.sh
