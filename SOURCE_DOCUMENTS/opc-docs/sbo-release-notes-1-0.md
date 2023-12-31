[id="sbo-release-notes-1-0_{context}"]
= Release notes for {servicebinding-title} 1.0

{servicebinding-title} is now available on {product-title} 4.7, 4.8 and 4.9.

The custom resource definition (CRD) of the {servicebinding-title} 1.0 supports the following APIs:

* *Service Binding* with the `binding.operators.coreos.com` API group.
* *Service Binding (Spec API Tech Preview)* with the `servicebinding.io` API group.
+
--
:FeatureName: *Service Binding (Spec API Tech Preview)* with the `servicebinding.io` API group
include::snippets/technology-preview.adoc[leveloffset=+1]
--

[id="support-matrix-1-0_{context}"]
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
| Feature | {servicebinding-title} 1.0
| `binding.operators.coreos.com` API group
| GA
| `servicebinding.io` API group
| TP
|===

[id="new-features-1-0_{context}"]
== New features
{servicebinding-title} 1.0 supports OpenShift Container Platform 4.9 and later running on:

* IBM Power Systems
* IBM Z and LinuxONE

This section highlights what is new in {servicebinding-title} 1.0:

* Exposal of binding data from services
** Based on annotations present in CRD, custom resources (CRs), or resources.
** Based on descriptors present in Operator Lifecycle Manager (OLM) descriptors.
** Support for provisioned services
* Workload projection
** Projection of binding data as files, with volume mounts.
** Projection of binding data as environment variables.
* Service Binding Options
** Bind backing services in a namespace that is different from the workload namespace.
** Project binding data into the specific container workloads.
** Auto-detection of the binding data from resources owned by the backing service CR.
** Compose custom binding data from the exposed binding data.
** Support for non-`PodSpec` compliant workload resources.
* Security
** Support for role-based access control (RBAC).
