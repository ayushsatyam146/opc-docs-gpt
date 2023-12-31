// Module included in the following assemblies:
//
// * storage/container_storage_interface/persistent-storage-csi-snapshots.adoc

:_mod-docs-content-type: CONCEPT
[id="persistent-storage-csi-snapshots-operator_{context}"]
= About the CSI Snapshot Controller Operator

The CSI Snapshot Controller Operator runs in the `openshift-cluster-storage-operator` namespace. It is installed by the Cluster Version Operator (CVO) in all clusters by default.

The CSI Snapshot Controller Operator installs the CSI snapshot controller, which runs in the `openshift-cluster-storage-operator` namespace.

== Volume snapshot CRDs

During {product-title} installation, the CSI Snapshot Controller Operator creates the following snapshot custom resource definitions (CRDs) in the `snapshot.storage.k8s.io/v1` API group:

`VolumeSnapshotContent`::

A snapshot taken of a volume in the cluster that has been provisioned by a cluster administrator.
+
Similar to the `PersistentVolume` object, the `VolumeSnapshotContent` CRD is a cluster resource that points to a real snapshot in the storage back end.
+
For manually pre-provisioned snapshots, a cluster administrator creates a number of `VolumeSnapshotContent` CRDs. These carry the details of the real volume snapshot in the storage system.
+
The `VolumeSnapshotContent` CRD is not namespaced and is for use by a cluster administrator.

`VolumeSnapshot`::

Similar to the `PersistentVolumeClaim` object, the `VolumeSnapshot` CRD defines a developer request for a snapshot. The CSI Snapshot Controller Operator runs the CSI snapshot controller, which handles the binding of a `VolumeSnapshot` CRD with an appropriate `VolumeSnapshotContent` CRD. The binding is a one-to-one mapping.
+
The `VolumeSnapshot` CRD is namespaced. A developer uses the CRD as a distinct request for a snapshot.

`VolumeSnapshotClass`::

Allows a cluster administrator to specify different attributes belonging to a `VolumeSnapshot` object. These attributes may differ among snapshots taken of the same volume on the storage system, in which case they would not be expressed by using the same storage class of a persistent volume claim.
+
The `VolumeSnapshotClass` CRD defines the parameters for the `csi-external-snapshotter` sidecar to use when creating a snapshot. This allows the storage back end to know what kind of snapshot to dynamically create if multiple options are supported.
+
Dynamically provisioned snapshots use the `VolumeSnapshotClass` CRD to specify storage-provider-specific parameters to use when creating a snapshot.
+
The `VolumeSnapshotContentClass` CRD is not namespaced and is for use by a cluster administrator to enable global configuration options for their storage back end.
