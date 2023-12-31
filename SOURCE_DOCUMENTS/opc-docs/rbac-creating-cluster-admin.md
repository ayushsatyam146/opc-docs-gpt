// Module included in the following assemblies:
//
// * authentication/using-rbac.adoc
// * post_installation_configuration/preparing-for-users.adoc

:_mod-docs-content-type: PROCEDURE
[id="creating-cluster-admin_{context}"]
= Creating a cluster admin

The `cluster-admin` role is required to perform administrator
level tasks on the {product-title} cluster, such as modifying
cluster resources.

.Prerequisites

* You must have created a user to define as the cluster admin.

.Procedure

* Define the user as a cluster admin:
+
[source,terminal]
----
$ oc adm policy add-cluster-role-to-user cluster-admin <user>
----
