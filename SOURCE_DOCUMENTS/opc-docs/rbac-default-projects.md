// Module included in the following assemblies:
//
// * authentication/using-rbac.adoc
// * post_installation_configuration/preparing-for-users.adoc

[id="rbac-default-projects_{context}"]
= Default projects

{product-title} comes with a number of default projects, and projects
starting with `openshift-` are the most essential to users.
These projects host master components that run as pods and other infrastructure
components. The pods created in these namespaces that have a
link:https://kubernetes.io/docs/tasks/administer-cluster/guaranteed-scheduling-critical-addon-pods/#rescheduler-guaranteed-scheduling-of-critical-add-ons[critical pod annotation]
are considered critical, and the have guaranteed admission by kubelet.
Pods created for master components in these namespaces are already marked as
critical.

include::snippets/default-projects.adoc[]
