#!/bin/bash 
set -e
read -p 'Input your DigitalOcean token: ' token
export TF_VAR_token=$token
# running terraform 
terraform init 
terraform apply -auto-approve
$(sleep 10)
touch $(pwd)/do-k8s-cluster-config.yaml
export KUBECONFIG=$(pwd)/do-k8s-cluster-config.yaml
# cluster_name=$(terraform output -raw k8s_name)
doctl kubernetes cluster kubeconfig save $(terraform output -raw k8s_name)
# cat ~/.kube/config > $(pwd)/do-k8s-cluster-config.yaml
# export KUBECONFIG=$(pwd)/do-k8s-cluster-config.yaml
# run the following commands to deploy the microservice demo
kubectl create -f /home/vagrant/third-semester/microservices-demo/deploy/kubernetes/complete-demo.yaml
$(sleep 180)
kubectl get service front-end -n sock-shop