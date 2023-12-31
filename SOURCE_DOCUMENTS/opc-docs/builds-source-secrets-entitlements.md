// Module included in the following assemblies:
//
//* builds/running-entitled-builds.adoc

:_mod-docs-content-type: PROCEDURE
[id="builds-source-secrets-entitlements_{context}"]
= Adding subscription entitlements as a build secret

Builds that use Red Hat subscriptions to install content must include the entitlement keys as a build secret.

.Prerequisites

You must have access to Red Hat entitlements through your subscription. The entitlement secret is automatically created by the Insights Operator.


[TIP]
====
When you perform an Entitlement Build using {op-system-base-full} 7, you must have the following instructions in your Dockerfile before you run any `yum` commands:

[source,terminal]
----
RUN rm /etc/rhsm-host
----
====

.Procedure

. Add the etc-pki-entitlement secret as a build volume in the build configuration’s Docker strategy:
+
[source,yaml]
----
strategy:
  dockerStrategy:
    from:
      kind: ImageStreamTag
      name: ubi:latest
    volumes:
    - name: etc-pki-entitlement
      mounts:
      - destinationPath: /etc/pki/entitlement
      source:
        type: Secret
        secret:
          secretName: etc-pki-entitlement
----
