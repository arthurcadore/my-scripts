master: install-kubectl configure-runtime install-kubeadm
	./init-master.sh

worker: install-kubectl configure-runtime install-kubeadm
	./init-worker.sh

install-kubeadm: 
	./install-kubeadm.sh

install-kubectl:
	./install-kubectl.sh

configure-runtime: 
	./container-runtime.sh