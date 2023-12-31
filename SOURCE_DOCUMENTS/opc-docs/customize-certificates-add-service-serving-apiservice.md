// Module included in the following assemblies:
//
// * security/certificates/service-serving-certificate.adoc

:_mod-docs-content-type: PROCEDURE
[id="add-service-certificate-apiservice_{context}"]
= Add the service CA bundle to an API service

You can annotate an `APIService` object with `service.beta.openshift.io/inject-cabundle=true` to have its `spec.caBundle` field populated with the service CA bundle. This allows the Kubernetes API server to validate the service CA certificate used to secure the targeted endpoint.

.Procedure

. Annotate the API service with `service.beta.openshift.io/inject-cabundle=true`:
+
[source,terminal]
----
$ oc annotate apiservice <api_service_name> \//<1>
     service.beta.openshift.io/inject-cabundle=true
----
<1> Replace `<api_service_name>` with the name of the API service to annotate.
+
For example, use the following command to annotate the API service `test1`:
+
[source,terminal]
----
$ oc annotate apiservice test1 service.beta.openshift.io/inject-cabundle=true
----

. View the API service to ensure that the service CA bundle has been injected:
+
[source,terminal]
----
$ oc get apiservice <api_service_name> -o yaml
----
+
The CA bundle is displayed in the `spec.caBundle` field in the YAML output:
+
[source,terminal]
----
apiVersion: apiregistration.k8s.io/v1
kind: APIService
metadata:
  annotations:
    service.beta.openshift.io/inject-cabundle: "true"
...
spec:
  caBundle: <CA_BUNDLE>
...
----
