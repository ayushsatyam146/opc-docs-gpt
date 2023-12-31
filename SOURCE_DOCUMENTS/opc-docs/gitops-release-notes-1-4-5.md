// Module included in the following assembly:
//
// * gitops/gitops-release-notes.adoc

[id="gitops-release-notes-1-4-5_{context}"]
= Release notes for {gitops-title} 1.4.5

[role="_abstract"]
{gitops-title} 1.4.5 is now available on {product-title} 4.7, 4.8, 4.9, and 4.10.

[id="fixed-issues-1-4-5_{context}"]
== Fixed issues

[WARNING]
====
You should directly upgrade to {gitops-title} v1.4.5 from {gitops-title} v1.4.3. Do not use {gitops-title} v1.4.4 in a production environment. Major issues that affected {gitops-title} v1.4.4 are fixed in {gitops-title} 1.4.5. 
====

The following issue has been resolved in the current release:

* Before this update, Argo CD pods were stuck in the `ErrImagePullBackOff` state. The following error message was shown:
[source,yaml]
----
reason: ErrImagePull
          message: >-
            rpc error: code = Unknown desc = reading manifest
            sha256:ff4ad30752cf0d321cd6c2c6fd4490b716607ea2960558347440f2f370a586a8
            in registry.redhat.io/openshift-gitops-1/argocd-rhel8: StatusCode:
            404, <HTML><HEAD><TITLE>Error</TITLE></HEAD><BODY> 
----
This issue is now fixed. link:https://issues.redhat.com/browse/GITOPS-1848[GITOPS-1848]