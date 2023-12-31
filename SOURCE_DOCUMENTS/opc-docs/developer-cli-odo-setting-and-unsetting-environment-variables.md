// Module included in the following assemblies:
//
// * cli_reference/developer_cli_odo/managing-environment-variables-in-odo.adoc

:_mod-docs-content-type: PROCEDURE
[id="setting-and-unsetting-environment-variables._{context}"]

= Setting and unsetting environment variables

.Procedure

* To set an environment variable in a component:
+
[source,terminal]
----
$ odo config set --env <variable>=<value>
----

* To unset an environment variable in a component:
+
[source,terminal]
----
$ odo config unset --env <variable>
----

* To list all environment variables in a component:
+
[source,terminal]
----
$ odo config view
----
