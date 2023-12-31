// Module included in the following assemblies:
//
// * rosa_cluster_admin/cloud_infrastructure_access/dedicated-aws-dc.adoc

[id="dedicated-aws-dc-methods"]
= AWS Direct Connect methods

A Direct Connect connection requires a hosted Virtual Interface (VIF) connected
to a Direct Connect Gateway (DXGateway), which is in turn associated to a
Virtual Gateway (VGW) or a Transit Gateway in order to access a remote VPC in
the same or another account.

If you do not have an existing DXGateway, the typical process involves creating
the hosted VIF, with the DXGateway and VGW being created in the {product-title} AWS Account.

If you have an existing DXGateway connected to one or more existing VGWs, the
process involves the {product-title} AWS Account sending an Association Proposal
to the DXGateway owner. The DXGateway owner must ensure that the proposed CIDR
will not conflict with any other VGWs they have associated.

See the following AWS documentation for more details:

* link:https://docs.aws.amazon.com/directconnect/latest/UserGuide/WorkingWithVirtualInterfaces.html[Virtual Interfaces]
* link:https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-gateways-intro.html[Direct Connect Gateways]
* link:https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html[Associating a VGW across accounts]

[IMPORTANT]
====
When connecting to an existing DXGateway, you are responsible for the
link:https://aws.amazon.com/directconnect/pricing/[costs].
====

There are two configuration options available:

[horizontal]
Method 1:: Create the hosted VIF and then the DXGateway and VGW.
Method 2:: Request a connection via an existing Direct Connect Gateway that you own.
