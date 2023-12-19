// Automatically generated by 'openshift-apidocs-gen'. Do not edit.
:_mod-docs-content-type: ASSEMBLY
[id="snapshot-apis"]
= Snapshot APIs
:toc: macro
:toc-title:

toc::[]

== VolumeSnapshot [snapshot.storage.k8s.io/v1]

Description::
+
--
VolumeSnapshot is a user's request for either creating a point-in-time snapshot of a persistent volume, or binding to a pre-existing snapshot.
--

Type::
  `object`

== VolumeSnapshotClass [snapshot.storage.k8s.io/v1]

Description::
+
--
VolumeSnapshotClass specifies parameters that a underlying storage system uses when creating a volume snapshot. A specific VolumeSnapshotClass is used by specifying its name in a VolumeSnapshot object. VolumeSnapshotClasses are non-namespaced
--

Type::
  `object`

== VolumeSnapshotContent [snapshot.storage.k8s.io/v1]

Description::
+
--
VolumeSnapshotContent represents the actual "on-disk" snapshot object in the underlying storage system
--

Type::
  `object`
