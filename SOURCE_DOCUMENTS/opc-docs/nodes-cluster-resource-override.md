// Module included in the following assemblies:
//
// * nodes/clusters/nodes-cluster-overcommit.adoc
// * post_installation_configuration/node-tasks.adoc

[id="nodes-cluster-resource-override_{context}"]
= Cluster-level overcommit using the Cluster Resource Override Operator

The Cluster Resource Override Operator is an admission webhook that allows you to control the level of overcommit and manage
container density across all the nodes in your cluster. The Operator controls how nodes in specific projects can exceed defined memory and CPU limits.

You must install the Cluster Resource Override Operator using the {product-title} console or CLI as shown in the following sections.
During the installation, you create a `ClusterResourceOverride` custom resource (CR), where you set the level of overcommit, as shown in the
following example:

[source,yaml]
----
apiVersion: operator.autoscaling.openshift.io/v1
kind: ClusterResourceOverride
metadata:
    name: cluster <1>
spec:
  podResourceOverride:
    spec:
      memoryRequestToLimitPercent: 50 <2>
      cpuRequestToLimitPercent: 25 <3>
      limitCPUToMemoryPercent: 200 <4>
# ...
----
<1> The name must be `cluster`.
<2> Optional. If a container memory limit has been specified or defaulted, the memory request is overridden to this percentage of the limit, between 1-100. The default is 50.
<3> Optional. If a container CPU limit has been specified or defaulted, the CPU request is overridden to this percentage of the limit, between 1-100. The default is 25.
<4> Optional. If a container memory limit has been specified or defaulted, the CPU limit is overridden to a percentage of the memory limit, if specified. Scaling 1Gi of RAM at 100 percent is equal to 1 CPU core. This is processed prior to overriding the CPU request (if configured). The default is 200.

[NOTE]
====
The Cluster Resource Override Operator overrides have no effect if limits have not
been set on containers. Create a `LimitRange` object with default limits per individual project
or configure limits in `Pod` specs for the overrides to apply.
====

When configured, overrides can be enabled per-project by applying the following
label to the Namespace object for each project:

[source,yaml]
----
apiVersion: v1
kind: Namespace
metadata:

# ...

  labels:
    clusterresourceoverrides.admission.autoscaling.openshift.io/enabled: "true"

# ...
----

The Operator watches for the `ClusterResourceOverride` CR and ensures that the `ClusterResourceOverride` admission webhook is installed into the same namespace as the operator.
