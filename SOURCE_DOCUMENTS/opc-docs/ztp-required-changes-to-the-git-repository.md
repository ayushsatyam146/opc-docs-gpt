// Module included in the following assemblies:
//
// * scalability_and_performance/ztp_far_edge/ztp-updating-gitops.adoc

:_mod-docs-content-type: CONCEPT
[id="ztp-required-changes-to-the-git-repository_{context}"]
= Required changes to the Git repository

When upgrading the `ztp-site-generate` container from an earlier release of {ztp-first} to 4.10 or later, there are additional requirements for the contents of the Git repository. Existing content in the repository must be updated to reflect these changes.

* Make required changes to `PolicyGenTemplate` files:
+
All `PolicyGenTemplate` files must be created in a `Namespace` prefixed with `ztp`. This ensures that the {ztp} application is able to manage the policy CRs generated by {ztp} without conflicting with the way {rh-rhacm-first} manages the policies internally.

* Add the `kustomization.yaml` file to the repository:
+
All `SiteConfig` and `PolicyGenTemplate` CRs must be included in a `kustomization.yaml` file under their respective directory trees. For example:
+
[source,terminal]
----
├── policygentemplates
│   ├── site1-ns.yaml
│   ├── site1.yaml
│   ├── site2-ns.yaml
│   ├── site2.yaml
│   ├── common-ns.yaml
│   ├── common-ranGen.yaml
│   ├── group-du-sno-ranGen-ns.yaml
│   ├── group-du-sno-ranGen.yaml
│   └── kustomization.yaml
└── siteconfig
    ├── site1.yaml
    ├── site2.yaml
    └── kustomization.yaml
----
+
[NOTE]
====
The files listed in the `generator` sections must contain either `SiteConfig` or `PolicyGenTemplate` CRs only. If your existing YAML files contain other CRs, for example, `Namespace`, these other CRs must be pulled out into separate files and listed in the `resources` section.
====
+
The `PolicyGenTemplate` kustomization file must contain all `PolicyGenTemplate` YAML files in the `generator` section and `Namespace` CRs in the `resources` section. For example:
+
[source,yaml]
----
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

generators:
- common-ranGen.yaml
- group-du-sno-ranGen.yaml
- site1.yaml
- site2.yaml

resources:
- common-ns.yaml
- group-du-sno-ranGen-ns.yaml
- site1-ns.yaml
- site2-ns.yaml
----
+
The `SiteConfig` kustomization file must contain all `SiteConfig` YAML files in the `generator` section and any other CRs in the resources:
+
[source,terminal]
----
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

generators:
- site1.yaml
- site2.yaml
----

* Remove the `pre-sync.yaml` and `post-sync.yaml` files.
+
In {product-title} 4.10 and later, the `pre-sync.yaml` and `post-sync.yaml` files are no longer required. The `update/deployment/kustomization.yaml` CR manages the policies deployment on the hub cluster.
+
[NOTE]
====
There is a set of `pre-sync.yaml` and `post-sync.yaml` files under both the `SiteConfig` and `PolicyGenTemplate` trees.
====

* Review and incorporate recommended changes
+
Each release may include additional recommended changes to the configuration applied to deployed clusters. Typically these changes result in lower CPU use by the OpenShift platform, additional features, or improved tuning of the platform.
+
Review the reference `SiteConfig` and `PolicyGenTemplate` CRs applicable to the types of cluster in your network. These examples can be found in the `argocd/example` directory extracted from the {ztp} container.