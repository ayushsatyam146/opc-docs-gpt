// Module included in the following assemblies:
// * builds/build-strategies.adoc

:_mod-docs-content-type: PROCEDURE
[id="builds-strategy-s2i-override-builder-image-scripts_{context}"]
= Overriding source-to-image builder image scripts

You can override the `assemble`, `run`, and `save-artifacts` source-to-image (S2I) scripts provided by the builder image.

.Procedure

To override the `assemble`, `run`, and `save-artifacts` S2I scripts provided by the builder image, either:

* Provide an `assemble`, `run`, or `save-artifacts` script in the `.s2i/bin` directory of your application source repository.
* Provide a URL of a directory containing the scripts as part of the strategy definition. For example:
+
[source,yaml]
----
strategy:
  sourceStrategy:
    from:
      kind: "ImageStreamTag"
      name: "builder-image:latest"
    scripts: "http://somehost.com/scripts_directory" <1>
----
<1> This path will have `run`, `assemble`, and `save-artifacts` appended to it. If any or all scripts are found they will be used in place of the same named scripts provided in the image.

[NOTE]
====
Files located at the `scripts` URL take precedence over files located in `.s2i/bin` of the source repository.
====
