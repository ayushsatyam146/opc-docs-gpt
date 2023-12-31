// Module included in the following assemblies:
//
// * security/file_integrity_operator/file-integrity-operator-understanding.adoc

:_mod-docs-content-type: PROCEDURE
[id="checking-the-file-integrity-CR-status_{context}"]
= Checking the FileIntegrity custom resource status

The `FileIntegrity` custom resource (CR) reports its status through the .`status.phase` subresource.

.Procedure

* To query the `FileIntegrity` CR status, run:
+
[source,terminal]
----
$ oc get fileintegrities/worker-fileintegrity  -o jsonpath="{ .status.phase }"
----
+
.Example output
[source,terminal]
----
Active
----
