docker build -t dgolovin2/multi-client - f./client/Dockerfile ./client
docker build -t dgolovin2/multi-server - f./server/Dockerfile ./server
docker build -t dgolovin2/multi-worker - f./worker/Dockerfile ./worker
docker push dgolovin2/multi-client 
docker push dgolovin2/multi-server
docker push dgolovin2/multi-worker
kubectl apply -f k8s
kubectl image deployments/server-deployment server=dgolovin2/multi-server:$SHA
kubectl image deployments/client-deployment server=dgolovin2/multi-client:$SHA
kubectl image deployments/worker-deployment server=dgolovin2/multi-worker:$SHA




