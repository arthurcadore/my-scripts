all: build view

build: 
	kubectl apply -f ingressController.yaml
	kubectl apply -f ns.yaml
	make -C mqtt
view:
	kubectl get ns
	kubectl get svc -n ingress-nginx

view-all:
	kubectl get all --all-namespaces