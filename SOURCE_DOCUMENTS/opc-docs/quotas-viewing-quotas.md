// Module included in the following assemblies:
//
// * applications/quotas/quotas-setting-per-project.adoc

:_mod-docs-content-type: PROCEDURE
[id="quota-viewing-quotas_{context}"]
= Viewing a quota

You can view usage statistics related to any hard limits defined in a project's
quota by navigating in the web console to the project's *Quota* page.

You can also use the CLI to view quota details.

.Procedure

. Get the list of quotas defined in the project. For example, for a project called
`demoproject`:
+
[source,terminal]
----
$ oc get quota -n demoproject
----
+
.Example output
[source,terminal]
----
NAME                AGE
besteffort          11m
compute-resources   2m
core-object-counts  29m
----

. Describe the quota you are interested in, for example the `core-object-counts`
quota:
+
[source,terminal]
----
$ oc describe quota core-object-counts -n demoproject
----
+
.Example output
[source,terminal]
----
Name:			core-object-counts
Namespace:		demoproject
Resource		Used	Hard
--------		----	----
configmaps		3	10
persistentvolumeclaims	0	4
replicationcontrollers	3	20
secrets			9	10
services		2	10
----
