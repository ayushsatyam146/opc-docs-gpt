////
Module included in the following assemblies:
-service_mesh/v2x/ossm-vs-community.adoc
////
:_mod-docs-content-type: CONCEPT
[id="ossm-vs-istio_{context}"]
= Differences between Istio and {SMProductName}

The following features are different in {SMProductShortName} and Istio.

[id="ossm-cli-tool_{context}"]
== Command line tool

The command line tool for {SMProductName} is `oc`.  {SMProductName} does not support `istioctl`.


[id="ossm-installation-upgrade_{context}"]
== Installation and upgrades

{SMProductName} does not support Istio installation profiles.

{SMProductName} does not support canary upgrades of the service mesh.


[id="ossm-automatic-injection_{context}"]
== Automatic injection

The upstream Istio community installation automatically injects the sidecar into pods within the projects you have labeled.

{SMProductName} does not automatically inject the sidecar into any pods, but you must opt in to injection using an annotation without labeling projects. This method requires fewer privileges and does not conflict with other {product-title} capabilities such as builder pods. To enable automatic injection, specify the `sidecar.istio.io/inject` label, or annotation, as described in the _Automatic sidecar injection_ section.

.Sidecar injection label and annotation settings
[options="header"]
[cols="a, a, a"]
|===
|
|Upstream Istio
|{SMProductName}

|Namespace Label
|supports "enabled" and "disabled"
|supports "disabled"

|Pod Label
|supports "true" and "false"
|supports "true" and "false"

|Pod Annotation
|supports "false" only
|supports "true" and "false"
|===


[id="ossm-rbac_{context}"]
== Istio Role Based Access Control features

Istio Role Based Access Control (RBAC) provides a mechanism you can use to control access to a service. You can identify subjects by user name or by specifying a set of properties and apply access controls accordingly.

The upstream Istio community installation includes options to perform exact header matches, match wildcards in headers, or check for a header containing a specific prefix or suffix.

{SMProductName} extends the ability to match request headers by using a regular expression. Specify a property key of `request.regex.headers` with a regular expression.

.Upstream Istio community matching request headers example
[source,yaml]
----
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata:
  name: httpbin-usernamepolicy
spec:
  action: ALLOW
  rules:
    - when:
        - key: 'request.regex.headers[username]'
          values:
            - "allowed.*"
  selector:
    matchLabels:
      app: httpbin
----

[id="ossm-openssl_{context}"]
== OpenSSL

{SMProductName} replaces BoringSSL with OpenSSL. OpenSSL is a software library that contains an open source implementation of the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols. The {SMProductName} Proxy binary dynamically links the OpenSSL libraries (libssl and libcrypto) from the underlying Red Hat Enterprise Linux operating system.

[id="ossm-external-workloads_{context}"]
== External workloads

{SMProductName} does not support external workloads, such as virtual machines running outside OpenShift on bare metal servers.

[id="ossm-virtual-machine-support_{context}"]
== Virtual Machine Support

You can deploy virtual machines to OpenShift using OpenShift Virtualization. Then, you can apply a mesh policy, such as mTLS or AuthorizationPolicy, to these virtual machines, just like any other pod that is part of a mesh.

[id="ossm-component-modifications_{context}"]
== Component modifications

* A _maistra-version_ label has been added to all resources.
* All Ingress resources have been converted to OpenShift Route resources.
* Grafana, distributed tracing (Jaeger), and Kiali are enabled by default and exposed through OpenShift routes.
* Godebug has been removed from all templates
* The `istio-multi` ServiceAccount and ClusterRoleBinding have been removed, as well as the `istio-reader` ClusterRole.

[id="ossm-envoy-filters_{context}"]
== Envoy filters

{SMProductName} does not support `EnvoyFilter` configuration except where explicitly documented. Due to tight coupling with the underlying Envoy APIs, backward compatibility cannot be maintained. `EnvoyFilter` patches are very sensitive to the format of the Envoy configuration that is generated by Istio. If the configuration generated by Istio changes, it has the potential to break the application of the `EnvoyFilter`.

[id="ossm-envoy-services_{context}"]
== Envoy services

{SMProductName} does not support QUIC-based services.

[id="ossm-cni_{context}"]
== Istio Container Network Interface (CNI) plugin

{SMProductName} includes CNI plugin, which provides you with an alternate way to configure application pod networking. The CNI plugin replaces the `init-container` network configuration eliminating the need to grant service accounts and projects access to security context constraints (SCCs) with elevated privileges.

[id="ossm-global-mtls_{context}"]
== Global mTLS settings
{SMProductName} creates a `PeerAuthentication` resource that enables or disables Mutual TLS authentication (mTLS) within the mesh.

[id="ossm-gateways_{context}"]
== Gateways

{SMProductName} installs ingress and egress gateways by default. You can disable gateway installation in the `ServiceMeshControlPlane` (SMCP) resource by using the following settings:

* `spec.gateways.enabled=false` to disable both ingress and egress gateways.
* `spec.gateways.ingress.enabled=false` to disable ingress gateways.
* `spec.gateways.egress.enabled=false`  to disable egress gateways.

[NOTE]
====
The Operator annotates the default gateways to indicate that they are generated by and managed by the {SMProductName} Operator.
====

[id="ossm-multicluster-configuration_{context}"]
== Multicluster configurations

{SMProductName} support for multicluster configurations is limited to the federation of service meshes across multiple clusters.

[id="ossm-certificate-signing-request_{context}"]
== Custom Certificate Signing Requests (CSR)

You cannot configure {SMProductName} to process CSRs through the Kubernetes certificate authority (CA).

[id="ossm-routes-gateways_{context}"]
== Routes for Istio Gateways

OpenShift routes for Istio Gateways are automatically managed in {SMProductName}. Every time an Istio Gateway is created, updated or deleted inside the service mesh, an OpenShift route is created, updated or deleted.

A {SMProductName} control plane component called Istio OpenShift Routing (IOR) synchronizes the gateway route. For more information, see Automatic route creation.

[id="ossm-catch-all-domains_{context}"]
=== Catch-all domains
Catch-all domains ("\*") are not supported. If one is found in the Gateway definition, {SMProductName} _will_ create the route, but will rely on OpenShift to create a default hostname. This means that the newly created route will __not__ be a catch all ("*") route, instead it will have a hostname in the form `<route-name>[-<project>].<suffix>`. See the {product-title} documentation for more information about how default hostnames work and how a `cluster-admin` can customize it. If you use {product-dedicated}, refer to the {product-dedicated} the `dedicated-admin` role.

[id="ossm-subdomains_{context}"]
=== Subdomains
Subdomains (e.g.: "*.domain.com") are supported. However this ability doesn't come enabled by default in {product-title}. This means that {SMProductName} _will_ create the route with the subdomain, but it will only be in effect if {product-title} is configured to enable it.

[id="ossm-tls_{context}"]
=== Transport layer security
Transport Layer Security (TLS) is supported. This means that, if the Gateway contains a `tls` section, the OpenShift Route will be configured to support TLS.