// Module included in the following assemblies:
//
// * networking/multiple_networks/remove-additional-network.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-multus-delete-network_{context}"]
= Removing an additional network attachment definition

As a cluster administrator, you can remove an additional network from your
{product-title} cluster. The additional network is not removed from any pods it
is attached to.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* Log in as a user with `cluster-admin` privileges.

.Procedure

To remove an additional network from your cluster, complete the following steps:

. Edit the Cluster Network Operator (CNO) in your default text editor by running
the following command:
+
[source,terminal]
----
$ oc edit networks.operator.openshift.io cluster
----

. Modify the CR by removing the configuration from the `additionalNetworks`
collection for the network attachment definition you are removing.
+
[source,yaml]
----
apiVersion: operator.openshift.io/v1
kind: Network
metadata:
  name: cluster
spec:
  additionalNetworks: [] <1>
----
<1>  If you are removing the configuration mapping for the only additional
network attachment definition in the `additionalNetworks` collection, you must
specify an empty collection.

. Save your changes and quit the text editor to commit your changes.

. Optional: Confirm that the additional network CR was deleted by running the following command:
+
[source,terminal]
----
$ oc get network-attachment-definition --all-namespaces
----
