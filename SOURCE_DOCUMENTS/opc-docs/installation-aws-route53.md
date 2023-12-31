// Module included in the following assemblies:
//
// * installing/installing_aws/installing-aws-account.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-aws-route53_{context}"]
= Configuring Route 53

To install {product-title}, the Amazon Web Services (AWS) account you use must
have a dedicated public hosted zone in your Route 53 service. This zone must be
authoritative for the domain. The Route 53 service provides
cluster DNS resolution and name lookup for external connections to the cluster.

.Procedure

. Identify your domain, or subdomain, and registrar. You can transfer an existing domain and
registrar or obtain a new one through AWS or another source.
+
[NOTE]
====
If you purchase a new domain through AWS, it takes time for the relevant DNS
changes to propagate. For more information about purchasing domains
through AWS, see
link:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar.html[Registering Domain Names Using Amazon Route 53]
in the AWS documentation.
====

. If you are using an existing domain and registrar, migrate its DNS to AWS. See
link:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/MigratingDNS.html[Making Amazon Route 53 the DNS Service for an Existing Domain]
in the AWS documentation.

. Create a public hosted zone for your domain or subdomain. See
link:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingHostedZone.html[Creating a Public Hosted Zone]
in the AWS documentation.
+
Use an appropriate root domain, such as `openshiftcorp.com`, or subdomain,
such as `clusters.openshiftcorp.com`.

. Extract the new authoritative name servers from the hosted zone records. See
link:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/GetInfoAboutHostedZone.html[Getting the Name Servers for a Public Hosted Zone]
in the AWS documentation.

. Update the registrar records for the AWS Route 53 name servers that your domain
uses. For example, if you registered your domain to a Route 53 service in a
different accounts, see the following topic in the AWS documentation:
link:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-name-servers-glue-records.html#domain-name-servers-glue-records-procedure[Adding or Changing Name Servers or Glue Records].

. If you are using a subdomain, add its delegation records to the parent domain. This gives Amazon Route 53 responsibility for the subdomain. Follow the delegation procedure outlined by the DNS provider of the parent domain. See link:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingNewSubdomain.html[Creating a subdomain that uses Amazon Route 53 as the DNS service without migrating the parent domain] in the AWS documentation for an example high level procedure.
