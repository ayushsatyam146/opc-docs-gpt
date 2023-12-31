// Module included in the following assemblies:
//
// * operators/understanding/olm/olm-understanding-dependency-resolution.adoc

[id="olm-dependency-resolution-preferences_{context}"]
= Dependency preferences

There can be many options that equally satisfy a dependency of an Operator. The dependency resolver in Operator Lifecycle Manager (OLM) determines which option best fits the requirements of the requested Operator. As an Operator author or user, it can be important to understand how these choices are made so that dependency resolution is clear.

[id="olm-dependency-catalog-priority_{context}"]
== Catalog priority

On {product-title} cluster, OLM reads catalog sources to know which Operators are available for installation.

.Example `CatalogSource` object
[source,yaml]
----
apiVersion: "operators.coreos.com/v1alpha1"
kind: "CatalogSource"
metadata:
  name: "my-operators"
  namespace: "operators"
spec:
  sourceType: grpc
  grpcPodConfig:
    securityContextConfig: <security_mode> <1>
  image: example.com/my/operator-index:v1
  displayName: "My Operators"
  priority: 100
----
<1> Specify the value of `legacy` or `restricted`. If the field is not set, the default value is `legacy`. In a future {product-title} release, it is planned that the default value will be `restricted`. If your catalog cannot run with `restricted` permissions, it is recommended that you manually set this field to `legacy`.

A `CatalogSource` object has a `priority` field, which is used by the resolver to know how to prefer options for a dependency.

There are two rules that govern catalog preference:

* Options in higher-priority catalogs are preferred to options in lower-priority catalogs.
* Options in the same catalog as the dependent are preferred to any other catalogs.

[id="olm-dependency-catalog-ordering_{context}"]
== Channel ordering

An Operator package in a catalog is a collection of update channels that a user can subscribe to in an {product-title} cluster. Channels can be used to provide a particular stream of updates for a minor release (`1.2`, `1.3`) or a release frequency (`stable`, `fast`).

It is likely that a dependency might be satisfied by Operators in the same package, but different channels. For example, version `1.2` of an Operator might exist in both the `stable` and `fast` channels.

Each package has a default channel, which is always preferred to non-default channels. If no option in the default channel can satisfy a dependency, options are considered from the remaining channels in lexicographic order of the channel name.

[id="olm-dependency-order-winthin-channel_{context}"]
== Order within a channel

There are almost always multiple options to satisfy a dependency within a single channel. For example, Operators in one package and channel provide the same set of APIs.

When a user creates a subscription, they indicate which channel to receive updates from. This immediately reduces the search to just that one channel. But within the channel, it is likely that many Operators satisfy a dependency.

Within a channel, newer Operators that are higher up in the update graph are preferred. If the head of a channel satisfies a dependency, it will be tried first.

[id="olm-dependency-preferences-other_{context}"]
== Other constraints

In addition to the constraints supplied by package dependencies, OLM includes additional constraints to represent the desired user state and enforce resolution invariants.

[id="olm-dependency-sub-constraint_{context}"]
=== Subscription constraint

A subscription constraint filters the set of Operators that can satisfy a subscription. Subscriptions are user-supplied constraints for the dependency resolver. They declare the intent to either install a new Operator if it is not already on the cluster, or to keep an existing Operator updated.

[id="olm-dependency-package-constraint_{context}"]
=== Package constraint

Within a namespace, no two Operators may come from the same package.
