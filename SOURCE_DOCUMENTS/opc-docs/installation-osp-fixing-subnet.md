// Module included in the following assemblies:
// * installing/installing_openstack/installing-openstack-installer-user.adoc
//
//YOU MUST SET AN IFEVAL FOR EACH NEW MODULE

:_mod-docs-content-type: PROCEDURE
[id="installation-osp-fixing-subnet_{context}"]
= Setting a custom subnet for machines

The IP range that the installation program uses by default might not match the Neutron subnet that you create when you install {product-title}. If necessary, update the CIDR value for new machines by editing the installation configuration file.

.Prerequisites

* You have the `install-config.yaml` file that was generated by the {product-title} installation program.

.Procedure

. On a command line, browse to the directory that contains `install-config.yaml`.

. From that directory, either run a script to edit the `install-config.yaml` file or update the file manually:

** To set the value by using a script, run:
+
[source,terminal]
----
$ python -c '
import yaml;
path = "install-config.yaml";
data = yaml.safe_load(open(path));
data["networking"]["machineNetwork"] = [{"cidr": "192.168.0.0/18"}]; <1>
open(path, "w").write(yaml.dump(data, default_flow_style=False))'
----
<1> Insert a value that matches your intended Neutron subnet, e.g. `192.0.2.0/24`.

** To set the value manually, open the file and set the value of `networking.machineCIDR` to something that matches your intended Neutron subnet.
