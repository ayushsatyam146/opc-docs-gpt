// Module included in the following assemblies:
//
// * operators/admin/olm-creating-policy.adoc

:_mod-docs-content-type: PROCEDURE
[id="olm-policy-troubleshooting_{context}"]
= Troubleshooting permission failures

If an Operator installation fails due to lack of permissions, identify the errors using the following procedure.

.Procedure

. Review the `Subscription` object. Its status has an object reference `installPlanRef` that points to the `InstallPlan` object that attempted to create the necessary `[Cluster]Role[Binding]` object(s) for the Operator:
+
[source,yaml]
----
apiVersion: operators.coreos.com/v1
kind: Subscription
metadata:
  name: etcd
  namespace: scoped
status:
  installPlanRef:
    apiVersion: operators.coreos.com/v1
    kind: InstallPlan
    name: install-4plp8
    namespace: scoped
    resourceVersion: "117359"
    uid: 2c1df80e-afea-11e9-bce3-5254009c9c23
----

. Check the status of the `InstallPlan` object for any errors:
+
[source,yaml]
----
apiVersion: operators.coreos.com/v1
kind: InstallPlan
status:
  conditions:
  - lastTransitionTime: "2019-07-26T21:13:10Z"
    lastUpdateTime: "2019-07-26T21:13:10Z"
    message: 'error creating clusterrole etcdoperator.v0.9.4-clusterwide-dsfx4: clusterroles.rbac.authorization.k8s.io
      is forbidden: User "system:serviceaccount:scoped:scoped" cannot create resource
      "clusterroles" in API group "rbac.authorization.k8s.io" at the cluster scope'
    reason: InstallComponentFailed
    status: "False"
    type: Installed
  phase: Failed
----
+
The error message tells you:
+
* The type of resource it failed to create, including the API group of the resource. In this case, it was `clusterroles` in the `rbac.authorization.k8s.io` group.
* The name of the resource.
* The type of error: `is forbidden` tells you that the user does not have enough permission to do the operation.
* The name of the user who attempted to create or update the resource. In this case, it refers to the service account specified in the Operator group.
* The scope of the operation: `cluster scope` or not.
+
The user can add the missing permission to the service account and then iterate.
+
[NOTE]
====
Operator Lifecycle Manager (OLM) does not currently provide the complete list of errors on the first try.
====
