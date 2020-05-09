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

gcloud beta container --project $PROJECT_ID clusters create $CLUSTER_NAME --zone "us-central1-a" --machine-type "n1-standard-1" --disk-size "20"  --num-nodes "3"
```

5. clean up command
```
gcloud beta container --project $PROJECT_ID clusters delete $CLUSTER_NAME --zone "us-central1-a"
```

