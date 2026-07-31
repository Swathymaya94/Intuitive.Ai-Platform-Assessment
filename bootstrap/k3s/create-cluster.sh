#!/bin/bash

set -e

CLUSTER_NAME="platform-local"

echo "Creating k3d Kubernetes cluster..."

k3d cluster create ${CLUSTER_NAME} \
  --servers 1 \
  --agents 2 \
  --port "8080:80@loadbalancer"

echo "Waiting for Kubernetes nodes..."

kubectl wait \
  --for=condition=Ready nodes \
  --all \
  --timeout=120s

echo "Cluster is ready"

kubectl get nodes