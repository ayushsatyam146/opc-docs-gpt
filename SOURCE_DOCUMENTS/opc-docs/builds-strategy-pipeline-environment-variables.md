// Module included in the following assemblies:
// * builds/build-strategies.adoc

:_mod-docs-content-type: PROCEDURE
[id="builds-strategy-pipeline-environment-variables_{context}"]
= Using environment variables for pipeline builds

[IMPORTANT]
====
The Pipeline build strategy is deprecated in {product-title} 4. Equivalent and improved functionality is present in the {product-title} Pipelines based on Tekton.

Jenkins images on {product-title} are fully supported and users should follow Jenkins user documentation for defining their `jenkinsfile` in a job or store it in a Source Control Management system.
====

To make environment variables available to the Pipeline build process, you can add environment variables to the `jenkinsPipelineStrategy` definition of the build configuration.

Once defined, the environment variables will be set as parameters for any Jenkins job associated with the build configuration.

.Procedure

* To define environment variables to be used during build, edit the YAML file:
+
[source,yaml]
----
jenkinsPipelineStrategy:
...
  env:
    - name: "FOO"
      value: "BAR"
----

You can also manage environment variables defined in the build configuration with the `oc set env` command.



//[NOTE]
//====
// This module needs specific instructions and examples.
// This is similar between Docker, S2I, and Custom.
//====
