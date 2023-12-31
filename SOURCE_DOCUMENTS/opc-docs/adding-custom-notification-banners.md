// Module included in the following assemblies:
//
// * web_console/customizing-the-web-console.adoc

:_mod-docs-content-type: PROCEDURE
[id="creating-custom-notification-banners_{context}"]
= Creating custom notification banners

.Prerequisites

* You must have administrator privileges.

.Procedure

. From *Administration* -> *Custom Resource Definitions*, click on
*ConsoleNotification*.
. Select *Instances* tab
. Click *Create Console Notification* and edit the file:
+
[source,yaml]
----
apiVersion: console.openshift.io/v1
kind: ConsoleNotification
metadata:
  name: example
spec:
  text: This is an example notification message with an optional link.
  location: BannerTop <1>
  link:
    href: 'https://www.example.com'
    text: Optional link text
  color: '#fff'
  backgroundColor: '#0088ce'
----
<1> Valid location settings are `BannerTop`, `BannerBottom`, and `BannerTopBottom`.

. Click *Create* to apply your changes.
