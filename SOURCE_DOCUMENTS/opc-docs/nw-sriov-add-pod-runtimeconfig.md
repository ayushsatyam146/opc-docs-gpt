// Module included in the following assemblies:
//
// * virt/node_network/virt-configuring-sr-iov-network.adoc
// * virt/vm_networking/virt-connecting-vm-to-sriov.adoc

// Deprecating in OCP; This is identical in practice to adding a pod
// to an additional network.

[id="nw-sriov-add-pod-runtimeconfig_{context}"]
= Configuring static MAC and IP addresses on additional SR-IOV networks

You can configure static MAC and IP addresses on an SR-IOV network by specifying Container Network Interface (CNI) `runtimeConfig` data in a pod annotation.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* Log in as a user with `cluster-admin` privileges when creating the `SriovNetwork` object.

.Procedure

. Create the following `SriovNetwork` object, and then save the YAML in the `<name>-sriov-network.yaml` file. Replace `<name>` with a name for this additional network.
+
[source,yaml]
----
apiVersion: sriovnetwork.openshift.io/v1
kind: SriovNetwork
metadata:
  name: <name> <1>
  namespace: openshift-sriov-network-operator <2>
spec:
  networkNamespace: <target_namespace> <3>
  ipam: '{ "type": "static" }' <4>
  capabilities: '{ "mac": true, "ips": true }' <5>
  resourceName: <sriov_resource_name> <6>
----
<1> Replace `<name>` with a name for the object. The SR-IOV Network Operator creates a `NetworkAttachmentDefinition` object with same name.
<2> Specify the namespace where the SR-IOV Network Operator is installed.
<3> Replace `<target_namespace>` with the namespace where the `NetworkAttachmentDefinition` object is created.
<4> Specify static type for the ipam CNI plugin as a YAML block scalar.
<5> Specify `mac` and `ips` `capabilities` to `true`.
<6> Replace `<sriov_resource_name>` with the value for the `spec.resourceName` parameter from the `SriovNetworkNodePolicy` object that defines the SR-IOV hardware for this additional network.

. Create the object by running the following command:
+
[source,terminal]
----
$ oc create -f <filename> <1>
----
<1>  Replace `<filename>` with the name of the file you created in the previous step.

. Optional: Confirm that the NetworkAttachmentDefinition CR associated with the `SriovNetwork` object that you created in the previous step exists by running the following command. Replace `<namespace>` with the namespace you specified in the `SriovNetwork` object.
+
[source,terminal]
----
$ oc get net-attach-def -n <namespace>
----

[NOTE]
=====
Do not modify or delete a `SriovNetwork` custom resource (CR) if it is attached to any pods in the `running` state.
=====

. Create the following SR-IOV pod spec, and then save the YAML in the `<name>-sriov-pod.yaml` file. Replace `<name>` with a name for this pod.
+
[source,yaml]
----
apiVersion: v1
kind: Pod
metadata:
  name: sample-pod
  annotations:
    k8s.v1.cni.cncf.io/networks: '[
	{
		"name": "<name>", <1>
		"mac": "20:04:0f:f1:88:01", <2>
		"ips": ["192.168.10.1/24", "2001::1/64"] <3>
	}
]'
spec:
  containers:
  - name: sample-container
    image: <image>
    imagePullPolicy: IfNotPresent
    command: ["sleep", "infinity"]
----
<1> Specify the name of the SR-IOV network attachment definition CR.
<2> Specify the MAC address for the SR-IOV device that is allocated from the resource type defined in the SR-IOV network attachment definition CR.
<3> Specify addresses for the SR-IOV device which is allocated from the resource type defined in the SR-IOV network attachment definition CR. Both IPv4 and IPv6 addresses are supported.

. Create the sample SR-IOV pod by running the following command:
+
[source,terminal]
----
$ oc create -f <filename> <1>
----
<1>  Replace `<filename>` with the name of the file you created in the previous step.

. Optional: Confirm that `mac` and `ips` addresses are applied to the SR-IOV device by running the following command. Replace `<namespace>` with the namespace you specified in the `SriovNetwork` object.
+
[source,terminal]
----
$ oc exec sample-pod -n <namespace> -- ip addr show
----
