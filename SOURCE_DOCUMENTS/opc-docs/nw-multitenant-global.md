// Module included in the following assemblies:
// * networking/multitenant-isolation.adoc

:_mod-docs-content-type: PROCEDURE
[id="nw-multitenant-global_{context}"]
= Disabling network isolation for a project

You can disable network isolation for a project.

.Prerequisites

* Install the OpenShift CLI (`oc`).
* You must log in to the cluster with a user that has the `cluster-admin` role.

.Procedure

*  Run the following command for the project:
+
[source,terminal]
----
$ oc adm pod-network make-projects-global <project1> <project2>
----
+
Alternatively, instead of specifying specific project names, you can use the
`--selector=<project_selector>` option to specify projects based upon an
associated label.
