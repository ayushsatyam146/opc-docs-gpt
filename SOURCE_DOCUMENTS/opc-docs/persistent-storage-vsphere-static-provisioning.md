// Module included in the following assemblies:
//
// * storage/persistent_storage/persistent-storage-vsphere.adoc

:_mod-docs-content-type: PROCEDURE
[id="vsphere-static-provisioning_{context}"]
= Statically provisioning VMware vSphere volumes

To statically provision VMware vSphere volumes you must create the virtual machine disks for reference by the persistent volume framework.

.Prerequisites

* Storage must exist in the underlying infrastructure before it can be mounted as a volume in {product-title}.

.Procedure

. Create the virtual machine disks. Virtual machine disks (VMDKs) must be created manually before statically provisioning VMware vSphere volumes. Use either of the following methods:

  * Create using `vmkfstools`. Access ESX through Secure Shell (SSH) and then use following command to create a VMDK volume:
+
[source,terminal]
----
$ vmkfstools -c <size> /vmfs/volumes/<datastore-name>/volumes/<disk-name>.vmdk
----

  * Create using `vmware-diskmanager`:
+
[source,terminal]
----
$ shell vmware-vdiskmanager -c -t 0 -s <size> -a lsilogic <disk-name>.vmdk
----

. Create a persistent volume that references the VMDKs. Create a file, `pv1.yaml`, with the `PersistentVolume` object definition:
+
[source,yaml]
----
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv1 <1>
spec:
  capacity:
    storage: 1Gi <2>
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  vsphereVolume: <3>
    volumePath: "[datastore1] volumes/myDisk"  <4>
    fsType: ext4  <5>
----
<1> The name of the volume. This name is how it is identified by persistent volume claims or pods.
<2> The amount of storage allocated to this volume.
<3> The volume type used, with `vsphereVolume` for vSphere volumes. The label is used to mount a vSphere VMDK volume into pods. The contents of a volume are preserved when it is unmounted. The volume type supports VMFS and VSAN datastore.
<4> The existing VMDK volume to use. If you used `vmkfstools`, you must enclose the datastore name in square brackets, `[]`, in the volume definition, as shown previously.
<5> The file system type to mount. For example, ext4, xfs, or other file systems.
+
[IMPORTANT]
====
Changing the value of the fsType parameter after the volume is formatted and provisioned can result in data loss and pod failure.
====

. Create the `PersistentVolume` object from the file:
+
[source,terminal]
----
$ oc create -f pv1.yaml
----

. Create a persistent volume claim that maps to the persistent volume you created in the previous step.  Create a file, `pvc1.yaml`, with the `PersistentVolumeClaim` object definition:
+
[source,yaml]
----
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc1 <1>
spec:
  accessModes:
    - ReadWriteOnce <2>
  resources:
   requests:
     storage: "1Gi" <3>
  volumeName: pv1 <4>
----
<1> A unique name that represents the persistent volume claim.
<2> The access mode of the persistent volume claim. With ReadWriteOnce, the volume can be mounted with read and write permissions by a single node.
<3> The size of the persistent volume claim.
<4> The name of the existing persistent volume.

. Create the `PersistentVolumeClaim` object from the file:
+
[source,terminal]
----
$ oc create -f pvc1.yaml
----
