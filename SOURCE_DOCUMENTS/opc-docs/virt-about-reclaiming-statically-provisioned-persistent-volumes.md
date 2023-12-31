// Module included in the following assemblies:
//
// virt/virtual_machines/virtual_disks/virt-reusing-statically-provisioned-persistent-volumes.adoc

:_mod-docs-content-type: CONCEPT
[id="virt-about-reclaiming-statically-provisioned-persistent-volumes_{context}"]

= About reclaiming statically provisioned persistent volumes

When you reclaim a persistent volume (PV), you unbind the PV from a persistent volume claim (PVC) and delete the PV. Depending on the underlying storage, you might need to manually delete the shared storage.

You can then re-use the PV configuration to create a PV with a different name.

Statically provisioned PVs must have a reclaim policy of `Retain` to be reclaimed.
If they do not, the PV enters a failed state when the PVC is unbound from the PV.

[IMPORTANT]
====
The `Recycle` reclaim policy is deprecated in {product-title} 4.
====
