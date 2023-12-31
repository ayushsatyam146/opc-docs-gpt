[id="sbo-release-notes-1-0-1_{context}"]
= Release notes for {servicebinding-title} 1.0.1

{servicebinding-title} is now available on {product-title} 4.7, 4.8 and 4.9.

{servicebinding-title} 1.0.1 supports OpenShift Container Platform 4.9 and later running on:

* IBM Power Systems
* IBM Z and LinuxONE

The custom resource definition (CRD) of the {servicebinding-title} 1.0.1 supports the following APIs:

* *Service Binding* with the `binding.operators.coreos.com` API group.
* *Service Binding (Spec API Tech Preview)* with the `servicebinding.io` API group.
+
--
:FeatureName: *Service Binding (Spec API Tech Preview)* with the `servicebinding.io` API group
include::snippets/technology-preview.adoc[leveloffset=+1]
--

[id="support-matrix-1-0-1_{context}"]
== Support matrix

Some features in this release are currently in Technology Preview. These experimental features are not intended for production use.

link:https://access.redhat.com/support/offerings/techpreview[Technology Preview Features Support Scope]

In the table below, features are marked with the following statuses:

- *TP*: _Technology Preview_

- *GA*: _General Availability_

Note the following scope of support on the Red Hat Customer Portal for these features:

.Support matrix
[cols="1,1",options="header"]
|===
| Feature | {servicebinding-title} 1.0.1
| `binding.operators.coreos.com` API group
| GA
| `servicebinding.io` API group
| TP
|===


[id="fixed-issues-1-0-1_{context}"]
== Fixed issues
* Before this update, binding the data values from a `Cluster` custom resource (CR) of the `postgresql.k8s.enterpriesedb.io/v1` API collected the `host` binding value from the `.metadata.name` field of the CR. The collected binding value is an incorrect hostname and the correct hostname is available at the `.status.writeService` field. With this update, the annotations that the {servicebinding-title} uses to expose the binding data values from the backing service CR are now modified to collect the `host` binding value from the `.status.writeService` field. The {servicebinding-title} uses these modified annotations to project the correct hostname in the `host` and `provider` bindings. link:https://issues.redhat.com/browse/APPSVC-1040[APPSVC-1040]
* Before this update, when you would bind a `PostgresCluster` CR of the `postgres-operator.crunchydata.com/v1beta1` API, the binding data values did not include the values for the database certificates. As a result, the application failed to connect to the database. With this update, modifications to the annotations that the {servicebinding-title} uses to expose the binding data from the backing service CR now include the database certificates. The {servicebinding-title} uses these modified annotations to project the correct `ca.crt`, `tls.crt`, and `tls.key` certificate files. link:https://issues.redhat.com/browse/APPSVC-1045[APPSVC-1045]
* Before this update, when you would bind a `PerconaXtraDBCluster` custom resource (CR) of the `pxc.percona.com` API, the binding data values did not include the `port` and `database` values. These binding values along with the others already projected are necessary for an application to successfully connect to the database service. With this update, the annotations that the {servicebinding-title} uses to expose the binding data values from the backing service CR are now modified to project the additional `port` and `database` binding values. The {servicebinding-title} uses these modified annotations to project the complete set of binding values that the application can use to successfully connect to the database service. link:https://issues.redhat.com/browse/APPSVC-1073[APPSVC-1073]


[id="known-issues-1-0-1_{context}"]
== Known issues
* Currently, when you install the {servicebinding-title} in the single namespace installation mode, the absence of an appropriate namespace-scoped role-based access control (RBAC) rule prevents the successful binding of an application to a few known Operator-backed services that the {servicebinding-title} can automatically detect and bind to. In addition, the following error message is generated:
+
.Example error message
----
`postgresclusters.postgres-operator.crunchydata.com "hippo" is forbidden:
        User "system:serviceaccount:my-petclinic:service-binding-operator" cannot
        get resource "postgresclusters" in API group "postgres-operator.crunchydata.com"
        in the namespace "my-petclinic"`
----
+
Workaround 1: Install the {servicebinding-title} in the `all namespaces` installation mode. As a result, the appropriate cluster-scoped RBAC rule now exists and the binding succeeds.
+
Workaround 2: If you cannot install the {servicebinding-title} in the `all namespaces` installation mode, install the following role binding into the namespace where the {servicebinding-title} is installed:
+
.Example: Role binding for Crunchy Postgres Operator
[source,yaml]
----
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: service-binding-crunchy-postgres-viewer
subjects:
  - kind: ServiceAccount
    name: service-binding-operator
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: service-binding-crunchy-postgres-viewer-role
----
link:https://issues.redhat.com/browse/APPSVC-1062[APPSVC-1062]
