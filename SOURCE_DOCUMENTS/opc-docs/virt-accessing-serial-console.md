// Module included in the following assemblies:
//
// * virt/virtual_machines/virt-accessing-vm-consoles.adoc

:_mod-docs-content-type: PROCEDURE
[id="virt-accessing-serial-console_{context}"]
= Accessing the serial console of a virtual machine instance

The `virtctl console` command opens a serial console to the specified virtual
machine instance.

.Prerequisites
* The `virt-viewer` package must be installed.
* The virtual machine instance you want to access must be running.

.Procedure

* Connect to the serial console with `virtctl`:
+

[source,terminal]
----
$ virtctl console <VMI>
----
