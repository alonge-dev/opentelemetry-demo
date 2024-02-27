#! /bin/bash

# This script is used to install kustomize and helm on a killer coda playground

# Install kustomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

# Move kustomize to /usr/local/bin
sudo mv kustomize /usr/local/bin

# Verify kustomize installation
kustomize version

# Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3

# Make get_helm.sh executable
chmod 700 get_helm.sh

# Run get_helm.sh
./get_helm.sh

# Verify helm installation
helm version

# Verify k3d cluster
kubectl cluster-info