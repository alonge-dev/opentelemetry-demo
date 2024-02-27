#! /bin/bash


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

# Install k3d 
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# Verify k3d installation
k3d version

# Create a k3d cluster and expose port 8081
k3d cluster create my-demo-cluster --api-port 6550 -p "30080:80@loadbalancer" --servers 3 --agents 2 

# Verify k3d cluster
kubectl cluster-info