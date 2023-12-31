// Module included in the following assemblies:
//
// * authentication/configuring-internal-oauth.adoc

:_mod-docs-content-type: PROCEDURE
[id="oauth-configuring-internal-oauth_{context}"]
= Configuring the internal OAuth server's token duration

You can configure default options for the internal OAuth server's
token duration.

[IMPORTANT]
====
By default, tokens are only valid for 24 hours. Existing sessions
expire after this time elapses.
====

If the default time is insufficient, then this can be modified using
the following procedure.

.Procedure

. Create a configuration file that contains the token duration options. The
following file sets this to 48 hours, twice the default.
+
[source,yaml]
----
apiVersion: config.openshift.io/v1
kind: OAuth
metadata:
  name: cluster
spec:
  tokenConfig:
    accessTokenMaxAgeSeconds: 172800 <1>
----
<1> Set `accessTokenMaxAgeSeconds` to control the lifetime of access tokens.
The default lifetime is 24 hours, or 86400 seconds. This attribute cannot
be negative. If set to zero, the default lifetime is used.

. Apply the new configuration file:
+
[NOTE]
====
Because you update the existing OAuth server, you must use the `oc apply`
command to apply the change.
====
+
[source,terminal]
----
$ oc apply -f </path/to/file.yaml>
----

. Confirm that the changes are in effect:
+
[source,terminal]
----
$ oc describe oauth.config.openshift.io/cluster
----
+
.Example output
[source,terminal]
----
...
Spec:
  Token Config:
    Access Token Max Age Seconds:  172800
...
----
