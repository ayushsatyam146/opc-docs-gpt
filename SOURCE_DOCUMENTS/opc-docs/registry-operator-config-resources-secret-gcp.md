// Module included in the following assemblies:
//
// * registry/configuring_registry_storage-gcp-user-infrastructure.adoc

:_mod-docs-content-type: PROCEDURE
[id="registry-operator-config-resources-secret-gcp_{context}"]
= Configuring a secret for the Image Registry Operator

In addition to the `configs.imageregistry.operator.openshift.io` and ConfigMap
resources, configuration is provided to the Operator by a separate secret
resource located within the `openshift-image-registry` namespace.

The `image-registry-private-configuration-user` secret provides
credentials needed for storage access and management. It overrides the default
credentials used by the Operator, if default credentials were found.

For GCS on GCP storage, the secret is expected to contain one key whose value is the
contents of a credentials file provided by GCP:

* `REGISTRY_STORAGE_GCS_KEYFILE`

.Procedure

* Create an {product-title} secret that contains the required keys.
+
[source,terminal]
----
$ oc create secret generic image-registry-private-configuration-user --from-file=REGISTRY_STORAGE_GCS_KEYFILE=<path_to_keyfile> --namespace openshift-image-registry
----


// Undefine the attribute to catch any errors at the end
:!KEY1:
