// Module included in the following assemblies:
//
// * networking/cluster-network-operator.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-cno-view_{context}"]
= Viewing the cluster network configuration

Every new {product-title} installation has a `network.config` object named
`cluster`.

.Procedure

* Use the `oc describe` command to view the cluster network configuration:
+
[source,terminal]
----
$ oc describe network.config/cluster
----
+
.Example output
[source,terminal]
----
Name:         cluster
Namespace:
Labels:       <none>
Annotations:  <none>
API Version:  config.openshift.io/v1
Kind:         Network
Metadata:
  Self Link:           /apis/config.openshift.io/v1/networks/cluster
Spec: <1>
  Cluster Network:
    Cidr:         10.128.0.0/14
    Host Prefix:  23
  Network Type:   OpenShiftSDN
  Service Network:
    172.30.0.0/16
Status: <2>
  Cluster Network:
    Cidr:               10.128.0.0/14
    Host Prefix:        23
  Cluster Network MTU:  8951
  Network Type:         OpenShiftSDN
  Service Network:
    172.30.0.0/16
Events:  <none>
----
<1> The `Spec` field displays the configured state of the cluster network.
<2> The `Status` field displays the current state of the cluster network
configuration.

////
* Use the `oc describe` command to view the cluster network configuration:
+
[source,terminal]
----
$ oc describe network.operator/cluster

Name:         cluster
Namespace:
Labels:       <none>
Annotations:  <none>
API Version:  operator.openshift.io/v1
Kind:         Network
Metadata:
  Self Link:           /apis/operator.openshift.io/v1/networks/cluster
Spec:
  Cluster Network:
    Cidr:         10.128.0.0/14
    Host Prefix:  23
  Default Network:
    Type:  OpenShiftSDN
  Service Network:
    172.30.0.0/16
Status:
Events:  <none>
----
////
