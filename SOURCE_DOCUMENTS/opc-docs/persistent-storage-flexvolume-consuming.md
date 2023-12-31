// Module included in the following assemblies:
//
// storage/persistent_storage/persistent-storage-flexvolume.adoc

:_mod-docs-content-type: PROCEDURE
[id="flexvolume-driver-consuming_{context}"]
= Consuming storage using FlexVolume drivers

Each `PersistentVolume` object in {product-title} represents one storage asset in the storage back-end, such as a volume.

.Procedure
* Use the `PersistentVolume` object to reference the installed storage.

.Persistent volume object definition using FlexVolume drivers example
[source,yaml]
----
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv0001 <1>
spec:
  capacity:
    storage: 1Gi <2>
  accessModes:
    - ReadWriteOnce
  flexVolume:
    driver: openshift.com/foo <3>
    fsType: "ext4" <4>
    secretRef: foo-secret <5>
    readOnly: true <6>
    options: <7>
      fooServer: 192.168.0.1:1234
      fooVolumeName: bar
----
<1> The name of the volume. This is how it is identified through persistent volume claims or from pods. This name can be different from the name of the volume on
back-end storage.
<2> The amount of storage allocated to this volume.
<3> The name of the driver. This field is mandatory.
<4> The file system that is present on the volume. This field is optional.
<5> The reference to a secret. Keys and values from this secret are
provided to the FlexVolume driver on invocation. This field is optional.
<6> The read-only flag. This field is optional.
<7> The additional options for the FlexVolume driver. In addition to the flags specified by the user in the `options` field, the following flags are also passed to the executable:

 "fsType":"<FS type>",
 "readwrite":"<rw>",
 "secret/key1":"<secret1>"
 ...
 "secret/keyN":"<secretN>"

[NOTE]
====
Secrets are passed only to mount or unmount call-outs.
====
