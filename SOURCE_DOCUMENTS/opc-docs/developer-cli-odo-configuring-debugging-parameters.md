// Module included in the following assemblies:
//
// * cli_reference/creating_and_deploying_applications_with_odo/debugging-applications-in-odo.adoc

:_mod-docs-content-type: PROCEDURE
[id="configuring-debugging-parameters_{context}"]

= Configuring debugging parameters

You can specify a remote port with `odo config` command and a local port with the `odo debug` command.

.Procedure

* To set a remote port on which the debugging agent should run, run:
+
[source,terminal]
----
$ odo config set DebugPort 9292
----
+
[NOTE]
====
You must redeploy your component for this value to be reflected on the component.
====

* To set a local port to port forward, run:
+
[source,terminal]
----
$ odo debug port-forward --local-port 9292
----
+
[NOTE]
====
The local port value does not persist. You must provide it every time you need to change the port.
====
