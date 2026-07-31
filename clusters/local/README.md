# Local Kubernetes Cluster

## Purpose

This directory represents configuration specific to the local Kubernetes environment used for the assessment.

The platform runs on k3s using k3d, which provides lightweight Kubernetes clusters inside Docker.

## Cluster Topology

The local cluster is named:

`platform-local`

Current topology:

- 1 Kubernetes server/control-plane node
- 2 Kubernetes agent/worker nodes

This topology provides a multi-node development environment while remaining lightweight enough to run locally.

## Cluster Creation

The cluster is created using:

`bootstrap/k3s/create-cluster.sh`

The script uses k3d to provision the Kubernetes environment.

## Why k3d/k3s?

k3d was selected because it provides:

- fast local Kubernetes provisioning
- low resource consumption
- repeatable cluster creation
- multi-node Kubernetes support
- good compatibility with standard Kubernetes tooling

The goal is not to reproduce every EKS feature locally, but to demonstrate platform patterns that can be transferred to a managed production Kubernetes environment.

## Environment Responsibilities

This local environment is used to validate:

- Kubernetes workloads
- ArgoCD GitOps reconciliation
- observability
- Temporal workflows
- application deployment
- service reliability patterns
- failure simulations
- automated remediation workflows

## Production Mapping

The local environment intentionally separates Kubernetes platform patterns from AWS-specific implementation details.

A production EKS environment would additionally use services such as:

- managed EKS control plane
- managed node groups or Karpenter
- AWS Load Balancer Controller
- EBS/EFS CSI drivers
- IAM Roles for Service Accounts or EKS Pod Identity
- AWS Secrets Manager
- AWS KMS
- private networking
- production ingress and DNS
- multiple Availability Zones

## Limitations

The local environment does not provide the same infrastructure resilience as a production multi-AZ EKS deployment.

Local Docker resources, networking, storage, and compute capacity are also more constrained.

These limitations are accepted because the assessment focuses on demonstrating architecture, automation, GitOps, observability, reliability, and operational practices.

## Validation

Verify the cluster:

```bash
kubectl get nodes
