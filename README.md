<p align="center">
    <img src="https://raw.githubusercontent.com/datatorch/documentation/master/docs/.vuepress/public/helm.png" width="200" />
</p>

<h1 align="center">
  DataTorch Helm Charts
</h1>
<h4 align="center">Scale DataTorch on Kubernetes a production-grade container orchestrator.</h4>

## Introduction

DataTorch is a scalable annotation platform build for sharing and creating
datasets.

This chart bootstraps a DataTorch deployment on Kubernetes cluster using Helm v3
package manager.

Note: You must have a license key and the image pull secret for this chart to
work.

## Prerequisites

- Helm 3.0+
- Kubernetes 1.13+ (1.15+ for ssl)

## Installing Chart

1. Add datatorch repo `helm repo add datatorch https://charts.datatorch.io`
1. Use regcred script to create image pull secret
1. Update values.yaml with FQDN's, database connections and license
1. Deploy the instance with helm install (shown below)

To install the chart with release name `my-release`:

```bash
helm install my-release datatorch/datatorch
```

The command deploys DataTorch on kubernetes cluster in the default
configuration.

## Uninstalling Chart

To uninstall/delete the `my-release` deployment:

```bash
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## SSL with NGINX and Cert-manager

Run the following commands to install cert-manager.

1. `sh ssl/install-certmanager.sh`
2. `kubectl apply -f ssl/issuer-prod.yaml`
3. `kubectl apply -f ssl/issuer-staging.yaml`
4. Add annotations and tls to ingress as shown in below.

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

## pgbouncer

For Azure using managed postgres instance add [pgbouncer](https://hub.docker.com/_/microsoft-azure-oss-db-tools-pgbouncer-sidecar) to speed up connection.

The `backend` section has a `extraContainers` and `extraVolumes` section for this.
