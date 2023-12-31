// Module included in the following assemblies:
//
// * storage/container_storage_interface/persistent-storage-csi-snapshots.adoc

:_mod-docs-content-type: CONCEPT
[id="persistent-storage-csi-snapshots-overview_{context}"]
= Overview of CSI volume snapshots

A _snapshot_ represents the state of the storage volume in a cluster at a particular point in time. Volume snapshots can be used to provision a new volume.

{product-title} supports Container Storage Interface (CSI) volume snapshots by default. However, a specific CSI driver is required.

With CSI volume snapshots, a cluster administrator can:

* Deploy a third-party CSI driver that supports snapshots.
* Create a new persistent volume claim (PVC) from an existing volume snapshot.
* Take a snapshot of an existing PVC.
* Restore a snapshot as a different PVC.
* Delete an existing volume snapshot.

With CSI volume snapshots, an app developer can:

* Use volume snapshots as building blocks for developing application- or cluster-level storage backup solutions.
* Rapidly rollback to a previous development version.
* Use storage more efficiently by not having to make a full copy each time.

Be aware of the following when using volume snapshots:

* Support is only available for CSI drivers. In-tree and FlexVolumes are not supported.
* {product-title} only ships with select CSI drivers. For CSI drivers that are not provided by an {product-title} Driver Operator, it is recommended to use the CSI drivers provided by
link:https://kubernetes-csi.github.io/docs/drivers.html[community or storage vendors]. Follow the installation instructions furnished by the CSI driver provider.
* CSI drivers may or may not have implemented the volume snapshot functionality. CSI drivers that have provided support for volume snapshots will likely use the `csi-external-snapshotter` sidecar. See documentation provided by the CSI driver for details.
