// Module included in the following assemblies:
//
// * cli_reference/developer_cli_odo/installing-odo.adoc

[id="installing-odo-on-linux-on-ibm-power_{context}"]
= Installing {odo-title} on Linux on {ibm-power-title}

[id="installing-odo-on-linux-on-ibm-power-binary_{context}"]
== Binary installation

.Procedure

. Obtain the binary:
+
[source,terminal]
----
# curl -L https://mirror.openshift.com/pub/openshift-v4/clients/odo/latest/odo-linux-ppc64le -o /usr/local/bin/odo
----

. Change the permissions on the file:
+
[source,terminal]
----
# chmod +x /usr/local/bin/odo
----

[id="installing-odo-on-linux-on-ibm-power-tarball_{context}"]
== Tarball installation

.Procedure

. Obtain the tarball:
+
[source,terminal]
----
# sh -c 'curl -L https://mirror.openshift.com/pub/openshift-v4/clients/odo/latest/odo-linux-ppc64le.tar.gz | gzip -d > /usr/local/bin/odo'
----

. Change the permissions on the file:
+
[source,terminal]
----
# chmod +x /usr/local/bin/odo
----
