// Module included in the following assemblies:
//
//* builds/running-entitled-builds.adoc

:_mod-docs-content-type: PROCEDURE
[id="builds-create-imagestreamtag_{context}"]
= Creating an image stream tag for the Red Hat Universal Base Image

To use Red Hat subscriptions within a build, you create an image stream tag to reference the Universal Base Image (UBI).

To make the UBI available *in every project* in the cluster, you add the image stream tag to the `openshift` namespace. Otherwise, to make it available *in a specific project*, you add the image stream tag to that project.

The benefit of using image stream tags this way is that doing so grants access to the UBI based on the `registry.redhat.io` credentials in the install pull secret without exposing the pull secret to other users. This is more convenient than requiring each developer to install pull secrets with `registry.redhat.io` credentials in each project.

.Procedure

* To create an `ImageStreamTag` in the `openshift` namespace, so it is available to developers in all projects, enter:
+
[source,terminal]
----
$ oc tag --source=docker registry.redhat.io/ubi9/ubi:latest ubi:latest -n openshift
----
+
[TIP]
====
You can alternatively apply the following YAML to create an `ImageStreamTag` in the `openshift` namespace:
[source,yaml]
----
apiVersion: image.openshift.io/v1
kind: ImageStream
metadata:
  name: ubi
  namespace: openshift
spec:
  tags:
  - from:
      kind: DockerImage
      name: registry.redhat.io/ubi9/ubi:latest
    name: latest
    referencePolicy:
      type: Source
----
====

* To create an `ImageStreamTag` in a single project, enter:
+
[source,terminal]
----
$ oc tag --source=docker registry.redhat.io/ubi9/ubi:latest ubi:latest
----
+
[TIP]
====
You can alternatively apply the following YAML to create an `ImageStreamTag` in a single project:
[source,yaml]
----
apiVersion: image.openshift.io/v1
kind: ImageStream
metadata:
  name: ubi
spec:
  tags:
  - from:
      kind: DockerImage
      name: registry.redhat.io/ubi9/ubi:latest
    name: latest
    referencePolicy:
      type: Source
----
====
