// Module included in the following assemblies:
//
// * builds/creating-build-inputs.adoc

[id="builds-docker-strategy_{context}"]
= Docker strategy

When using a docker strategy, you can add all defined input secrets into your container image using the link:https://docs.docker.com/engine/reference/builder/#add[`ADD`] and link:https://docs.docker.com/engine/reference/builder/#copy[`COPY` instructions] in your Dockerfile.

If you do not specify the `destinationDir` for a secret, then the files are copied into the same directory in which the Dockerfile is located. If you specify a relative path as `destinationDir`, then the secrets are copied into that directory, relative to your Dockerfile location. This makes the secret files available to the Docker build operation as part of the context directory used during the build.

.Example of a Dockerfile referencing secret and config map data
----
FROM centos/ruby-22-centos7

USER root
COPY ./secret-dir /secrets
COPY ./config /

# Create a shell script that will output secrets and ConfigMaps when the image is run
RUN echo '#!/bin/sh' > /input_report.sh
RUN echo '(test -f /secrets/secret1 && echo -n "secret1=" && cat /secrets/secret1)' >> /input_report.sh
RUN echo '(test -f /config && echo -n "relative-configMap=" && cat /config)' >> /input_report.sh
RUN chmod 755 /input_report.sh

CMD ["/bin/sh", "-c", "/input_report.sh"]
----

[IMPORTANT]
====
Users normally remove their input secrets from the final application image so that the secrets are not present in the container running from that image. However, the secrets still exist in the image itself in the layer where they were added. This removal is part of the Dockerfile itself.

To prevent the contents of input secrets and config maps from appearing in the build output container images and avoid this removal process altogether, xref:../../cicd/builds/build-strategies.adoc#builds-using-build-volumes_build-strategies-docker[use build volumes] in your Docker build strategy instead.
====
