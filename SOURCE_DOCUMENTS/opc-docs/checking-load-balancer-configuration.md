// Module included in the following assemblies:
//
// * support/troubleshooting/troubleshooting-installations.adoc

:_mod-docs-content-type: PROCEDURE
[id="checking-load-balancer-configuration_{context}"]
= Checking a load balancer configuration before {product-title} installation

Check your load balancer configuration prior to starting an {product-title} installation.

.Prerequisites

* You have configured an external load balancer of your choosing, in preparation for an {product-title} installation. The following example is based on a {op-system-base-full} host using HAProxy to provide load balancing services to a cluster.
* You have configured DNS in preparation for an {product-title} installation.
* You have SSH access to your load balancer.

.Procedure

. Check that the `haproxy` systemd service is active:
+
[source,terminal]
----
$ ssh <user_name>@<load_balancer> systemctl status haproxy
----

. Verify that the load balancer is listening on the required ports. The following example references ports `80`, `443`, `6443`, and `22623`.
+
* For HAProxy instances running on {op-system-base-full} 6, verify port status by using the `netstat` command:
+
[source,terminal]
----
$ ssh <user_name>@<load_balancer> netstat -nltupe | grep -E ':80|:443|:6443|:22623'
----
+
* For HAProxy instances running on {op-system-base-full} 7 or 8, verify port status by using the `ss` command:
+
[source,terminal]
----
$ ssh <user_name>@<load_balancer> ss -nltupe | grep -E ':80|:443|:6443|:22623'
----
+
[NOTE]
====
Red Hat recommends the `ss` command instead of `netstat` in {op-system-base-full} 7 or later. `ss` is provided by the iproute package. For more information on the `ss` command, see the link:https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/performance_tuning_guide/sect-red_hat_enterprise_linux-performance_tuning_guide-tool_reference-ss[{op-system-base-full} 7 Performance Tuning Guide].
====
+
. Check that the wildcard DNS record resolves to the load balancer:
+
[source,terminal]
----
$ dig <wildcard_fqdn> @<dns_server>
----
