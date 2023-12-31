// Module included in the following assemblies:
//
// * serverless/functions/serverless-functions-accessing-secrets-configmaps.adoc

:_mod-docs-content-type: PROCEDURE
[id="serverless-functions-mounting-secret-as-volume_{context}"]
= Mounting a secret as a volume

You can mount a secret as a volume. Once a secret is mounted, you can access it from the function as a regular file. This enables you to store on the cluster data needed by the function, for example, a list of URIs that need to be accessed by the function.

.Prerequisites

* The {ServerlessOperatorName} and Knative Serving are installed on the cluster.
* You have installed the Knative (`kn`) CLI.
* You have created a function.

.Procedure

. Open the `func.yaml` file for your function.

. For each secret you want to mount as a volume, add the following YAML to the `volumes` section:
+
[source,yaml]
----
name: test
namespace: ""
runtime: go
...
volumes:
- secret: mysecret
  path: /workspace/secret
----
+
* Substitute `mysecret` with the name of the target secret.
* Substitute `/workspace/secret` with the path where you want to mount the secret.
+
For example, to mount the `addresses` secret, use the following YAML:
+
[source,yaml]
----
name: test
namespace: ""
runtime: go
...
volumes:
- configMap: addresses
  path: /workspace/secret-addresses
----

. Save the configuration.
