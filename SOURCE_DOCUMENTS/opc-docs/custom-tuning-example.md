// Module included in the following assemblies:
//
// * scalability_and_performance/using-node-tuning-operator.adoc

[id="custom-tuning-example_{context}"]
= Custom tuning examples

*Using TuneD profiles from the default CR*

The following CR applies custom node-level tuning for
{product-title} nodes with label
`tuned.openshift.io/ingress-node-label` set to any value.

.Example: custom tuning using the openshift-control-plane TuneD profile
[source,yaml]
----
apiVersion: tuned.openshift.io/v1
kind: Tuned
metadata:
  name: ingress
  namespace: openshift-cluster-node-tuning-operator
spec:
  profile:
  - data: |
      [main]
      summary=A custom OpenShift ingress profile
      include=openshift-control-plane
      [sysctl]
      net.ipv4.ip_local_port_range="1024 65535"
      net.ipv4.tcp_tw_reuse=1
    name: openshift-ingress
  recommend:
  - match:
    - label: tuned.openshift.io/ingress-node-label
    priority: 10
    profile: openshift-ingress
----

[IMPORTANT]
====
Custom profile writers are strongly encouraged to include the default TuneD
daemon profiles shipped within the default Tuned CR. The example above uses the
default `openshift-control-plane` profile to accomplish this.
====

*Using built-in TuneD profiles*

Given the successful rollout of the NTO-managed daemon set, the TuneD operands
all manage the same version of the TuneD daemon. To list the built-in TuneD
profiles supported by the daemon, query any TuneD pod in the following way:

[source,terminal]
----
$ oc exec $tuned_pod -n openshift-cluster-node-tuning-operator -- find /usr/lib/tuned/ -name tuned.conf -printf '%h\n' | sed 's|^.*/||'
----

You can use the profile names retrieved by this in your custom tuning specification.

.Example: using built-in hpc-compute TuneD profile
[source,yaml]
----
apiVersion: tuned.openshift.io/v1
kind: Tuned
metadata:
  name: openshift-node-hpc-compute
  namespace: openshift-cluster-node-tuning-operator
spec:
  profile:
  - data: |
      [main]
      summary=Custom OpenShift node profile for HPC compute workloads
      include=openshift-node,hpc-compute
    name: openshift-node-hpc-compute

  recommend:
  - match:
    - label: tuned.openshift.io/openshift-node-hpc-compute
    priority: 20
    profile: openshift-node-hpc-compute
----

In addition to the built-in `hpc-compute` profile, the example above includes
the `openshift-node` TuneD daemon profile shipped within the default
Tuned CR to use OpenShift-specific tuning for compute nodes.

// Note the issues with including profiles sharing the same ancestor: see link:https://bugzilla.redhat.com/show_bug.cgi?id=1825882[BZ#1825882]

*Overriding host-level sysctls*

Various kernel parameters can be changed at runtime by using `/run/sysctl.d/`, `/etc/sysctl.d/`, and `/etc/sysctl.conf` host configuration files. {product-title} adds several host configuration files which set kernel parameters at runtime; for example, `net.ipv[4-6].`, `fs.inotify.`, and `vm.max_map_count`. These runtime parameters provide basic functional tuning for the system prior to the kubelet and the Operator start.

The Operator does not override these settings unless the `reapply_sysctl` option is set to `false`. Setting this option to `false` results in `TuneD` not applying the settings from the host configuration files after it applies its custom profile.

.Example: overriding host-level sysctls
[source,yaml]
----
apiVersion: tuned.openshift.io/v1
kind: Tuned
metadata:
  name: openshift-no-reapply-sysctl
  namespace: openshift-cluster-node-tuning-operator
spec:
  profile:
  - data: |
      [main]
      summary=Custom OpenShift profile
      include=openshift-node
      [sysctl]
      vm.max_map_count=>524288
    name: openshift-no-reapply-sysctl
  recommend:
  - match:
    - label: tuned.openshift.io/openshift-no-reapply-sysctl
    priority: 15
    profile: openshift-no-reapply-sysctl
    operand:
      tunedConfig:
        reapply_sysctl: false
----
