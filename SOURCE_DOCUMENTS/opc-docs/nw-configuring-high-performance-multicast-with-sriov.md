// Module included in the following assemblies:
//
// * networking/hardware_networks/using-sriov-multicast.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-using-an-sriov-interface-for-multicast_{context}"]
= Configuring an SR-IOV interface for multicast

The follow procedure creates an example SR-IOV interface for multicast.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* You must log in to the cluster with a user that has the `cluster-admin` role.

.Procedure

. Create a `SriovNetworkNodePolicy` object:
+
[source,yaml]
----
apiVersion: sriovnetwork.openshift.io/v1
kind: SriovNetworkNodePolicy
metadata:
  name: policy-example
  namespace: openshift-sriov-network-operator
spec:
  resourceName: example
  nodeSelector:
    feature.node.kubernetes.io/network-sriov.capable: "true"
  numVfs: 4
  nicSelector:
    vendor: "8086"
    pfNames: ['ens803f0']
    rootDevices: ['0000:86:00.0']
----

. Create a `SriovNetwork` object:
+
[source,yaml]
----
apiVersion: sriovnetwork.openshift.io/v1
kind: SriovNetwork
metadata:
  name: net-example
  namespace: openshift-sriov-network-operator
spec:
  networkNamespace: default
  ipam: | <1>
    {
      "type": "host-local", <1>
      "subnet": "10.56.217.0/24",
      "rangeStart": "10.56.217.171",
      "rangeEnd": "10.56.217.181",
      "routes": [
        {"dst": "224.0.0.0/5"},
        {"dst": "232.0.0.0/5"}
      ],
      "gateway": "10.56.217.1"
    }
  resourceName: example
----
<1> If you choose to configure DHCP as IPAM, ensure that you provision the following default routes through your DHCP server: `224.0.0.0/5` and `232.0.0.0/5`. This is to override the static multicast route set by the default network provider.

. Create a pod with multicast application:
+
[source,yaml]
----
apiVersion: v1
kind: Pod
metadata:
  name: testpmd
  namespace: default
  annotations:
    k8s.v1.cni.cncf.io/networks: nic1
spec:
  containers:
  - name: example
    image: rhel7:latest
    securityContext:
      capabilities:
        add: ["NET_ADMIN"] <1>
    command: [ "sleep", "infinity"]
----
<1> The `NET_ADMIN` capability is required only if your application needs to
assign the multicast IP address to the SR-IOV interface. Otherwise, it can be
omitted.
