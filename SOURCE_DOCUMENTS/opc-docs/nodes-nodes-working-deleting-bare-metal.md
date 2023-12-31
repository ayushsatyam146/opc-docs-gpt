// Module included in the following assemblies:
//
// * nodes/nodes-nodes-working.adoc
// * virt/virtual_machines/virt-triggering-vm-failover-resolving-failed-node.adoc

:_mod-docs-content-type: PROCEDURE
[id="nodes-nodes-working-deleting-bare-metal_{context}"]
= Deleting nodes from a bare metal cluster

When you delete a node using the CLI, the node object is deleted in Kubernetes,
but the pods that exist on the node are not deleted. Any bare pods not backed by
a replication controller become inaccessible to {product-title}. Pods backed by
replication controllers are rescheduled to other available nodes. You must
delete local manifest pods.

.Procedure

Delete a node from an {product-title} cluster running on bare metal by completing
the following steps:

. Mark the node as unschedulable:
+
[source,terminal]
----
$ oc adm cordon <node_name>
----

. Drain all pods on the node:
+
[source,terminal]
----
$ oc adm drain <node_name> --force=true
----
+
This step might fail if the node is offline or unresponsive. Even if the node does not respond, it might still be running a workload that writes to shared storage. To avoid data corruption, power down the physical hardware before you proceed.

. Delete the node from the cluster:
+
[source,terminal]
----
$ oc delete node <node_name>
----
+
Although the node object is now deleted from the cluster, it can still rejoin
the cluster after reboot or if the kubelet service is restarted. To permanently
delete the node and all its data, you must
link:https://access.redhat.com/solutions/84663[decommission the node].

. If you powered down the physical hardware, turn it back on so that the node can rejoin the cluster.
