# Render manifests and apply to cluster 
kustomize build . --enable-helm | kubectl apply -f -

# Verify all resources are running
kubectl get pods,svc,deployments,ingress

# # Port-forward the frontendproxy to test  (Optional)
# kubectl port-forward svc/otel-demo-frontendproxy 30080:8080

# Test Ingress
Open your browser to http://localhost:30080


# Cleanup 
k3d cluster delete my-demo-cluster