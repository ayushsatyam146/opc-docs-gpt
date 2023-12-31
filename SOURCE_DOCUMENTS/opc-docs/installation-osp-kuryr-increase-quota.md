// Module included in the following assemblies:
//
// * installing/installing_openstack/installing-openstack-installer-kuryr.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-osp-kuryr-increase-quota_{context}"]
= Increasing quota

When using Kuryr SDN, you must increase quotas to satisfy the {rh-openstack-first}
resources used by pods, services, namespaces, and network policies.

.Procedure

* Increase the quotas for a project by running the following command:
+
[source,terminal]
----
$ sudo openstack quota set --secgroups 250 --secgroup-rules 1000 --ports 1500 --subnets 250 --networks 250 <project>
----
