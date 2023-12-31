// Module included in the following assemblies:
//
// * authentication/understanding-authentication.adoc
// * authentication/understanding-identity-provider.adoc
// * post_installation_configuration/preparing-for-users.adoc

:_mod-docs-content-type: PROCEDURE
[id="removing-kubeadmin_{context}"]
= Removing the kubeadmin user

After you define an identity provider and create a new `cluster-admin`
user, you can remove the `kubeadmin` to improve cluster security.

[WARNING]
====
If you follow this procedure before another user is a `cluster-admin`,
then {product-title} must be reinstalled. It is not possible to undo
this command.
====

.Prerequisites

* You must have configured at least one identity provider.
* You must have added the `cluster-admin` role to a user.
* You must be logged in as an administrator.

.Procedure

* Remove the `kubeadmin` secrets:
+
[source,terminal]
----
$ oc delete secrets kubeadmin -n kube-system
----
