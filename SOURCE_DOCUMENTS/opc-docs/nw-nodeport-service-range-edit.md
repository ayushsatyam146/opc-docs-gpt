// Module included in the following assemblies:
//
// * networking/configuring-node-port-service-range.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-nodeport-service-range-edit_{context}"]
= Expanding the node port range

You can expand the node port range for the cluster.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* Log in to the cluster with a user with `cluster-admin` privileges.

.Procedure

. To expand the node port range, enter the following command. Replace `<port>` with the largest port number in the new range.
+
[source,terminal]
----
$ oc patch network.config.openshift.io cluster --type=merge -p \
  '{
    "spec":
      { "serviceNodePortRange": "30000-<port>" }
  }'
----
+
[TIP]
====
You can alternatively apply the following YAML to update the node port range:

[source,yaml]
----
apiVersion: config.openshift.io/v1
kind: Network
metadata:
  name: cluster
spec:
  serviceNodePortRange: "30000-<port>"
----
====
+
.Example output
[source,terminal]
----
network.config.openshift.io/cluster patched
----

. To confirm that the configuration is active, enter the following command. It can take several minutes for the update to apply.
+
[source,terminal]
----
$ oc get configmaps -n openshift-kube-apiserver config \
  -o jsonpath="{.data['config\.yaml']}" | \
  grep -Eo '"service-node-port-range":["[[:digit:]]+-[[:digit:]]+"]'
----
+
.Example output
[source,terminal]
----
"service-node-port-range":["30000-33000"]
----
