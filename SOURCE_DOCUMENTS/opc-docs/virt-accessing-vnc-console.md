// Module included in the following assemblies:
//
// * virt/virtual_machines/virt-accessing-vm-consoles.adoc

:_mod-docs-content-type: PROCEDURE
[id="virt-accessing-vnc-console_{context}"]
= Accessing the graphical console of a virtual machine instances with VNC

The `virtctl` client utility can use the `remote-viewer` function to open a
graphical console to a running virtual machine instance. This capability is
included in the `virt-viewer` package.

.Prerequisites

* The `virt-viewer` package must be installed.
* The virtual machine instance you want to access must be running.

[NOTE]
====
If you use `virtctl` via SSH on a remote machine, you must
forward the X session to your machine.
====

.Procedure

. Connect to the graphical interface with the `virtctl` utility:
+

[source,terminal]
----
$ virtctl vnc <VMI>
----

. If the command failed, try using the `-v` flag to collect
troubleshooting information:

+
[source,terminal]
----
$ virtctl vnc <VMI> -v 4
----
