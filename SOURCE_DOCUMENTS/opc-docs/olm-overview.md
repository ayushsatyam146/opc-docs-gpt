// Module included in the following assemblies:
//
// * operators/understanding/olm/olm-understanding-olm.adoc
// * operators/operator-reference.adoc

[id="olm-overview_{context}"]
ifeval::["{context}" != "cluster-operators-ref"]
= What is Operator Lifecycle Manager?
endif::[]
ifeval::["{context}" == "cluster-operators-ref"]
= Purpose
endif::[]

_Operator Lifecycle Manager_ (OLM) helps users install, update, and manage the lifecycle of Kubernetes native applications (Operators) and their associated services running across their {product-title} clusters. It is part of the link:https://operatorframework.io/[Operator Framework], an open source toolkit designed to manage Operators in an effective, automated, and scalable way.

.Operator Lifecycle Manager workflow
image::olm-workflow.png[]

OLM runs by default in {product-title} {product-version}, which aids
ifndef::openshift-dedicated,openshift-rosa[]
cluster administrators
endif::openshift-dedicated,openshift-rosa[]
ifdef::openshift-dedicated,openshift-rosa[]
administrators with the `dedicated-admin` role
endif::openshift-dedicated,openshift-rosa[]
in installing, upgrading, and granting access to Operators running on their cluster. The {product-title} web console provides management screens for 
ifndef::openshift-dedicated,openshift-rosa[]
cluster administrators
endif::openshift-dedicated,openshift-rosa[]
ifdef::openshift-dedicated,openshift-rosa[]
`dedicated-admin` administrators
endif::openshift-dedicated,openshift-rosa[]
to install Operators, as well as grant specific projects access to use the catalog of Operators available on the cluster.

For developers, a self-service experience allows provisioning and configuring instances of databases, monitoring, and big data services without having to be subject matter experts, because the Operator has that knowledge baked into it.
