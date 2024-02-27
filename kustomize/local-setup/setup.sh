#! /bin/bash

# This script is used to install Docker, kustomize, helm, k3d, and kubectl on a local machine
# It also creates a k3d cluster and exposes port 30080 on your local machine.
# Learn more about k3d: https://k3d.io/v5.6.0/

# Check if Docker is installed
docker --version
if [ $? -ne 0 ]; then
    echo "Docker not found. Installing Docker..."
    # Update the apt package index and install packages to allow apt to use a repository over HTTPS
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

    # Add Docker’s official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Set up the stable repository
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # Update the apt package index again
    sudo apt-get update

    # Install the latest version of Docker CE
    sudo apt-get install -y docker-ce

    echo "Docker has been installed."
else
    echo "Docker is already installed."
fi

# Install kubectl
kubectl --version
if [ $? -ne 0 ]; then
    echo "kubectl not found. Installing kubectl..."
    # Download the latest release with the command
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

    # Make the kubectl binary executable
    chmod +x ./kubectl

    # Move the binary in to your PATH
    sudo mv ./kubectl /usr/local/bin/kubectl

    echo "kubectl has been installed."
else
    echo "kubectl is already installed."
fi

# Install kustomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash

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
