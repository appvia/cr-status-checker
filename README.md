# Custom Resource Status Checker (CRSC)

At the time of writing this, [Helm](https://helm.sh/) is unable to determine when a custom resource has been created successfully and is ready to be used - [#8439 - Add support for ordering of resources within a chart for Custom Resources](https://github.com/helm/helm/issues/8439).

CRSC is a simple application that leverages:
1. The Kubernetes Job Controller to inform Helm when a [Custom Resource Definition (CRD)](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) object / custom resource is ready
2. The Helm [hook mechanism](https://helm.sh/docs/topics/charts_hooks/) to ensure it is deployed immediately after the custom resource i.e. in the `post-install` phase of the release lifecycle

CRSC requires the following user inputs to be provided as Kubernetes environment variables:
- `CUSTOM_RESOURCE_PATH`- The URL path to the Kubernetes CRD object / custom resource e.g. `https://kubernetes.default.svc/<CUSTOM_RESOURCE_PATH>`
- `STATE_KEY` - The JSON path to the property containing the expected state
- `STATE_VALUE` - The expected state when the Kubernetes CRD object / custom resource is created and ready to use

See the `example/` directory to see how the CRSC has been used with a Kubernetes Service Account to query the Kubernetes API and determine when a [Pulumi Stack](https://www.pulumi.com/docs/intro/concepts/stack/) custom resource has been successfully created.
