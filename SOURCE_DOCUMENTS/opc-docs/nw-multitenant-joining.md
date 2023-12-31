// Module included in the following assemblies:
// * networking/multitenant-isolation.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-multitenant-joining_{context}"]
= Joining projects

You can join two or more projects to allow network traffic between pods and
services in different projects.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* You must log in to the cluster with a user that has the `cluster-admin` role.

.Procedure

. Use the following command to join projects to an existing project network:
+
[source,terminal]
----
$ oc adm pod-network join-projects --to=<project1> <project2> <project3>
----
+
Alternatively, instead of specifying specific project names, you can use the
`--selector=<project_selector>` option to specify projects based upon an
associated label.

. Optional: Run the following command to view the pod networks that you have
joined together:
+
[source,terminal]
----
$ oc get netnamespaces
----
+
Projects in the same pod-network have the same network ID in the *NETID* column.
