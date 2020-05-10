docker build -t kiranvits/multi-client:latest -t kiranvits/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kiranvits/multi-server:latest -t kiranvits/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kiranvits/multi-worker:latest -t kiranvits/multi-worker:$SHA -f ./worker/Dockerfile ./worker
# push latest images
docker push kiranvits/multi-client:latest
docker push kiranvits/multi-server:latest
docker push kiranvits/multi-worker:latest
# push release images
docker push kiranvits/multi-client:$SHA
docker push kiranvits/multi-server:$SHA
docker push kiranvits/multi-worker:$SHA
# apply all configurations
kubectl apply -f k8s
# update image for a deployment if required
kubectl set image deployment/client-deployment client=kiranvits/multi-client:latest
