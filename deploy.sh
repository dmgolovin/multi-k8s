docker build -t dmgolovin/multi-client - f./client/Dockerfile ./client
docker build -t dmgolovin/multi-server - f./server/Dockerfile ./server
docker build -t dmgolovin/multi-worker - f./worker/Dockerfile ./worker
docker push dmgolovin/multi-client 
docker push dmgolovin/multi-server
docker push dmgolovin/multi-worker
kubectl apply -f k8s
kubectl image deployments/server-deployment server=dmgolovin/multi-server:$SHA
kubectl image deployments/client-deployment server=dmgolovin/multi-client:$SHA
kubectl image deployments/worker-deployment server=dmgolovin/multi-worker:$SHA




