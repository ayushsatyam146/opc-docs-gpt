// Module included in the following assemblies:
//
// * cli_reference/developer_cli_odo/creating-a-single-component-application-with-odo.adoc

:_mod-docs-content-type: PROCEDURE
[id="connecting-your-application-to-multiple-services-using-openshift-service-catalog_{context}"]

= Connecting your application to multiple services using OpenShift Service Catalog

The OpenShift service catalog is an implementation of the Open Service Broker API (OSB API) for Kubernetes. You can use it to connect applications deployed in {product-title} to a variety of services.

.Prerequisites

* You have a running {product-title} cluster.
* The service catalog is installed and enabled on your cluster.

.Procedure

* To list the services:
+
[source,terminal]
----
$ odo catalog list services
----

* To use service catalog-related operations:
+
[source,terminal]
----
$ odo service <verb> <service_name>
----
