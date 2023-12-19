// Module included in the following assemblies:
//
// * installing/disconnected_install/installing-mirroring-disconnected.adoc
// * updating/updating_a_cluster/updating_disconnected_cluster/mirroring-image-repository.adoc

:_mod-docs-content-type: REFERENCE
[id="oc-mirror-command-reference_{context}"]
= Command reference for oc-mirror

The following tables describe the `oc mirror` subcommands and flags:

.oc mirror subcommands
[cols="1,2",options="header"]
|===
|Subcommand
|Description

|`completion`
|Generate the autocompletion script for the specified shell.

|`describe`
|Output the contents of an image set.

|`help`
|Show help about any subcommand.

|`init`
|Output an initial image set configuration template.

|`list`
|List available platform and Operator content and their version.

|`version`
|Output the oc-mirror version.

|===

.oc mirror flags
[cols="1,2",options="header"]
|===
|Flag
|Description

|`-c`, `--config` `<string>`
|Specify the path to an image set configuration file.

|`--continue-on-error`
|If any non image-pull related error occurs, continue and attempt to mirror as much as possible.

|`--dest-skip-tls`
|Disable TLS validation for the target registry.

|`--dest-use-http`
|Use plain HTTP for the target registry.

|`--dry-run`
|Print actions without mirroring images. Generates `mapping.txt` and `pruning-plan.json` files.

|`--from <string>`
|Specify the path to an image set archive that was generated by an execution of oc-mirror to load into a target registry.

|`-h`, `--help`
|Show the help.

|`--ignore-history`
|Ignore past mirrors when downloading images and packing layers. Disables incremental mirroring and might download more data.

|`--manifests-only`
|Generate manifests for `ImageContentSourcePolicy` objects to configure a cluster to use the mirror registry, but do not actually mirror any images. To use this flag, you must pass in an image set archive with the `--from` flag.

|`--max-nested-paths <int>`
|Specify the maximum number of nested paths for destination registries that limit nested paths. The default is `0`.

|`--max-per-registry <int>`
|Specify the number of concurrent requests allowed per registry. The default is `6`.

|`--oci-insecure-signature-policy`
|Do not push signatures when mirroring local OCI catalogs (with `--include-local-oci-catalogs`).

|`--oci-registries-config`
|Provide a registries configuration file to specify an alternative registry location to copy from when mirroring local OCI catalogs (with `--include-local-oci-catalogs`).

|`--skip-cleanup`
|Skip removal of artifact directories.

|`--skip-image-pin`
|Do not replace image tags with digest pins in Operator catalogs.

|`--skip-metadata-check`
|Skip metadata when publishing an image set. This is only recommended when the image set was created with `--ignore-history`.

|`--skip-missing`
|If an image is not found, skip it instead of reporting an error and aborting execution. Does not apply to custom images explicitly specified in the image set configuration.

|`--skip-pruning`
|Disable automatic pruning of images from the target mirror registry.

|`--skip-verification`
|Skip digest verification.

|`--source-skip-tls`
|Disable TLS validation for the source registry.

|`--source-use-http`
|Use plain HTTP for the source registry.

|`-v`, `--verbose` `<int>`
|Specify the number for the log level verbosity. Valid values are `0` - `9`. The default is `0`.

|===