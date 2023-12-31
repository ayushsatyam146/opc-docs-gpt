// Module included in the following assemblies:
//
//* builds/build-strategies.adoc

:_mod-docs-content-type: PROCEDURE
[id="builds-strategy-custom-environment-variables_{context}"]
= Using environment variables for custom builds

To make environment variables available to the custom build process, you can add environment variables to the `customStrategy` definition of the build configuration.

The environment variables defined there are passed to the pod that runs the
custom build.

.Procedure

. Define a custom HTTP proxy to be used during build:
+
[source,yaml]
----
customStrategy:
...
  env:
    - name: "HTTP_PROXY"
      value: "http://myproxy.net:5187/"
----
+
. To manage environment variables defined in the build configuration, enter the following command:
+
[source,terminal]
----
$ oc set env <enter_variables>
----
