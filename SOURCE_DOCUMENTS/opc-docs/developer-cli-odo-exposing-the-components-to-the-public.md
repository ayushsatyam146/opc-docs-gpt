// Module included in the following assemblies:
//
// * cli_reference/developer_cli_odo/creating-a-multicomponent-application-with-odo.adoc

:_mod-docs-content-type: PROCEDURE
[id="exposing-the-components-to-the-public_{context}"]

= Exposing components to the public

.Procedure

. Navigate to the `frontend` directory:
+
[source,terminal]
----
$ cd frontend
----

. Create an external URL for the application:
+
[source,terminal]
----
$ odo url create frontend --port 8080
----
+
.Example output
[source,terminal]
----
 ✓  URL frontend created for component: frontend

To create URL on the OpenShift  cluster, use `odo push`
----

. Apply the changes:
+
[source,terminal]
----
$ odo push
----
+
.Example output
[source,terminal]
----
Validation
 ✓  Checking component [21ms]

Configuration changes
 ✓  Retrieving component data [35ms]
 ✓  Applying configuration [29ms]

Applying URL changes
 ✓  URL frontend: http://frontend-app-myproject.192.168.42.79.nip.io created

Pushing to component frontend of type local
 ✓  Checking file changes for pushing [1ms]
 ✓  No file changes detected, skipping build. Use the '-f' flag to force the build.
----

. Open the URL in a browser to view the application.

[NOTE]
====
If an application requires permissions to the active service account to access the {product-title} namespace and delete active pods, the following error may occur when looking at `odo log` from the back-end component:

`Message: Forbidden!Configured service account doesn't have access. Service account may have been revoked`

To resolve this error, add permissions for the service account role:

[source,terminal]
----
$ oc policy add-role-to-group view system:serviceaccounts -n <project>
----

[source,terminal]
----
$ oc policy add-role-to-group edit system:serviceaccounts -n <project>
----

Do not do this on a production cluster.
====
