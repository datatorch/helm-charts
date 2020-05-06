# Helm Charts

DataTorch is a scalable annotation platform build for sharing and creating
datasets.

Note: You must have a license key and the image pull secret for this chart to 
work.

```bash
helm repo add datatorch https://charts.datatorch.io
helm install my-release datatorch/datatorch
```

## Introduction

This chart bootstraps a DataTorch deployment on Kubernetes cluster using Helm v3
package manager.

## Prerequisites

- Helm 3.0+
- Kubernetes 1.12+

## Installing Chart

To install the chart with release name `my-release`:

```bash
helm install my-release datatorch/datatorch
```

The command deploys DataTorch on kubernetes cluster in the default
configuration. The Parameters section lists the parameters that can be
configured during installation.

## Uninstalling Chart

To uninstall/delete the `my-release` deployment:

```bash
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Parameters

## SSL with NGINX and Cert-manager

Run the following commands to install cert-manager.

```bash
# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io
# Update your local Helm chart repository cache
helm repo update
# Install the cert-manager Helm chart
helm install cert-manager --namespace kube-system --version v0.14.2 jetstack/cert-manager
```

Two issuers will be created (when testing used the `letsencrypt-staging`).
Change the fields in each issuer to point to your email address. Once completed,
you can apply the files to your cluster.

```bash
kubectl apply -f ./ssl/issuer-staging.yaml
kubectl apply -f ./ssl/issuer-prod.yaml
```

Add the following annotations to `ingress`

```yaml
ingress:
  host: HOST_DOMAIN
  annotations:
    # ... other annotations
    cert-manager.io/issuer: "letsencrypt-prod"
    cert-manager.io/acme-challenge-type: http01
  tls:
    - secretName: TLS_SECRET_NAME
      hosts:
        - HOST_DOMAIN
```
