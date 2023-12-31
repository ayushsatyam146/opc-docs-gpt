// Module included in the following assemblies:
//
// *installing/installing-troubleshooting.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-manually-gathering-logs-without-SSH_{context}"]
= Manually gathering logs without SSH access to your host(s)

Manually gather logs in situations where `must-gather` or automated collection
methods do not work.

If you do not have SSH access to your node, you can access the systems journal
to investigate what is happening on your host.

.Prerequisites

* Your {product-title} installation must be complete.
* Your API service is still functional.
* You have system administrator privileges.

.Procedure

. Access `journald` unit logs under `/var/log` by running:
+
[source,terminal]
----
$ oc adm node-logs --role=master -u kubelet
----

. Access host file paths under `/var/log` by running:
+
[source,terminal]
----
$ oc adm node-logs --role=master --path=openshift-apiserver
----
