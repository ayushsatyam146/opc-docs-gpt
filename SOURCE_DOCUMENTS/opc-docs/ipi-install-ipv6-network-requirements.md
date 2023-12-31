// This is included in the following assemblies:
//
// ipi-install-prerequisites.adoc

:_mod-docs-content-type: CONCEPT
[id="ipi-install-ipv6-network-requirements_{context}"]
= IPv6 Network Requirements

.SLAAC addressing

If you do not plan to use SLAAC (Stateless Address AutoConfiguration) addresses on your {product-title} node, then it should be disabled for `baremetal` networks. That means that if the network equipment is configured to send SLAAC addresses when replying to Route Advertisements, you must configure the equipment so that it only sends the route and not the SLAAC address.

.Procedure

. Install `ndptool`.
+
[source,terminal]
----
$ sudo dnf install ndptool
----

. Turn down the `baremetal` interface on a control plane node, and then turn it back up.
+
[source,terminal]
----
$ sudo nmcli con down "Wired connection 5" && sudo nmcli con up "Wired connection 5"
----
+
[source,terminal]
----
Connection 'Wired connection 5' successfully deactivated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/1983)
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/2044)
----

. Activate the `ndptool` to check the route advertisements:
+
[source,terminal]
----
$ sudo ndptool monitor -t ra
----
+
[source,terminal]
----
NDP payload len 80, from addr: fe80::c0a4:6464:bcb3:d657, iface: baremetal.153
  Type: RA
  Hop limit: 64
  Managed address configuration: yes
  Other configuration: no
  Default router preference: medium
  Router lifetime: 0s
  Reachable time: unspecified
  Retransmit time: unspecified
  Source linkaddr: 1c:40:24:1b:0c:34
  Prefix: 2620:52:0:1303::/64, valid_time: 86400s, preferred_time: 14400s, on_link: yes, autonomous_addr_conf: no, router_addr: no
  Route: ::/0, lifetime: 0s, preference: low
----
+
The `ndptool monitor` should report `Managed address configuration: yes`.

.Network ranges and configurations

Each environment requires different `baremetal` and `provisioning` network; and, will have a different IPv6 range for each network. Typically, only the `baremetal` network is routable. The `provisioning` network cannot be in the same broadcast domain as the `baremetal` network, because of additional services running, such as DHCP.

.Route advertisements

[IMPORTANT]
====
Route advertisement must be enabled for both the `baremetal` and `provisioning` networks.
====

Both the `baremetal` and the `provisioning` networks must have route advertisement enabled. For the `baremetal` network, installer-provisioned installation uses the `radvd` daemon, and the `provisioning` network has route advertisement enabled in the Metal³ dnsmasq, so it requires no additional configuration.
