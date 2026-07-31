#!/bin/bash

set -e

echo "Creating ArgoCD namespace..."

kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -

echo "Installing ArgoCD..."

kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Waiting for ArgoCD server..."

kubectl rollout status deployment/argocd-server \
  -n argocd \
  --timeout=300s

echo "ArgoCD installation completed."
