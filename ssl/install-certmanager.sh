# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io
# Update your local Helm chart repository cache
helm repo update
# Install the cert-manager Helm chart
# helm install cert-manager --namespace kube-system --version v0.15.0 jetstack/cert-manager
helm install cert-manager jetstack/cert-manager --namespace kube-system --version v0.15.0 --set installCRDs=true