// Module included in the following assemblies:
// * builds/build-strategies.adoc

:_mod-docs-content-type: PROCEDURE
[id="builds-strategy-docker-from-image_{context}"]
= Replacing Dockerfile FROM image

You can replace the `FROM` instruction of the Dockerfile with the `from` of the `BuildConfig` object. If the Dockerfile uses multi-stage builds, the image in the last `FROM` instruction will be replaced.

.Procedure

To replace the `FROM` instruction of the Dockerfile with the `from` of the `BuildConfig`.

[source,yaml]
----
strategy:
  dockerStrategy:
    from:
      kind: "ImageStreamTag"
      name: "debian:latest"
----
