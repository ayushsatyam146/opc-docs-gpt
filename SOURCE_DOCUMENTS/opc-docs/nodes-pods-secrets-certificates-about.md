// Module included in the following assemblies:
//
// * nodes/nodes-pods-secrets.adoc

:_mod-docs-content-type: CONCEPT
[id="nodes-pods-secrets-certificates-about_{context}"]
= About using signed certificates with secrets

To secure communication to your service, you can configure {product-title} to generate a signed
serving certificate/key pair that you can add into a secret in a project.

A _service serving certificate secret_ is intended to support complex middleware
applications that need out-of-the-box certificates. It has the same settings as
the server certificates generated by the administrator tooling for nodes and
masters.

.Service `Pod` spec configured for a service serving certificates secret.

[source,yaml]
----
apiVersion: v1
kind: Service
metadata:
  name: registry
  annotations:
    service.beta.openshift.io/serving-cert-secret-name: registry-cert<1>
# ...
----
<1> Specify the name for the certificate

Other pods can trust cluster-created certificates (which are only signed for
internal DNS names), by using the CA bundle in the
*_/var/run/secrets/kubernetes.io/serviceaccount/service-ca.crt_* file that is
automatically mounted in their pod.

The signature algorithm for this feature is `x509.SHA256WithRSA`. To manually
rotate, delete the generated secret. A new certificate is created.
