// Module included in the following assemblies:
//
// * installing/installing_openstack/uninstalling-openstack-user.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-uninstall-infra_{context}"]
= Removing a cluster from {rh-openstack} that uses your own infrastructure

You can remove an {product-title} cluster on {rh-openstack-first} that uses your own infrastructure. To complete the removal process quickly, run several Ansible playbooks.

.Prerequisites

* Python 3 is installed on your machine.
* You downloaded the modules in "Downloading playbook dependencies."
* You have the playbooks that you used to install the cluster.
* You modified the playbooks that are prefixed with `down-` to reflect any changes that you made to their corresponding installation playbooks. For example, changes to the `bootstrap.yaml` file are reflected in the `down-bootstrap.yaml` file.
* All of the playbooks are in a common directory.

.Procedure

. On a command line, run the playbooks that you downloaded:
+
[source,terminal]
----
$ ansible-playbook -i inventory.yaml  \
	down-bootstrap.yaml      \
	down-control-plane.yaml  \
	down-compute-nodes.yaml  \
	down-load-balancers.yaml \
	down-network.yaml        \
	down-security-groups.yaml
----

. Remove any DNS record changes you made for the {product-title} installation.

{product-title} is removed from your infrastructure.