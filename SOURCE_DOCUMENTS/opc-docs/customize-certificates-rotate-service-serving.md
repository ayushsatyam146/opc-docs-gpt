// Module included in the following assemblies:
//
// * security/certificates/service-serving-certificate.adoc

:_mod-docs-content-type: PROCEDURE
[id="rotate-service-serving_{context}"]
= Manually rotate the generated service certificate

You can rotate the service certificate by deleting the
associated secret. Deleting the secret results in a new one
being automatically created, resulting in a new certificate.

.Prerequisites

* A secret containing the certificate and key pair must
have been generated for the service.

.Procedure

. Examine the service to determine the secret containing the
certificate. This is found in the `serving-cert-secret-name`
annotation, as seen below.
+
[source,terminal]
----
$ oc describe service <service_name>
----
+
.Example output
[source,terminal]
----
...
service.beta.openshift.io/serving-cert-secret-name: <secret>
...
----

. Delete the generated secret for the service. This process
will automatically recreate the secret.
+
[source,terminal]
----
$ oc delete secret <secret> //<1>
----
<1> Replace `<secret>` with the name of the secret from the previous
step.

. Confirm that the certificate has been recreated
by obtaining the new secret and examining the `AGE`.
+
[source,terminal]
----
$ oc get secret <service_name>
----
+
.Example output
[source,terminal]
----
NAME              TYPE                DATA   AGE
<service.name>    kubernetes.io/tls   2      1s
----
