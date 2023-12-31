// Module included in the following assemblies:
//
// * networking/openshift_sdn/configuring-kube-proxy.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-kube-proxy-configuring_{context}"]
= Modifying the kube-proxy configuration

You can modify the Kubernetes network proxy configuration for your cluster.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* Log in to a running cluster with the `cluster-admin` role.

.Procedure

. Edit the `Network.operator.openshift.io` custom resource (CR) by running the
following command:
+
[source,terminal]
----
$ oc edit network.operator.openshift.io cluster
----

. Modify the `kubeProxyConfig` parameter in the CR with your changes to the
kube-proxy configuration, such as in the following example CR:
+
[source,yaml]
----
apiVersion: operator.openshift.io/v1
kind: Network
metadata:
  name: cluster
spec:
  kubeProxyConfig:
    iptablesSyncPeriod: 30s
    proxyArguments:
      iptables-min-sync-period: ["30s"]
----

. Save the file and exit the text editor.
+
The syntax is validated by the `oc` command when you save the file and exit the
editor. If your modifications contain a syntax error, the editor opens the file
and displays an error message.

. Enter the following command to confirm the configuration update:
+
[source,terminal]
----
$ oc get networks.operator.openshift.io -o yaml
----
+
.Example output
[source,yaml]
----
apiVersion: v1
items:
- apiVersion: operator.openshift.io/v1
  kind: Network
  metadata:
    name: cluster
  spec:
    clusterNetwork:
    - cidr: 10.128.0.0/14
      hostPrefix: 23
    defaultNetwork:
      type: OpenShiftSDN
    kubeProxyConfig:
      iptablesSyncPeriod: 30s
      proxyArguments:
        iptables-min-sync-period:
        - 30s
    serviceNetwork:
    - 172.30.0.0/16
  status: {}
kind: List
----

. Optional: Enter the following command to confirm that the Cluster Network
Operator accepted the configuration change:
+
[source,terminal]
----
$ oc get clusteroperator network
----
+
.Example output
[source,terminal]
----
NAME      VERSION     AVAILABLE   PROGRESSING   DEGRADED   SINCE
network   4.1.0-0.9   True        False         False      1m
----
+
The `AVAILABLE` field is `True` when the configuration update is applied
successfully.
