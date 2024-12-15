#!/bin/bash

# Set an error flag
set -e

# Deploy API components
echo "Creating namespace for API and deploying API components..."
kubectl apply -f kubernetes/api/Api.Namespace.yml
kubectl apply -f kubernetes/api/Api.ConfigMap.yml
kubectl apply -f kubernetes/api/Api.Deployment.yml
# kubectl apply -f kubernetes/api/Api.Ingress.yml # Uncomment this line if you are using Ingress
kubectl apply -f kubernetes/api/Api.Secret.yml
kubectl apply -f kubernetes/api/Api.Service.yml

# Deploy Postgres
echo "Creating namespace for Mongo and deploying Mongo components..."
kubectl apply -f kubernetes/postgres/Postgres.Namespace.yml
kubectl apply -f kubernetes/postgres/Postgres.Secret.yml
kubectl apply -f kubernetes/postgres/Postgres.HeadlessService.yml
kubectl apply -f kubernetes/postgres/Postgres.Statefulset.yml

# Deploy Redis
echo "Creating namespace for Redis and deploying Redis components..."
kubectl apply -f kubernetes/redis/Redis.Namespace.yml
kubectl apply -f kubernetes/redis/Redis.HeadlessService.yml
kubectl apply -f kubernetes/redis/Redis.Statefulset.yml

echo "All components deployed successfully!"
