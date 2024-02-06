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
  kubectl apply -k .
  ```

  You should see the `opentelemetry-demo`resources get applied to your cluster

## Preview Apps 
Once the installation is complete, you can access and interact with the OpenTelemetry demo resources at the following url on your browser

The following components are installed
- Jaeger

## Cleanup

To uninstall the OpenTelemetry demo, run the following command:
