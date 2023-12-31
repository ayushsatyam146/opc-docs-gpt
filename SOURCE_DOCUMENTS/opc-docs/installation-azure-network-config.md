// Module included in the following assemblies:
//
// * installing/installing_azure/installing-azure-account.adoc
// * installing/installing_azure/installing-azure-user-infra.adoc
// * installing/installing_azure/installing-restricted-networks-azure-user-provisioned.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-azure-network-config_{context}"]
= Configuring a public DNS zone in Azure

To install {product-title}, the Microsoft Azure account you use must
have a dedicated public hosted DNS zone in your account. This zone must be
authoritative for the domain. This service provides
cluster DNS resolution and name lookup for external connections to the cluster.

.Procedure

. Identify your domain, or subdomain, and registrar. You can transfer an
existing domain and registrar or obtain a new one through Azure or another source.
+
[NOTE]
====
For more information about purchasing domains through Azure, see
link:https://docs.microsoft.com/en-us/azure/app-service/manage-custom-dns-buy-domain[Buy a custom domain name for Azure App Service]
in the Azure documentation.
====

. If you are using an existing domain and registrar, migrate its DNS to Azure. See
link:https://docs.microsoft.com/en-us/azure/app-service/manage-custom-dns-migrate-domain[Migrate an active DNS name to Azure App Service]
in the Azure documentation.

. Configure DNS for your domain. Follow the steps in the
link:https://docs.microsoft.com/en-us/azure/dns/dns-delegate-domain-azure-dns[Tutorial: Host your domain in Azure DNS]
in the Azure documentation to create a public hosted zone for your domain or
subdomain, extract the new authoritative name servers, and update the registrar
records for the name servers that your domain uses.
+
Use an appropriate root domain, such as `openshiftcorp.com`, or subdomain,
such as `clusters.openshiftcorp.com`.

. If you use a subdomain, follow your company's procedures to add its delegation
records to the parent domain.
