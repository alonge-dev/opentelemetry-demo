# # OpenTelemetry Demo using Kustomize

This directory contains the necessary files and instructions to install the OpenTelemetry demo using Helm charts and Kustomize.


For more information about possible configurations for the values.yml file, see [Open Telemetry Charts docs](https://github.com/open-telemetry/opentelemetry-helm-charts/tree/main/charts/opentelemetry-demo)

## Prerequisites

Before proceeding with the installation, make sure you have the following prerequisites:

- Helm: [Install Helm](https://helm.sh/docs/intro/install/)
- Kustomize: [Install Kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/)

## Installation

To install the OpenTelemetry demo using Helm charts, follow these steps:

1. Clone the repository:

  ```shell
  git clone https://github.com/alonge-dev/opentelemetry-demo.git
  ```

2. Change to the `opentelemetry-demo/kustomize` directory:

  ```shell
  cd opentelemetry-demo/kustomize
  ```

3. Render the Kustomize Resources (Optional):

  ```shell
  kustomize build . --enable-helm > preview.yml
  ```

4. Apply to your cluster:

  ```shell
  kustomize build . --enable-helm | kubectl apply -f -
  ```

  You should see the `opentelemetry-demo`resources get applied to your cluster

## Verify all resources are running
 
```shell
kubectl get pods,svc,deployments,ingress -n otel-demo
```

## Preview Apps 

```shell
kubectl port-forward svc/otel-demo-frontendproxy 30080:8080 --address='0.0.0.0'
```

Once the installation is complete, you can access and interact with the OpenTelemetry demo resources at the following url on your browser

The following components are installed:
- [Web Store](http://localhost:30080/)
- [Jaeger](http://localhost:30080/jaeger/ui)
- [Grafana](http://localhost:30080/grafana)
- [Feature Flag UI](http://localhost:30080/feature)
- [Load Generator](http://localhost:30080/loadgen)
- [OTLP Collector](http://localhost:30080/otlp-http/v1/traces)

## Cleanup

To uninstall the OpenTelemetry demo, run the following command:
```shell
kubectl delete ns otel-demo
```
