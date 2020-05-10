#!/bin/bash

# usage sh k8s-gcp--predeployment-commands.sh 'practiceproject-248407' 'us-central1-a' 'k8s-practice' 'mypgpassword'

PROJECT_ID=$1
ZONE=$2
CLUSTER_NAME=$3
PGPASSWORD=$4

# create cluster
gcloud beta container --project $PROJECT_ID clusters create $CLUSTER_NAME --zone $ZONE --machine-type "n1-standard-1" --disk-size "20"  --num-nodes "3"

# get cluster credentials
gcloud config set project $PROJECT_ID
gcloud config set compute/zone $ZONE
gcloud container clusters get-credentials $CLUSTER_NAME

# create secret key
kubectl create secret generic pgpassword --from-literal PGPASSWORD=$PGPASSWORD

# install helm 
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# install ingress service
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install my-nginx stable/nginx-ingress --set rbac.create=true