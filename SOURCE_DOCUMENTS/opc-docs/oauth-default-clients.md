// Module included in the following assemblies:
//
// * authentication/configuring-oauth-clients.adoc

[id="oauth-default-clients_{context}"]
= Default OAuth clients

The following OAuth clients are automatically created when starting the {product-title} API:

[cols="2,3",options="header"]
|===

|OAuth client |Usage

|`openshift-browser-client`
|Requests tokens at `<namespace_route>/oauth/token/request` with a user-agent that can handle interactive logins. ^[1]^

|`openshift-challenging-client`
|Requests tokens with a user-agent that can handle `WWW-Authenticate` challenges.

|`openshift-cli-client`
| Requests tokens by using a local HTTP server fetching an authorization code grant.

|===
[.small]
--
1. `<namespace_route>` refers to the namespace route. This is found by
running the following command:
+
[source,terminal]
----
$ oc get route oauth-openshift -n openshift-authentication -o json | jq .spec.host
----
--
