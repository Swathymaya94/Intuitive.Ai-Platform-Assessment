# Observability Platform

## Purpose

This directory contains the GitOps-managed observability components for the Kubernetes platform.

The goal is to provide visibility across the three primary observability signals:

- Metrics
- Logs
- Distributed traces

The target architecture follows the Grafana LGTM model.

## Architecture

The observability architecture is designed around:

- Prometheus for metrics collection and alerting
- Grafana for visualization and operational dashboards
- Loki for centralized application and platform logs
- Tempo for distributed tracing
- OpenTelemetry for application telemetry collection

The intended telemetry flow is:

Application
→ OpenTelemetry / Prometheus instrumentation
→ Prometheus, Loki, and Tempo
→ Grafana

## Metrics

The metrics layer uses the `kube-prometheus-stack`.

It provides:

- Prometheus
- Prometheus Operator
- Alertmanager
- Grafana
- kube-state-metrics
- node-exporter
- Kubernetes monitoring rules

The stack is deployed declaratively through ArgoCD rather than by running Helm manually.

## GitOps

ArgoCD is responsible for deploying and reconciling the observability stack.

The ArgoCD application definition is located at:

`applications/observability/prometheus-stack.yaml`

Automated synchronization is enabled with:

- self-healing
- pruning
- namespace creation

This allows Git to remain the source of truth for platform configuration.

## Reliability

The observability platform will be used to define and measure service reliability.

The sample application will expose service-level indicators including:

- request rate
- error rate
- request latency
- application availability

These metrics will be used to define an SLO and actionable alerting rules.

## Security

Production-oriented controls will include:

- namespace isolation
- resource requests and limits
- least-privilege access
- controlled Grafana credentials
- network policies
- restricted application access to monitoring services

Secrets and credentials must not be committed directly to Git.

## Production Considerations

This assessment runs locally on k3d/k3s, so the observability stack is intentionally sized for a developer workstation.

In a production EKS environment, additional considerations would include:

- highly available Prometheus or Grafana Mimir
- durable object storage
- persistent Grafana storage
- highly available Alertmanager
- long-term metrics retention
- authentication and SSO
- TLS
- backup and disaster recovery
- capacity planning
- production retention policies

## Validation

Platform health can be verified with:

```bash
kubectl get applications -n argocd
kubectl get pods -n monitoring
kubectl get svc -n monitoring
