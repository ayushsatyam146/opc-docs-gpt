// Module included in the following assemblies:
//
// *cli_reference/developer_cli_odo/creating_and_deploying_applications_with_odo/creating-a-single-component-application-with-odo.adoc
// *cli_reference/developer_cli_odo/creating_and_deploying_applications_with_odo/working-with-storage.adoc

:_mod-docs-content-type: PROCEDURE
[id="adding-storage-to-the-application-components_{context}"]
= Adding storage to the application components

Use the `odo storage` command to add persistent data to your application. Examples of data that must persist include database files, dependencies, and build artifacts, such as a `.m2` Maven directory.

.Procedure

. Add the storage to your component:
+
[source,terminal]
----
$ odo storage create <storage_name> --path=<path_to_the_directory> --size=<size>
----

. Push the storage to the cluster:
+
[source,terminal]
----
$ odo push
----

. Verify that the storage is now attached to your component by listing all storage in the component:
+
[source,terminal]
----
$ odo storage list
----
+
.Example output
+
[source,terminal]
----
The component 'nodejs' has the following storage attached:
NAME           SIZE     PATH      STATE
mystorage      1Gi      /data     Pushed
----

. Delete the storage from your component:
+
[source,terminal]
----
$ odo storage delete <storage_name>
----

. List all storage to verify that the storage state is `Locally Deleted`:
+
[source,terminal]
----
$ odo storage list
----
+
.Example output
+
[source,terminal]
----
The component 'nodejs' has the following storage attached:
NAME           SIZE     PATH      STATE
mystorage      1Gi      /data     Locally Deleted
----

. Push the changes to the cluster:
+
[source,terminal]
----
$ odo push
----
