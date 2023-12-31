// Module included in the following assemblies:
//
// * service_mesh/v1x/ossm-custom-resources.adoc

:_mod-docs-content-type: PROCEDURE
[id="ossm-jaeger-config-elasticsearch-v1x_{context}"]
= Configuring Elasticsearch

The default Jaeger deployment strategy uses the `all-in-one` template so that the installation can be completed using minimal resources.  However, because the `all-in-one` template uses in-memory storage, it is only recommended for development, demo, or testing purposes and should NOT be used for production environments.

If you are deploying {SMProductShortName} and Jaeger in a production environment you must change the template to the `production-elasticsearch` template, which uses Elasticsearch for Jaeger's storage needs.

Elasticsearch is a memory intensive application. The initial set of nodes specified in the default {product-title} installation may not be large enough to support the Elasticsearch cluster.  You should modify the default Elasticsearch configuration to match your use case and the resources you have requested for your {product-title} installation. You can adjust both the CPU and memory limits for each component by modifying the resources block with valid CPU and memory values. Additional nodes must be added to the  cluster if you want to run with the recommended amount (or more) of memory. Ensure that you do not exceed the resources requested for your {product-title} installation.

.Default "production" Jaeger parameters with Elasticsearch
[source,yaml]
----
apiVersion: maistra.io/v1
kind: ServiceMeshControlPlane
spec:
  istio:
    tracing:
    enabled: true
    ingress:
      enabled: true
    jaeger:
      template: production-elasticsearch
      elasticsearch:
        nodeCount: 3
        redundancyPolicy:
        resources:
          requests:
            cpu: "1"
            memory: "16Gi"
          limits:
            cpu: "1"
            memory: "16Gi"
----

.Elasticsearch parameters
[options="header"]
[cols="l, a, a, a, a"]
|===
|Parameter |Description |Values |Default Value |Examples

|tracing:
  enabled:
|This parameter enables/disables tracing in {SMProductShortName}. Jaeger is installed by default.
|`true`/`false`
|`true`
|

|ingress:
  enabled:
|This parameter enables/disables ingress for Jaeger.
|`true`/`false`
|`true`
|

|jaeger:
   template:
|This parameter specifies which Jaeger deployment strategy to use.
|`all-in-one`/`production-elasticsearch`
|`all-in-one`
|

|elasticsearch:
  nodeCount:
|Number of Elasticsearch nodes to create.
|Integer value.
|1
|Proof of concept = 1,
Minimum deployment =3

|requests:
  cpu:
|Number of central processing units for requests, based on your environment's configuration.
|Specified in cores or millicores (for example, 200m, 0.5, 1).
|1Gi
|Proof of concept = 500m,
Minimum deployment =1

|requests:
  memory:
|Available memory for requests, based on your environment's configuration.
|Specified in bytes (for example, 200Ki, 50Mi, 5Gi).
|500m
|Proof of concept = 1Gi,
Minimum deployment = 16Gi*

|limits:
  cpu:
|Limit on number of central processing units, based on your environment's configuration.
|Specified in cores or millicores (for example, 200m, 0.5, 1).
|
|Proof of concept = 500m,
Minimum deployment =1

|limits:
  memory:
|Available memory limit based on your environment's configuration.
|Specified in bytes (for example, 200Ki, 50Mi, 5Gi).
|
|Proof of concept = 1Gi,
Minimum deployment = 16Gi*

|
4+|{asterisk} Each Elasticsearch node can operate with a lower memory setting though this is *not* recommended for production deployments. For production use, you should have no less than 16Gi allocated to each pod by default, but preferably allocate as much as you can, up to 64Gi per pod.
|===


.Procedure

. Log in to the {product-title} web console as a user with the `cluster-admin` role.

. Navigate to *Operators* -> *Installed Operators*.

. Click the {SMProductName} Operator.

. Click the *Istio Service Mesh Control Plane* tab.

. Click the name of your control plane file, for example, `basic-install`.

. Click the *YAML* tab.

. Edit the Jaeger parameters, replacing the default `all-in-one` template with parameters for the `production-elasticsearch` template, modified for your use case.  Ensure that the indentation is correct.

. Click *Save*.

. Click *Reload*.
{product-title} redeploys Jaeger and creates the Elasticsearch resources based on the specified parameters.
