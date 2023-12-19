// Module included in the following assemblies:
//
// * installing/disconnected_install/installing-mirroring-disconnected.adoc
// * updating/updating_a_cluster/updating_disconnected_cluster/mirroring-image-repository.adoc

:_mod-docs-content-type: PROCEDURE
[id="oc-mirror-mirror-to-mirror_{context}"]
= Mirroring from mirror to mirror

You can use the oc-mirror plugin to mirror an image set directly to a target mirror registry that is accessible during image set creation.

You are required to specify a storage backend in the image set configuration file. This storage backend can be a local directory or a Docker v2 registry. The oc-mirror plugin stores metadata in this storage backend during image set creation.

[IMPORTANT]
====
Do not delete or modify the metadata that is generated by the oc-mirror plugin. You must use the same storage backend every time you run the oc-mirror plugin for the same mirror registry.
====

.Prerequisites

* You have access to the internet to obtain the necessary container images.
* You have installed the OpenShift CLI (`oc`).
* You have installed the `oc-mirror` CLI plugin.
* You have created the image set configuration file.

.Procedure

* Run the `oc mirror` command to mirror the images from the specified image set configuration to a specified registry:
+
[source,terminal]
----
$ oc mirror --config=./imageset-config.yaml \// <1>
  docker://registry.example:5000             <2>
----
<1> Pass in the image set configuration file that was created. This procedure assumes that it is named `imageset-config.yaml`.
<2> Specify the registry to mirror the image set file to. The registry must start with `docker://`. If you specify a top-level namespace for the mirror registry, you must also use this same namespace on subsequent executions.

.Verification

. Navigate into the `oc-mirror-workspace/` directory that was generated.
. Navigate into the results directory, for example, `results-1639608409/`.
. Verify that YAML files are present for the `ImageContentSourcePolicy` and `CatalogSource` resources.

[NOTE]
====
The `repositoryDigestMirrors` section of the `ImageContentSourcePolicy` YAML file is used for the `install-config.yaml` file during installation.
====
+
// TODO: Test and get some better wording/example output.

.Next steps

* Configure your cluster to use the resources generated by oc-mirror.

.Troubleshooting

* link:https://access.redhat.com/solutions/7032017[Unable to retrieve source image].