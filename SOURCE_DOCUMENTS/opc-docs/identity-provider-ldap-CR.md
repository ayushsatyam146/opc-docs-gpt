// Module included in the following assemblies:
//
// * authentication/identity_providers/configuring-ldap-identity-provider.adoc

[id="identity-provider-ldap-CR_{context}"]
= Sample LDAP CR

The following custom resource (CR) shows the parameters and acceptable values for an
LDAP identity provider.

.LDAP CR

[source,yaml]
----
apiVersion: config.openshift.io/v1
kind: OAuth
metadata:
  name: cluster
spec:
  identityProviders:
  - name: ldapidp <1>
    mappingMethod: claim <2>
    type: LDAP
    ldap:
      attributes:
        id: <3>
        - dn
        email: <4>
        - mail
        name: <5>
        - cn
        preferredUsername: <6>
        - uid
      bindDN: "" <7>
      bindPassword: <8>
        name: ldap-secret
      ca: <9>
        name: ca-config-map
      insecure: false <10>
      url: "ldaps://ldaps.example.com/ou=users,dc=acme,dc=com?uid" <11>
----
<1> This provider name is prefixed to the returned user ID to form an identity
name.
<2> Controls how mappings are established between this provider's identities and `User` objects.
<3> List of attributes to use as the identity. First non-empty attribute is
used. At least one attribute is required. If none of the listed attribute
have a value, authentication fails. Defined attributes are retrieved as raw,
allowing for binary values to be used.
<4> List of attributes to use as the email address. First non-empty
attribute is used.
<5> List of attributes to use as the display name. First non-empty
attribute is used.
<6> List of attributes to use as the preferred user name when provisioning a
user for this identity. First non-empty attribute is used.
<7> Optional DN to use to bind during the search phase. Must be set if
`bindPassword` is defined.
<8> Optional reference to an {product-title} `Secret` object containing the bind
password. Must be set if `bindDN` is defined.
<9> Optional: Reference to an {product-title} `ConfigMap` object containing the
PEM-encoded certificate authority bundle to use in validating server
certificates for the configured URL. Only used when `insecure` is `false`.
<10> When `true`, no TLS connection is made to the server. When `false`,
`ldaps://` URLs connect using TLS, and `ldap://` URLs are upgraded to TLS.
This must be set to `false` when `ldaps://` URLs are in use, as these
URLs always attempt to connect using TLS.
<11> An RFC 2255 URL which specifies the LDAP host and search parameters to use.

[NOTE]
====
To whitelist users for an LDAP integration, use the `lookup` mapping method.
Before a login from LDAP would be allowed, a cluster administrator must create
an `Identity` object and a `User` object for each LDAP user.
====
