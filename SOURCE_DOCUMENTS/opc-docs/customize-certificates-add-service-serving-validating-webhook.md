// Module included in the following assemblies:
//
// * security/certificates/service-serving-certificate.adoc

:_mod-docs-content-type: PROCEDURE
[id="add-service-certificate-validating-webhook_{context}"]
= Add the service CA bundle to a validating webhook configuration

You can annotate a `ValidatingWebhookConfiguration` object with `service.beta.openshift.io/inject-cabundle=true` to have the `clientConfig.caBundle` field of each webhook populated with the service CA bundle. This allows the Kubernetes API server to validate the service CA certificate used to secure the targeted endpoint.

[NOTE]
====
Do not set this annotation for admission webhook configurations that need to specify different CA bundles for different webhooks. If you do, then the service CA bundle will be injected for all webhooks.
====

.Procedure

. Annotate the validating webhook configuration with `service.beta.openshift.io/inject-cabundle=true`:
+
[source,terminal]
----
$ oc annotate validatingwebhookconfigurations <validating_webhook_name> \//<1>
     service.beta.openshift.io/inject-cabundle=true
----
<1> Replace `<validating_webhook_name>` with the name of the validating webhook configuration to annotate.
+
For example, use the following command to annotate the validating webhook configuration `test1`:
+
[source,terminal]
----
$ oc annotate validatingwebhookconfigurations test1 service.beta.openshift.io/inject-cabundle=true
----

. View the validating webhook configuration to ensure that the service CA bundle has been injected:
+
[source,terminal]
----
$ oc get validatingwebhookconfigurations <validating_webhook_name> -o yaml
----
+
The CA bundle is displayed in the `clientConfig.caBundle` field of all webhooks in the YAML output:
+
[source,terminal]
----
apiVersion: admissionregistration.k8s.io/v1
kind: ValidatingWebhookConfiguration
metadata:
  annotations:
    service.beta.openshift.io/inject-cabundle: "true"
...
webhooks:
- myWebhook:
  - v1beta1
  clientConfig:
    caBundle: <CA_BUNDLE>
...
----
