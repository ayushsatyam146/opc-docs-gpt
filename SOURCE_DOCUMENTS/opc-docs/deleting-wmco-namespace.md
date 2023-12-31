// Module included in the following assemblies:
//
// * windows_containers/disabling-windows-container-workloads.adoc

:_mod-docs-content-type: PROCEDURE
[id="deleting-wmco-namespace_{context}"]
= Deleting the Windows Machine Config Operator namespace

You can delete the namespace that was generated for the Windows Machine Config Operator (WMCO) by default.

.Prerequisites

* The WMCO is removed from your cluster.

.Procedure

. Remove all Windows workloads that were created in the `openshift-windows-machine-config-operator` namespace:
+
[source,terminal]
----
$ oc delete --all pods --namespace=openshift-windows-machine-config-operator
----

. Verify that all pods in the `openshift-windows-machine-config-operator` namespace are deleted or are reporting a terminating state:
+
[source,terminal]
----
$ oc get pods --namespace openshift-windows-machine-config-operator
----

. Delete the `openshift-windows-machine-config-operator` namespace:
+
[source,terminal]
----
$ oc delete namespace openshift-windows-machine-config-operator
----
