// Module included in the following assemblies:
//
// * security/file_integrity_operator/file-integrity-operator-configuring.adoc

:_mod-docs-content-type: PROCEDURE
[id="file-integrity-examine-default-config_{context}"]
= Examine the default configuration

The default File Integrity Operator configuration is stored in a config map with
the same name as the `FileIntegrity` CR.

.Procedure

* To examine the default config, run:
+
[source,terminal]
----
$ oc describe cm/worker-fileintegrity
----
