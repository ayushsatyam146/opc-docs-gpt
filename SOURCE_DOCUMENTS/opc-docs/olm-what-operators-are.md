:_mod-docs-content-type: ASSEMBLY
[id="olm-what-operators-are"]
= What are Operators?
include::_attributes/common-attributes.adoc[]
:context: olm-what-operators-are

toc::[]

Conceptually, _Operators_ take human operational knowledge and encode it into software that is more easily shared with consumers.

Operators are pieces of software that ease the operational complexity of running another piece of software. They act like an extension of the software vendor's engineering team, monitoring a Kubernetes environment (such as {product-title}) and using its current state to make decisions in real time. Advanced Operators are designed to handle upgrades seamlessly, react to failures automatically, and not take shortcuts, like skipping a software backup process to save time.

More technically, Operators are a method of packaging, deploying, and managing a Kubernetes application.

A Kubernetes application is an app that is both deployed on Kubernetes and managed using the Kubernetes APIs and `kubectl` or `oc` tooling. To be able to make the most of Kubernetes, you require a set of cohesive APIs to extend in order to service and manage your apps that run on Kubernetes. Think of Operators as the runtime that manages this type of app on Kubernetes.

include::modules/olm-why-use-operators.adoc[leveloffset=+1]
include::modules/olm-operator-framework.adoc[leveloffset=+1]
include::modules/olm-operator-maturity-model.adoc[leveloffset=+1]
