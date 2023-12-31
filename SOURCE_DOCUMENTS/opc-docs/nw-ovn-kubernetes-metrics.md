// Module included in the following assemblies:
//
// * networking/ovn_kubernetes_network_provider/about-ovn-kubernetes.adoc

[id="nw-ovn-kubernetes-metrics_{context}"]
= Exposed metrics for OVN-Kubernetes

The OVN-Kubernetes network plugin exposes certain metrics for use by the Prometheus-based {product-title} cluster monitoring stack.

// openshift/ovn-kubernetes => go-controller/pkg/metrics/master.go

.Metrics exposed by OVN-Kubernetes
[cols="2a,8a",options="header"]
|===
|Name |Description

|`ovnkube_master_pod_creation_latency_seconds`
|The latency between when a pod is created and when the pod is annotated by OVN-Kubernetes. The higher the latency, the more time that elapses before a pod is available for network connectivity.

|===

////
|`ovnkube_master_nb_e2e_timestamp`
|A timestamp persisted to the OVN (Open Virtual Network) northbound database and updated frequently.
////
