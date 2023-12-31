// Module included in the following assemblies:
//
// * scaling_and_performance/using-topology-manager.adoc

[id="pod-interactions-with-topology-manager_{context}"]
= Pod interactions with Topology Manager policies

The example `Pod` specs below help illustrate pod interactions with Topology Manager.

The following pod runs in the `BestEffort` QoS class because no resource requests or limits are specified.

[source,yaml]
----
spec:
  containers:
  - name: nginx
    image: nginx
----

The next pod runs in the `Burstable` QoS class because requests are less than limits.

[source,yaml]
----
spec:
  containers:
  - name: nginx
    image: nginx
    resources:
      limits:
        memory: "200Mi"
      requests:
        memory: "100Mi"
----

If the selected policy is anything other than `none`, Topology Manager would not consider either of these `Pod` specifications.

The last example pod below runs in the Guaranteed QoS class because requests are equal to limits.

[source,yaml]
----
spec:
  containers:
  - name: nginx
    image: nginx
    resources:
      limits:
        memory: "200Mi"
        cpu: "2"
        example.com/device: "1"
      requests:
        memory: "200Mi"
        cpu: "2"
        example.com/device: "1"
----

Topology Manager would consider this pod. The Topology Manager would consult the hint providers, which are CPU Manager and Device Manager, to get topology hints for the pod.

Topology Manager will use this information to store the best topology for this container. In the case of this pod, CPU Manager and Device Manager will use this stored information at the resource allocation stage.
