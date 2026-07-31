# Intuitive AI Platform

Production-grade platform engineering project for a B2B SaaS + AI application platform.

---

# Overview

This project demonstrates how to design, build, and operate a production-style Kubernetes platform using modern Site Reliability Engineering (SRE) practices.

The platform is deployed locally using **k3s** to simulate production Kubernetes environments such as AWS EKS. All infrastructure and application workloads are managed declaratively using **GitOps principles** with ArgoCD.

The objective is to prove a complete platform stack before moving workloads to the cloud.

The implementation focuses on:

- Kubernetes platform engineering
- GitOps-based deployments
- Application reliability
- Observability
- Operational automation
- Production readiness

---

# Architecture

<img width="1360" height="1280" alt="image" src="https://github.com/user-attachments/assets/e20bf325-5362-45ac-a5a3-4b7608cdaf84" />


## High-Level Flow

```
Developer
  |
  v
GitHub Repository
  |
  v
ArgoCD (GitOps Controller)
  |
  +-----------------------------+
  |                             |
  v                             v
Platform Components      Application Workloads

Ingress Controller nginx
Monitoring Stack sample-api
Logging Stack AI Services (Future)
Tracing Stack
```

---

# Technology Stack

| Category | Technology |
|---|---|
| Kubernetes Platform | k3s |
| GitOps | ArgoCD |
| Deployment Pattern | App of Apps |
| Kubernetes Packaging | Helm / Kustomize |
| Ingress Controller | ingress-nginx |
| Metrics | Prometheus |
| Dashboards | Grafana |
| Logging | Loki |
| Distributed Tracing | Tempo |
| Workflow Engine | Temporal |
| Automation | Bash / Kubernetes Automation |
| AI Operations | AI SRE Agent |

---

# Repository Structure

```
.
├── applications
│   ├── nginx
│   ├── sample-api
│   └── ingress-nginx
│
├── platform
│   ├── monitoring
│   ├── logging
│   └── tracing
│
├── infrastructure
│   └── cluster configuration
│
├── clusters
│   └── environment configurations
│
├── bootstrap
│   └── ArgoCD bootstrap configuration
│
├── scripts
│   └── automation scripts
│
├── tools
│   └── operational utilities
│
└── docs
    └── architecture documentation
```

---

# Kubernetes Platform Implementation

## Cluster

Implemented:

- k3s Kubernetes cluster
- Namespace isolation
- Declarative resource management
- Git-driven deployments

## GitOps Implementation

ArgoCD manages all Kubernetes resources.

Implemented:

- ArgoCD installation
- App of Apps pattern
- Automated synchronization
- Self-healing enabled
- Automated pruning enabled

GitOps workflow:

```
Developer Change
    |
    v
Git Commit
    |
    v
GitHub Repository
    |
    v
ArgoCD Detects Change
    |
    v
Kubernetes Reconciliation
    |
    v
Application Updated
```

---

# Deployed Applications

## nginx Application

Status:

```
Sync Status: Synced
Health Status: Healthy
```

Implemented:

- Kubernetes Deployment
- Service
- Ingress
- Rolling updates
- Resource requests and limits
- Liveness probes
- Readiness probes

## sample-api Application

Status:

```
Sync Status: Synced
Health Status: Healthy
```

Implemented:

- Multiple replicas
- Kubernetes service discovery
- Health checks
- ArgoCD deployment management

---

# Networking

Implemented:

- ingress-nginx controller
- Kubernetes Ingress resources
- Internal service routing
- Host-based routing

Example:

```
nginx.local
    |
    v
Ingress Controller
    |
    v
nginx-service
    |
    v
nginx Pods
```

---

# Observability Platform

## Metrics

Implemented:

- Prometheus
- Kubernetes metrics collection
- Node exporter

## Dashboards

Implemented:

- Grafana
- Kubernetes dashboards
- Application monitoring foundation

## Logging

Planned:

- Loki deployment
- Centralized Kubernetes logs

## Distributed Tracing

Planned:

- Tempo integration
- Application tracing

---

# Current Platform Status

## ArgoCD Applications

| Application | Sync Status | Health Status |
|---|---|---|
| ingress-nginx | Synced | Healthy |
| nginx-app | Synced | Healthy |
| sample-api | Synced | Healthy |
| prometheus-stack | Synced | Healthy |
| root-app | Synced | Healthy |

---

# Reliability Practices Implemented

The platform includes:

## Kubernetes Reliability

- Readiness probes
- Liveness probes
- Resource requests
- Resource limits
- Rolling deployments
- Replica-based availability

## GitOps Reliability

- Automated synchronization
- Drift detection
- Self healing
- Declarative infrastructure

## Operational Practices

- Health validation
- Application status monitoring
- Infrastructure as Code principles
- Reproducible deployments

---

# Production Readiness Roadmap

Future improvements:

## Security

- Kubernetes RBAC hardening
- Network policies
- Pod security standards
- Container image scanning
- Secrets management

## CI/CD

- GitHub Actions pipelines
- Automated testing
- Container image build pipeline
- Security scanning

## Observability

- Loki centralized logging
- Tempo distributed tracing
- AlertManager rules
- SLO dashboards

## Reliability Engineering

- Backup and restore testing
- Disaster recovery procedures
- Failure injection testing
- Capacity planning

## Cloud Migration

Future deployment targets:

- AWS EKS
- Managed Kubernetes services
- Cloud-native networking
- Production-grade storage

---

# Validation Commands

Check ArgoCD applications:

```bash
kubectl get applications -n argocd
```

Check workloads:

```bash
kubectl get pods -A
```

Check deployments:

```bash
kubectl get deployments -A
```

Check ingress:

```bash
kubectl get ingress -A
```

Validate GitOps synchronization:

```bash
git status
git rev-parse HEAD
```
