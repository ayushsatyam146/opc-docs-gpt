// Module included in the following assemblies:
//
// * serverless/serverless-support.adoc

:_mod-docs-content-type: PROCEDURE
[id="serverless-about-collecting-data_{context}"]
= About collecting {ServerlessProductName} data

You can use the `oc adm must-gather` CLI command to collect information about your cluster, including features and objects associated with {ServerlessProductName}. To collect {ServerlessProductName} data with `must-gather`, you must specify the {ServerlessProductName} image and the image tag for your installed version of {ServerlessProductName}.

.Prerequisites

* Install the OpenShift CLI (`oc`).

.Procedure

* Collect data by using the `oc adm must-gather` command:
+
[source,terminal]
----
$ oc adm must-gather --image=registry.redhat.io/openshift-serverless-1/svls-must-gather-rhel8:<image_version_tag>
----
+
.Example command
[source,terminal]
----
$ oc adm must-gather --image=registry.redhat.io/openshift-serverless-1/svls-must-gather-rhel8:1.14.0
----
