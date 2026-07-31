# Intuitive AI Platform

Production-grade platform engineering project for a B2B SaaS + AI application platform.

## Overview

This project demonstrates how to design, build, and operate a production-ready Kubernetes platform using GitOps principles.

The platform is built locally using k3s and follows production engineering practices used in cloud environments such as AWS EKS.

## Goals

The main goals of this project are:

- Build a Kubernetes platform managed through GitOps
- Deploy all workloads using ArgoCD
- Implement full observability using metrics, logs, and traces
- Create operational automation using AI-powered incident analysis
- Demonstrate production reliability and security practices

## Architecture

High-level architecture:
<img width="1360" height="1280" alt="image" src="https://github.com/user-attachments/assets/091b8c71-86db-48ba-a81e-603fd935a65b" />


## Technology Stack

| Area | Technology |
|---|---|
| Kubernetes | k3s |
| GitOps | ArgoCD |
| Metrics | Prometheus |
| Dashboards | Grafana |
| Logs | Loki |
| Traces | Tempo |
| Workflow Engine | Temporal |
| AI Operations | AI SRE Agent |

## Repository Structure
.
├── applications
├── platform
├── infrastructure
├── clusters
├── bootstrap
├── scripts
├── tools
└── docs
## Current Status

Project under active development.

## Future Roadmap

Planned improvements:

- Production Kubernetes security hardening
- CI/CD automation
- Secret management
- Policy enforcement
- Cloud deployment support
- Advanced AI operations automation
