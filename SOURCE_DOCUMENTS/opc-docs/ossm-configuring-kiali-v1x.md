// Module included in the following assemblies:
//
// * service_mesh/v1x/customizing-installation-ossm.adoc
// * service_mesh/v2x/customizing-installation-ossm.adoc
:_mod-docs-content-type: REFERENCE
[id="configuring-kiali_{context}"]
= Configuring Kiali

When the {SMProductShortName} Operator creates the `ServiceMeshControlPlane` it also processes the Kiali resource. The Kiali Operator then uses this object when creating Kiali instances.

The default Kiali parameters specified in the `ServiceMeshControlPlane` are as follows:

.Example Kiali parameters
[source,yaml]
----
apiVersion: maistra.io/v1
kind: ServiceMeshControlPlane
spec:
    kiali:
      enabled: true
      dashboard:
        viewOnlyMode: false
      ingress:
        enabled: true
----

.Kiali parameters
[options="header"]
[cols="l, a, a, a"]
|===
|Parameter |Description |Values |Default value

|enabled
|This parameter enables/disables Kiali. Kiali is enabled by default.
|`true`/`false`
|`true`

|dashboard
   viewOnlyMode
|This parameter enables/disables view-only mode for the Kiali console.  When view-only mode is enabled, users cannot use the console to make changes to the {SMProductShortName}.
|`true`/`false`
|`false`

|ingress
   enabled
|This parameter enables/disables ingress for Kiali.
|`true`/`false`
|`true`
|===

[id="configuring-kiali-grafana_{context}"]
== Configuring Kiali for Grafana

When you install Kiali and Grafana as part of {SMProductName} the Operator configures the following by default:

* Grafana is enabled as an external service for Kiali
* Grafana authorization for the Kiali console
* Grafana URL for the Kiali console

Kiali can automatically detect the Grafana URL. However if you have a custom Grafana installation that is not easily auto-detectable by Kiali, you must update the URL value in the `ServiceMeshControlPlane` resource.

.Additional Grafana parameters
[source,yaml]
----
spec:
  kiali:
    enabled: true
    dashboard:
      viewOnlyMode: false
      grafanaURL:  "https://grafana-istio-system.127.0.0.1.nip.io"
    ingress:
      enabled: true
----

[id="configuring-kiali-jaeger_{context}"]
== Configuring Kiali for Jaeger

When you install Kiali and Jaeger as part of {SMProductName} the Operator configures the following by default:

* Jaeger is enabled as an external service for Kiali
* Jaeger authorization for the Kiali console
* Jaeger URL for the Kiali console

Kiali can automatically detect the Jaeger URL. However if you have a custom Jaeger installation that is not easily auto-detectable by Kiali, you must update the URL value in the `ServiceMeshControlPlane` resource.

.Additional Jaeger parameters
[source,yaml]
----
spec:
  kiali:
    enabled: true
    dashboard:
      viewOnlyMode: false
      jaegerURL: "http://jaeger-query-istio-system.127.0.0.1.nip.io"
    ingress:
      enabled: true
----
