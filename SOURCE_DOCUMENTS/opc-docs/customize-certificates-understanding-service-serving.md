// Module included in the following assemblies:
//
// * security/certificates/service-serving-certificate.adoc

:_mod-docs-content-type: CONCEPT
[id="understanding-service-serving_{context}"]
= Understanding service serving certificates

Service serving certificates are intended to support complex
middleware applications that require encryption. These certificates are
issued as TLS web server certificates.

The `service-ca` controller uses the `x509.SHA256WithRSA` signature
algorithm to generate service certificates.

The generated certificate and key are in PEM format, stored in `tls.crt`
and `tls.key` respectively, within a created secret. The
certificate and key are automatically replaced when they get close to
expiration.

The service CA certificate, which issues the service certificates, is valid for 26 months and is automatically rotated when there is less than 13 months validity left. After rotation, the previous service CA configuration is still trusted until its expiration. This allows a grace period for all affected services to refresh their key material before the expiration. If you do not upgrade your cluster during this grace period, which restarts services and refreshes their key material, you might need to manually restart services to avoid failures after the previous service CA expires.

[NOTE]
====
You can use the following command to manually restart all pods in the cluster. Be aware that running this command causes a service interruption, because it deletes every running pod in every namespace. These pods will automatically restart after they are deleted.

[source,terminal]
----
$ for I in $(oc get ns -o jsonpath='{range .items[*]} {.metadata.name}{"\n"} {end}'); \
      do oc delete pods --all -n $I; \
      sleep 1; \
      done
----
====
