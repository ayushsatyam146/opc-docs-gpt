// Module included in the following assemblies:
//
// * networking/ovn_kubernetes_network_provider/configuring-egress-ips-ovn.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-egress-ips-node_{context}"]
= Labeling a node to host egress IP addresses

You can apply the `k8s.ovn.org/egress-assignable=""` label to a node in your cluster so that {product-title} can assign one or more egress IP addresses to the node.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* Log in to the cluster as a cluster administrator.

.Procedure

* To label a node so that it can host one or more egress IP addresses, enter the following command:
+
[source,terminal]
----
$ oc label nodes <node_name> k8s.ovn.org/egress-assignable="" <1>
----
+
<1> The name of the node to label.
+
[TIP]
====
You can alternatively apply the following YAML to add the label to a node:

[source,yaml]
----
apiVersion: v1
kind: Node
metadata:
  labels:
    k8s.ovn.org/egress-assignable: ""
  name: <node_name>
----
====
