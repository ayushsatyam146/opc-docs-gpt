// Module included in the following assemblies:
//
//* registry/configuring_registry_storage-azure.adoc

:_mod-docs-content-type: PROCEDURE
[id="registry-configuring-storage-azure-gov-cloud_{context}"]
= Configuring registry storage for Azure Government

During installation, your cloud credentials are sufficient to create Azure Blob
Storage, and the Registry Operator automatically configures storage.

.Prerequisites

* A cluster on Azure with user-provisioned infrastructure in a government region.
* To configure registry storage for Azure, provide Registry Operator
cloud credentials.
* For Azure storage, the secret is expected to contain one key:
** `REGISTRY_STORAGE_AZURE_ACCOUNTKEY`

.Procedure

. Create an link:https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-portal[Azure storage container].

. Fill in the storage configuration in `configs.imageregistry.operator.openshift.io/cluster`:
+
[source,terminal]
----
$ oc edit configs.imageregistry.operator.openshift.io/cluster
----
+
.Example configuration
[source,yaml]
----
storage:
  azure:
    accountName: <storage-account-name>
    container: <container-name>
    cloudName: AzureUSGovernmentCloud <1>
----
<1> `cloudName` is the name of the Azure cloud environment, which can be used to configure the Azure SDK with the appropriate Azure API endpoints. Defaults to `AzurePublicCloud`. You can also set `cloudName` to `AzureUSGovernmentCloud`, `AzureChinaCloud`, or `AzureGermanCloud` with sufficient credentials.
