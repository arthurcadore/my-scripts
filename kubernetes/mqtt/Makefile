all: build view

build: 
	kubectl apply -f configMap.yaml -n producao
	kubectl apply -f Service.yaml -n producao
	# kubectl apply -f Ingress.yaml -n producao
	kubectl apply -f Deployment.yaml -n producao

view: 
	kubectl get configmap -n producao
	kubectl get svc -n producao
	# kubectl get ingress -n producao
	kubectl get deployment -n producao

logs: 
	kubectl logs deployment/mosquitto -n producao

remove: 
	kubectl delete -f Deployment.yaml -n producao
	# kubectl delete -f Ingress.yaml -n producao
	kubectl delete -f Service.yaml -n producao
	kubectl delete -f configMap.yaml -n producao