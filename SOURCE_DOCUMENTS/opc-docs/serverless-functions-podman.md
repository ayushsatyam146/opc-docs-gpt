// Module included in the following assemblies:
//
// * serverless/serverless-functions-setup.adoc

:_mod-docs-content-type: PROCEDURE
[id="serverless-functions-podman_{context}"]
= Setting up Podman

To use advanced container management features, you might want to use Podman with {FunctionsProductName}. To do so, you need to start the Podman service and configure the Knative (`kn`) CLI to connect to it.

.Procedure

// This step might no longer be needed in the future, when automatic
// podman startup is reliable.
// https://github.com/openshift/openshift-docs/pull/46660/files#r907310116
. Start the Podman service that serves the Docker API on a UNIX socket at `${XDG_RUNTIME_DIR}/podman/podman.sock`:
+
[source,terminal]
----
$ systemctl start --user podman.socket
----
+
[NOTE]
====
On most systems, this socket is located at `/run/user/$(id -u)/podman/podman.sock`.
====

. Establish the environment variable that is used to build a function:
+
[source,terminal]
----
$ export DOCKER_HOST="unix://${XDG_RUNTIME_DIR}/podman/podman.sock"
----

. Run the build command inside your function project directory with the `-v` flag to see verbose output. You should see a connection to your local UNIX socket:
+
[source,terminal]
----
$ kn func build -v
----
