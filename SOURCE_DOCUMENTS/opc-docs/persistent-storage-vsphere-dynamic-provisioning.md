// Module included in the following assemblies:
//
// * storage/persistent_storage/persistent-storage-vsphere.adoc

:_mod-docs-content-type: PROCEDURE
[id="vsphere-dynamic-provisioning_{context}"]
= Dynamically provisioning VMware vSphere volumes using the UI

{product-title} installs a default storage class, named `thin`, that uses the `thin` disk format for provisioning volumes.

.Prerequisites

* Storage must exist in the underlying infrastructure before it can be mounted as a volume in {product-title}.

.Procedure

. In the {product-title} console, click *Storage* → *Persistent Volume Claims*.

. In the persistent volume claims overview, click *Create Persistent Volume Claim*.

. Define the required options on the resulting page.

.. Select the `thin` storage class.

.. Enter a unique name for the storage claim.

.. Select the access mode to determine the read and write access for the created storage claim.

.. Define the size of the storage claim.

. Click *Create* to create the persistent volume claim and generate a persistent volume.
