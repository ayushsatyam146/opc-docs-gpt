// Module included in the following assemblies:
//
// * web_console/customizing-the-web-console.adoc

:_mod-docs-content-type: PROCEDURE
[id="adding-yaml-examples-to-kube-resources_{context}"]
= Adding YAML examples to Kubernetes resources

You can dynamically add YAML examples to any Kubernetes resources at any time.

.Prerequisites

* You must have cluster administrator privileges.

.Procedure

. From *Administration* -> *Custom Resource Definitions*, click on *ConsoleYAMLSample*.

. Click *YAML* and edit the file:
+
[source,yaml]
----
apiVersion: console.openshift.io/v1
kind: ConsoleYAMLSample
metadata:
  name: example
spec:
  targetResource:
    apiVersion: batch/v1
    kind: Job
  title: Example Job
  description: An example Job YAML sample
  yaml: |
    apiVersion: batch/v1
    kind: Job
    metadata:
      name: countdown
    spec:
      template:
        metadata:
          name: countdown
        spec:
          containers:
          - name: counter
            image: centos:7
            command:
            - "bin/bash"
            - "-c"
            - "for i in 9 8 7 6 5 4 3 2 1 ; do echo $i ; done"
          restartPolicy: Never
----
Use `spec.snippet` to indicate that the YAML sample is not the full YAML resource
definition, but a fragment that can be inserted into the existing YAML document
at the user's cursor.

. Click *Save*.
