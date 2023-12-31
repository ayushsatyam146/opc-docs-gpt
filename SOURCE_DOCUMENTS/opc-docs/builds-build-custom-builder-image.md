// Module included in the following assemblies:
//
// * builds/custom-builds-buildah.adoc


:_mod-docs-content-type: PROCEDURE
[id="builds-build-custom-builder-image_{context}"]
= Build custom builder image

You can use {product-title} to build and push custom builder images to use in a custom strategy.

.Prerequisites

* Define all the inputs that will go into creating your new custom builder image.

.Procedure

. Define a `BuildConfig` object that will build your custom builder image:
+
[source,terminal]
----
$ oc new-build --binary --strategy=docker --name custom-builder-image
----

. From the directory in which you created your custom build image, run the build:
+
[source,terminal]
----
$ oc start-build custom-builder-image --from-dir . -F
----
+
After the build completes, your new custom builder image is available in your project in an image stream tag that is named `custom-builder-image:latest`.
