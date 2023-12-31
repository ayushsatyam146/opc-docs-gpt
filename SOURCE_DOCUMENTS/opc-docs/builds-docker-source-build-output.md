// Module included in the following assemblies:
//
// * builds/managing-build-output.adoc

[id="builds-docker-source-build-output_{context}"]
= Build output

Builds that use the
ifdef::openshift-enterprise,openshift-webscale,openshift-origin[]
docker or
endif::[]
source-to-image (S2I) strategy result in the creation of a new container image. The image is then pushed to the container image registry specified in the `output` section of the `Build` specification.

If the output kind is `ImageStreamTag`, then the image will be pushed to the integrated {product-registry} and tagged in the specified imagestream. If the output is of type `DockerImage`, then the name of the output reference will be used as a docker push specification. The specification may contain a registry or will default to DockerHub if no registry is specified. If the output section of the build specification is empty, then the image will not be pushed at the end of the build.

.Output to an ImageStreamTag
[source,yaml]
----
spec:
  output:
    to:
      kind: "ImageStreamTag"
      name: "sample-image:latest"
----

.Output to a docker Push Specification
[source,yaml]
----
spec:
  output:
    to:
      kind: "DockerImage"
      name: "my-registry.mycompany.com:5000/myimages/myimage:tag"
----
