// Module included in the following assembly:
//
// * gitops/gitops-release-notes.adoc

[id="gitops-release-notes-1-3_{context}"]
= Release notes for {gitops-title} 1.3

{gitops-title} 1.3 is now available on {product-title} 4.7, 4.8, 4.9, and 4.6 with limited GA support.

[id="new-features-1-3_{context}"]
== New features
In addition to the fixes and stability improvements, the following sections highlight what is new in {gitops-title} 1.3.0:

* For a fresh install of v1.3.0, Dex is automatically configured. You can log into the default Argo CD instance in the `openshift-gitops` namespace using the OpenShift or `kubeadmin` credentials.  As an admin you can disable the Dex installation after the Operator is installed which will remove the Dex deployment from the `openshift-gitops` namespace.
* The default Argo CD instance installed by the  Operator as well as accompanying controllers can now run on the infrastructure nodes of the cluster by setting a simple configuration toggle.
* Internal communications in Argo CD can now be secured using the TLS and the OpenShift cluster certificates. The Argo CD routes can now leverage the OpenShift cluster certificates in addition to using external certificate managers such as the cert-manager.
* Use the improved *Environments* page in the *Developer* perspective of the console 4.9 to gain insights into the GitOps environments.
* You can now access custom health checks in Argo CD for `DeploymentConfig` resources, `Route` resources, and Operators installed using OLM.
* The GitOps Operator now conforms to the naming conventions recommended by the latest Operator-SDK:
** The prefix `gitops-operator-` is added to all resources
** Service account is renamed to `gitops-operator-controller-manager`


[id="fixed-issues-1-3_{context}"]
== Fixed issues
The following issues were resolved in the current release:

* Previously, if you set up a new namespace to be managed by a new instance of Argo CD, it would immediately be **Out Of Sync** due to the new roles and bindings that the Operator creates to manage that new namespace. This behavior is fixed.  link:https://issues.redhat.com/browse/GITOPS-1384[GITOPS-1384]

[id="known-issues-1-3_{context}"]
== Known issues

* While migrating from the Dex authentication provider to the Keycloak provider, you may experience login issues with Keycloak. link:https://issues.redhat.com/browse/GITOPS-1450[GITOPS-1450]
+
To prevent the above issue, when migrating, uninstall Dex by removing the `.spec.dex` section found in the Argo CD custom resource. Allow a few minutes for Dex to uninstall completely, and then proceed to install Keycloak by adding `.spec.sso.provider: keycloak` to the Argo CD custom resource.
+
As a workaround, uninstall Keycloak by removing `.spec.sso.provider: keycloak` and then re-install.
