// Module included in the following assemblies:
//
// * security/file_integrity_operator/file-integrity-operator-advanced-usage.adoc

:_mod-docs-content-type: PROCEDURE
[id="file-integrity-operator-reinitializing-database_{context}"]
= Reinitializing the database

If the File Integrity Operator detects a change that was planned, it might be required to reinitialize the database.

.Procedure

* Annotate the `FileIntegrity` custom resource (CR) with `file-integrity.openshift.io/re-init`:
+
[source,terminal]
----
$ oc annotate fileintegrities/worker-fileintegrity file-integrity.openshift.io/re-init=
----
+
The old database and log files are backed up and a new database is initialized. The old database and logs are retained on the nodes under `/etc/kubernetes`, as
seen in the following output from a pod spawned using `oc debug`:
+
.Example output
[source,terminal]
----
 ls -lR /host/etc/kubernetes/aide.*
-rw-------. 1 root root 1839782 Sep 17 15:08 /host/etc/kubernetes/aide.db.gz
-rw-------. 1 root root 1839783 Sep 17 14:30 /host/etc/kubernetes/aide.db.gz.backup-20200917T15_07_38
-rw-------. 1 root root   73728 Sep 17 15:07 /host/etc/kubernetes/aide.db.gz.backup-20200917T15_07_55
-rw-r--r--. 1 root root       0 Sep 17 15:08 /host/etc/kubernetes/aide.log
-rw-------. 1 root root     613 Sep 17 15:07 /host/etc/kubernetes/aide.log.backup-20200917T15_07_38
-rw-r--r--. 1 root root       0 Sep 17 15:07 /host/etc/kubernetes/aide.log.backup-20200917T15_07_55
----
+
To provide some permanence of record, the resulting config maps are not owned by the `FileIntegrity` object, so manual cleanup is necessary. As a
result, any previous integrity failures would still be visible in the `FileIntegrityNodeStatus` object.
