// Module included in the following assemblies:
//
// * operators/admin/olm-managing-custom-catalogs.adoc

ifdef::openshift-origin[]
:registry-image: quay.io/operator-framework/opm:latest
endif::[]
ifndef::openshift-origin[]
:registry-image: registry.redhat.io/openshift4/ose-operator-registry:v{product-version}
endif::[]

:_mod-docs-content-type: PROCEDURE
[id="olm-creating-fb-catalog-image_{context}"]
= Creating a file-based catalog image

You can use the `opm` CLI to create a catalog image that uses the plain text _file-based catalog_ format (JSON or YAML), which replaces the deprecated SQLite database format.

.Prerequisites

* You have installed the `opm` CLI.
* You have `podman` version 1.9.3+.
* A bundle image is built and pushed to a registry that supports link:https://docs.docker.com/registry/spec/manifest-v2-2/[Docker v2-2].

.Procedure

. Initialize the catalog:

.. Create a directory for the catalog by running the following command:
+
[source,terminal]
----
$ mkdir <catalog_dir>
----

.. Generate a Dockerfile that can build a catalog image by running the `opm generate dockerfile` command:
+
[source,terminal,subs="attributes+"]
----
ifdef::openshift-origin[]
$ opm generate dockerfile <catalog_dir>
endif::[]
ifndef::openshift-origin[]
$ opm generate dockerfile <catalog_dir> \
    -i {registry-image} <1>
endif::[]
----
ifndef::openshift-origin[]
<1> Specify the official Red Hat base image by using the `-i` flag, otherwise the Dockerfile uses the default upstream image.
endif::[]
+
The Dockerfile must be in the same parent directory as the catalog directory that you created in the previous step:
+
.Example directory structure
[source,terminal]
----
. <1>
├── <catalog_dir> <2>
└── <catalog_dir>.Dockerfile <3>
----
<1> Parent directory
<2> Catalog directory
<3> Dockerfile generated by the `opm generate dockerfile` command

.. Populate the catalog with the package definition for your Operator by running the `opm init` command:
+
[source,terminal]
----
$ opm init <operator_name> \ <1>
    --default-channel=preview \ <2>
    --description=./README.md \ <3>
    --icon=./operator-icon.svg \ <4>
    --output yaml \ <5>
    > <catalog_dir>/index.yaml <6>
----
<1> Operator, or package, name
<2> Channel that subscriptions default to if unspecified
<3> Path to the Operator's `README.md` or other documentation
<4> Path to the Operator's icon
<5> Output format: JSON or YAML
<6> Path for creating the catalog configuration file
+
This command generates an `olm.package` declarative config blob in the specified catalog configuration file.

. Add a bundle to the catalog by running the `opm render` command:
+
[source,terminal]
----
$ opm render <registry>/<namespace>/<bundle_image_name>:<tag> \ <1>
    --output=yaml \
    >> <catalog_dir>/index.yaml <2>
----
<1> Pull spec for the bundle image
<2> Path to the catalog configuration file
+
[NOTE]
====
Channels must contain at least one bundle.
====

. Add a channel entry for the bundle. For example, modify the following example to your specifications, and add it to your `<catalog_dir>/index.yaml` file:
+
.Example channel entry
[source,yaml]
----
---
schema: olm.channel
package: <operator_name>
name: preview
entries:
  - name: <operator_name>.v0.1.0 <1>
----
<1> Ensure that you include the period (`.`) after `<operator_name>` but before the `v` in the version. Otherwise, the entry fails to pass the `opm validate` command.

. Validate the file-based catalog:

.. Run the `opm validate` command against the catalog directory:
+
[source,terminal]
----
$ opm validate <catalog_dir>
----

.. Check that the error code is `0`:
+
[source,terminal]
----
$ echo $?
----
+
.Example output
[source,terminal]
----
0
----

. Build the catalog image by running the `podman build` command:
+
[source,terminal]
----
$ podman build . \
    -f <catalog_dir>.Dockerfile \
    -t <registry>/<namespace>/<catalog_image_name>:<tag>
----

. Push the catalog image to a registry:

.. If required, authenticate with your target registry by running the `podman login` command:
+
[source,terminal]
----
$ podman login <registry>
----

.. Push the catalog image by running the `podman push` command:
+
[source,terminal]
----
$ podman push <registry>/<namespace>/<catalog_image_name>:<tag>
----

:!registry-image: