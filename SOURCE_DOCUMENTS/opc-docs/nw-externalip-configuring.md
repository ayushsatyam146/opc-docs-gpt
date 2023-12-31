// Module included in the following assemblies:
//
// * networking/configuring_ingress_cluster_traffic/configuring-externalip.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-externalip-configuring_{context}"]
= Configure external IP address blocks for your cluster

As a cluster administrator, you can configure the following ExternalIP settings:

- An ExternalIP address block used by {product-title} to automatically populate the `spec.clusterIP` field for a `Service` object.
- A policy object to restrict what IP addresses may be manually assigned to the `spec.clusterIP` array of a `Service` object.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* Access to the cluster as a user with the `cluster-admin` role.

.Procedure

. Optional: To display the current external IP configuration, enter the following command:
+
[source,terminal]
----
$ oc describe networks.config cluster
----

. To edit the configuration, enter the following command:
+
[source,terminal]
----
$ oc edit networks.config cluster
----

. Modify the ExternalIP configuration, as in the following example:
+
[source,yaml]
----
apiVersion: config.openshift.io/v1
kind: Network
metadata:
  name: cluster
spec:
  ...
  externalIP: <1>
  ...
----
<1> Specify the configuration for the `externalIP` stanza.

. To confirm the updated ExternalIP configuration, enter the following command:
+
[source,terminal]
----
$ oc get networks.config cluster -o go-template='{{.spec.externalIP}}{{"\n"}}'
----
