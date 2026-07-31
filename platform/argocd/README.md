# ArgoCD Platform Configuration

## Purpose

ArgoCD provides the GitOps continuous delivery layer for this Kubernetes platform.

Git is treated as the source of truth for application and platform configuration. ArgoCD continuously compares the desired state stored in Git with the actual state running in Kubernetes.

## GitOps Model

The platform follows an App-of-Apps pattern.

The root ArgoCD application is located at:

`applications/root/application.yaml`

It monitors the `applications/` directory and creates child ArgoCD applications.

Current application flow:

GitHub Repository
→ Root ArgoCD Application
→ Child Applications
→ Kubernetes Resources

This allows new platform services to be introduced by adding declarative application manifests to Git.

## Repository Structure

Application definitions are stored under:

`applications/`

Platform-specific configuration is stored under:

`platform/`

Cluster-specific configuration is stored under:

`clusters/`

Bootstrap scripts are stored under:

`bootstrap/`

This separates initial cluster bootstrapping from resources managed continuously through GitOps.

## Automated Reconciliation

ArgoCD automated synchronization is configured with:

- `prune: true`
- `selfHeal: true`

Self-healing allows ArgoCD to correct configuration drift when Kubernetes resources are manually changed.

Pruning removes resources that have been removed from the desired Git state.

## Bootstrap Process

ArgoCD itself is initially installed using:

`bootstrap/argocd/install.sh`

After ArgoCD is available, application and platform resources should be managed declaratively through Git wherever possible.

This creates a clear boundary between:

1. Bootstrap infrastructure
2. GitOps-managed infrastructure

## Security Considerations

A production ArgoCD deployment should include:

- RBAC with least-privilege access
- SSO/OIDC integration
- TLS
- restricted administrative access
- protected repository credentials
- audit logging
- Kubernetes NetworkPolicies
- secure secret management

Credentials and sensitive values must not be stored directly in Git.

## Reliability

ArgoCD improves operational reliability by continuously reconciling deployed infrastructure against version-controlled configuration.

Git history also provides an auditable record of platform changes and enables controlled rollback.

## Production Considerations

The assessment uses a local k3d/k3s environment.

For production EKS, additional considerations would include:

- highly available ArgoCD components
- external authentication
- repository credential management
- backup and recovery
- ArgoCD Projects for environment isolation
- stronger RBAC
- notifications and alerting
- controlled promotion between environments

## Validation

Check ArgoCD applications:

```bash
kubectl get applications -n argocd
