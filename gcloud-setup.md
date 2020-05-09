1. create service account and key from ui
2. download the key file to local machine
3. set up the account using the below command
```
export KEY_FILE_PATH=<path for the key file>
export PROJECT_ID='practiceproject-248407'

# activate the service account using key file
$ gcloud auth activate-service-account  --key-file $KEY_FILE_PATH
Activated service account credentials for: [<Account>]

# check the added account in the list 
$ gcloud auth list 

# set the project id
$ gcloud config set project $PROJECT_ID
```

4. create cluster using below command. Update the configuration as needed

```
export PROJECT_ID='practiceproject-248407'
export CLUSTER_NAME='k8s-practice'
export ZONE='us-central1-a'

gcloud beta container --project $PROJECT_ID clusters create $CLUSTER_NAME --zone $ZONE --machine-type "n1-standard-1" --disk-size "20"  --num-nodes "3"
```

5. clean up command
```
gcloud beta container --project $PROJECT_ID clusters delete $CLUSTER_NAME --zone $ZONE
```

6. cretae secret
```
kubectl create secret generic pgpassword --from-literal PGPASSWORD=mypgpassword
```

7. Pre deployment Steps:

```
# create cluster

# open shell and get cluster credentails

# create scret for postgres password

# the below section is invalid for helm v3
<!-- # create service account for tiller to enable RBAC (Role Based Access Control)
# servicce account name is given as tiller that can be any name
$ kubectl create serviceaccount --namespace kube-system tiller
serviceaccount/tiller created

$ kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
clusterrolebinding.rbac.authorization.k8s.io/tiller-cluster-rule created -->

# install helm and initialize
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3

$ chmod 700 get_helm.sh

$ ./get_helm.sh
Error: could not find tiller
Helm v3.2.1 is available. Changing from version .
Downloading https://get.helm.sh/helm-v3.2.1-linux-amd64.tar.gz
Preparing to install helm into /usr/local/bin
helm installed into /usr/local/bin/helm

$ helm repo add stable https://kubernetes-charts.storage.googleapis.com/
"stable" has been added to your repositories

$ helm install my-nginx stable/nginx-ingress --set rbac.create=true

```



#### removed commands from travis
```
   # - docker build -t kiranvits/react-test -f ./client/Dockerfile.dev ./client

# script:
#     - docker run kiranvits/react-test npm run test -- --coverage

```