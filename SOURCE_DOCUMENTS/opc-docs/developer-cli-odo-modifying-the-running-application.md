// Module included in the following assemblies:
//
// * cli_reference/developer_cli_odo/creating-a-multicomponent--application-with-odo.adoc

:_mod-docs-content-type: PROCEDURE
[id="modifying-the-running-application_{context}"]

= Modifying the running application

.Procedure

. Change the local directory to the front-end directory:
+
[source,terminal]
----
$ cd frontend
----

. Monitor the changes on the file system using:
+
[source,terminal]
----
$ odo watch
----

. Edit the `index.html` file to change the displayed name for the game.
+
[NOTE]
====
A slight delay is possible before {odo-title} recognizes the change.
====
+
{odo-title} pushes the changes to the front-end component and prints its status to the terminal:
+
[source,terminal]
----
File /root/frontend/index.html changed
File  changed
Pushing files...
 ✓  Waiting for component to start
 ✓  Copying files to component
 ✓  Building component
----

. Refresh the application page in the web browser. The new name is now displayed.
