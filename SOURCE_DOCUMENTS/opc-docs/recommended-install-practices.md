// Module included in the following assemblies:
//
// * scalability_and_performance/recommended-install-practices.adoc

[id="recommended-install-practices_{context}"]
= Recommended practices for installing large scale clusters

When installing large clusters or scaling the cluster to larger node counts,
set the cluster network `cidr` accordingly in your `install-config.yaml`
file before you install the cluster:

[source,yaml]
----
networking:
  clusterNetwork:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  machineNetwork:
  - cidr: 10.0.0.0/16
  networkType: OVNKubernetes
  serviceNetwork:
  - 172.30.0.0/16
----

The default cluster network `cidr` `10.128.0.0/14` cannot be used if the cluster
size is more than 500 nodes. It must be set to `10.128.0.0/12` or
`10.128.0.0/10` to get to larger node counts beyond 500 nodes.
