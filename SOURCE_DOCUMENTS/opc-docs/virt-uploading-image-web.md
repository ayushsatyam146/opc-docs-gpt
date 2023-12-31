// Module included in the following assemblies:
//
// * virt/virtual_machines/virtual_disks/virt-uploading-local-disk-images-web.adoc

:_mod-docs-content-type: PROCEDURE
[id="virt-uploading-image-web_{context}"]
= Uploading an image file using the web console

Use the web console to upload an image file to a new persistent volume claim (PVC).
You can later use this PVC to attach the image to new virtual machines.

.Prerequisites

* You must have one of the following:
** A raw virtual machine image file in either ISO or IMG format.
** A virtual machine image file in QCOW2 format.
* For best results, compress your image file according to the following guidelines before you upload it:
** Compress a raw image file by using `xz` or `gzip`.
+
[NOTE]
====
Using a compressed raw image file results in the most efficient upload.
====
** Compress a QCOW2 image file by using the method that is recommended for your client:
*** If you use a Linux client, _sparsify_ the QCOW2 file by using the
link:https://libguestfs.org/virt-sparsify.1.html[virt-sparsify] tool.
*** If you use a Windows client, compress the QCOW2 file by using `xz` or `gzip`.

.Procedure

. From the side menu of the web console, click *Storage* -> *Persistent Volume Claims*.

. Click the *Create Persistent Volume Claim* drop-down list to expand it.

. Click *With Data Upload Form* to open the *Upload Data to Persistent Volume Claim* page.

. Click *Browse* to open the file manager and select the image that you want to upload, or drag the file into the *Drag a file here or browse to upload* field.

. Optional: Set this image as the default image for a specific operating system.

.. Select the *Attach this data to a virtual machine operating system* check box.

.. Select an operating system from the list.

. The *Persistent Volume Claim Name* field is automatically filled with a unique name and cannot be edited. Take note of the name assigned to the PVC so that you can identify it later, if necessary.

. Select a storage class from the *Storage Class* list.

. In the *Size* field, enter the size value for the PVC. Select the corresponding unit of measurement from the drop-down list.
+
[WARNING]
====
The PVC size must be larger than the size of the uncompressed virtual disk.
====

. Select an *Access Mode* that matches the storage class that you selected.

. Click *Upload*.
