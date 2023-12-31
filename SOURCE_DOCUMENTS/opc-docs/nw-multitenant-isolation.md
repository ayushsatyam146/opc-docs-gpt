// Module included in the following assemblies:
// * networking/multitenant-isolation.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-multitenant-isolation_{context}"]
= Isolating a project

You can isolate a project so that pods and services in other projects cannot
access its pods and services.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* You must log in to the cluster with a user that has the `cluster-admin` role.

.Procedure

* To isolate the projects in the cluster, run the following command:
+
[source,terminal]
----
$ oc adm pod-network isolate-projects <project1> <project2>
----
+
Alternatively, instead of specifying specific project names, you can use the
`--selector=<project_selector>` option to specify projects based upon an
associated label.
