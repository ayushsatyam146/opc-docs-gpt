// Module included in the following assemblies:
// * builds/build-strategies.adoc

:_mod-docs-content-type: PROCEDURE
[id="builds-strategy-pipeline-providing-jenkinsfile_{context}"]
= Providing the Jenkins file for pipeline builds

[IMPORTANT]
====
The Pipeline build strategy is deprecated in {product-title} 4. Equivalent and improved functionality is present in the {product-title} Pipelines based on Tekton.

Jenkins images on {product-title} are fully supported and users should follow Jenkins user documentation for defining their `jenkinsfile` in a job or store it in a Source Control Management system.
====

The `jenkinsfile` uses the standard groovy language syntax to allow fine grained control over the configuration, build, and deployment of your application.

You can supply the `jenkinsfile` in one of the following ways:

* A file located within your source code repository.
* Embedded as part of your build configuration using the `jenkinsfile` field.

When using the first option, the `jenkinsfile` must be included in your applications source code repository at one of the following locations:

* A file named `jenkinsfile` at the root of your repository.
* A file named `jenkinsfile` at the root of the source `contextDir` of your repository.
* A file name specified via the `jenkinsfilePath` field of the `JenkinsPipelineStrategy` section of your BuildConfig, which is relative to the source `contextDir` if supplied, otherwise it defaults to the root of the repository.

The `jenkinsfile` is run on the Jenkins agent pod, which must have the
{product-title} client binaries available if you intend to use the {product-title} DSL.

.Procedure

To provide the Jenkins file, you can either:

* Embed the Jenkins file in the build configuration.
* Include in the build configuration a reference to the Git repository that contains the Jenkins file.

.Embedded Definition
[source,yaml]
----
kind: "BuildConfig"
apiVersion: "v1"
metadata:
  name: "sample-pipeline"
spec:
  strategy:
    jenkinsPipelineStrategy:
      jenkinsfile: |-
        node('agent') {
          stage 'build'
          openshiftBuild(buildConfig: 'ruby-sample-build', showBuildLogs: 'true')
          stage 'deploy'
          openshiftDeploy(deploymentConfig: 'frontend')
        }
----

.Reference to Git Repository
[source,yaml]
----
kind: "BuildConfig"
apiVersion: "v1"
metadata:
  name: "sample-pipeline"
spec:
  source:
    git:
      uri: "https://github.com/openshift/ruby-hello-world"
  strategy:
    jenkinsPipelineStrategy:
      jenkinsfilePath: some/repo/dir/filename <1>
----
<1> The optional `jenkinsfilePath` field specifies the name of the file to use, relative to the source `contextDir`. If `contextDir` is omitted, it defaults to the root of the repository. If `jenkinsfilePath` is omitted, it defaults to `jenkinsfile`.
