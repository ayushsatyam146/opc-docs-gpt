// Module included in the following assemblies:
//
// * installing/installing_gcp/installing-gcp-user-infra-vpc.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-gcp-user-infra-config-host-project-vpc_{context}"]
= Configuring the GCP project that hosts your shared VPC network

If you use a shared Virtual Private Cloud (VPC) to host your {product-title} cluster in Google Cloud Platform (GCP), you must configure the project that hosts it.

[NOTE]
====
If you already have a project that hosts the shared VPC network, review this section to ensure that the project meets all of the requirements to install an {product-title} cluster.
====

.Procedure

. Create a project to host the shared VPC for your {product-title} cluster. See
link:https://cloud.google.com/resource-manager/docs/creating-managing-projects[Creating and Managing Projects] in the GCP documentation.

. Create a service account in the project that hosts your shared VPC. See
link:https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating_a_service_account[Creating a service account]
in the GCP documentation.

. Grant the service account the appropriate permissions. You can either
grant the individual permissions that follow or assign the `Owner` role to it.
See link:https://cloud.google.com/iam/docs/granting-roles-to-service-accounts#granting_access_to_a_service_account_for_a_resource[Granting roles to a service account for specific resources].
+
[NOTE]
====
While making the service account an owner of the project is the easiest way to gain the required permissions, it means that service account has complete control over the project. You must determine if the risk that comes from offering that power is acceptable.

The service account for the project that hosts the shared VPC network requires the following roles:

* Compute Network User
* Compute Security Admin
* Deployment Manager Editor
* DNS Administrator
* Security Admin
* Network Management Admin
====
