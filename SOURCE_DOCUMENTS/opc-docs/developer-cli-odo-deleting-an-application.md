// Module included in the following assemblies:
//
// * cli_reference/developer_cli_odo/creating_and_deploying_applications_with_odo/creating-a-single-component-application-with-odo.adoc
// * cli_reference/developer_cli_odo/creating_and_deploying_applications_with_odo/creating-an-application-with-a-database.adoc
// * cli_reference/developer_cli_odo/creating_and_deploying_applications_with_odo/creating-a-multicomponent-application-with-odo.adoc

:_mod-docs-content-type: PROCEDURE
[id="deleting-an-application_{context}"]
= Deleting an application

Use the `odo app delete` command to delete your application.

.Procedure

. List the applications in the current project:
+
[source,terminal]
----
$ odo app list
----
+
.Example output
[source,terminal]
----
    The project '<project_name>' has the following applications:
    NAME
    app
----

. List the components associated with the applications. These components will be deleted with the application:
+
[source,terminal]
----
$ odo component list
----
+
.Example output
[source,terminal]
----
    APP     NAME                      TYPE       SOURCE        STATE
    app     nodejs-nodejs-ex-elyf     nodejs     file://./     Pushed
----

. Delete the application:
+
[source,terminal]
----
$ odo app delete <application_name>
----
+
.Example output
[source,terminal]
----
    ? Are you sure you want to delete the application: <application_name> from project: <project_name>
----
. Confirm the deletion with `Y`. You can suppress the confirmation prompt using the `-f` flag.
