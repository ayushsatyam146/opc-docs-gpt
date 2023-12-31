:_mod-docs-content-type: ASSEMBLY
[id="dedicated-aws-vpn"]
= Configuring AWS VPN
include::_attributes/common-attributes.adoc[]
:context: dedicated-aws-vpn

toc::[]

This sample process configures an Amazon Web Services (AWS) {product-title}
cluster to use a customer's on-site hardware VPN device.

[NOTE]
====
AWS VPN does not currently provide a managed option to apply NAT to VPN traffic.
See the
link:https://aws.amazon.com/premiumsupport/knowledge-center/configure-nat-for-vpn-traffic/[AWS Knowledge Center]
for more details.
====

[NOTE]
====
Routing all traffic, for example `0.0.0.0/0`, through a private connection is not supported. This requires deleting the internet gateway, which disables SRE management traffic.
====

For more information about connecting an AWS VPC to remote networks using a
hardware VPN device, see the Amazon VPC
link:https://docs.aws.amazon.com/vpc/latest/userguide/vpn-connections.html[VPN Connections]
documentation.

include::modules/dedicated-aws-vpn-creating.adoc[leveloffset=+1]
include::modules/dedicated-aws-vpn-verifying.adoc[leveloffset=+1]
include::modules/dedicated-aws-vpn-troubleshooting.adoc[leveloffset=+1]
