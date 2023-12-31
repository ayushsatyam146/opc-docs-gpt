// Module included in the following assembly:
//
// * openshift_pipelines/op-release-notes.adoc

[id="op-release-notes-1-2_{context}"]
= Release notes for {pipelines-title} Technology Preview 1.2

[id="new-features-1-2_{context}"]
== New features
{pipelines-title} Technology Preview (TP) 1.2 is now available on {product-title} 4.6. {pipelines-title} TP 1.2 is updated to support:

* Tekton Pipelines 0.16.3
* Tekton `tkn` CLI 0.13.1
* Tekton Triggers 0.8.1
* cluster tasks based on Tekton Catalog 0.16
* IBM Power Systems on {product-title} 4.6
* {ibm-z-name} and {ibm-linuxone-name} on {product-title} 4.6

In addition to the fixes and stability improvements, the following sections highlight what is new in {pipelines-title} 1.2.

[id="pipeline-new-features-1-2_{context}"]
=== Pipelines

* This release of {pipelines-title} adds support for a disconnected installation.

+
[NOTE]
====
Installations in restricted environments are currently not supported on {ibm-power-name} Systems, {ibm-z-name}, and {ibm-linuxone-name}.
====

* You can now use the `when` field, instead of `conditions` resource, to run a task only when certain criteria are met. The key components of `WhenExpression` resources are `Input`, `Operator`, and `Values`. If all the when expressions evaluate to `True`, then the task is run. If any of the when expressions evaluate to `False`, the task is skipped.
* Step statuses are now updated if a task run is canceled or times out.
* Support for Git Large File Storage (LFS) is now available to build the base image used by `git-init`.
* You can now use the `taskSpec` field to specify metadata, such as labels and annotations, when a task is embedded in a pipeline.
* Cloud events are now supported by pipeline runs. Retries with `backoff` are now enabled for cloud events sent by the cloud event pipeline resource.
* You can now set a default `Workspace` configuration for any workspace that a `Task` resource declares, but that a `TaskRun` resource does not explicitly provide.
* Support is available for namespace variable interpolation for the `PipelineRun` namespace and `TaskRun` namespace.
* Validation for `TaskRun` objects is now added to check that not more than one persistent volume claim workspace is used when a `TaskRun` resource is associated with an Affinity Assistant. If more than one persistent volume claim workspace is used, the task run fails with a `TaskRunValidationFailed` condition. Note that by default, the Affinity Assistant is disabled in {pipelines-title}, so you will need to enable the assistant to use it.

[id="cli-new-features-1-2_{context}"]
=== Pipelines CLI

* The `tkn task describe`, `tkn taskrun describe`,  `tkn clustertask describe`, `tkn pipeline describe`, and `tkn pipelinerun describe` commands now:
** Automatically select the `Task`, `TaskRun`, `ClusterTask`, `Pipeline` and `PipelineRun` resource, respectively, if only one of them is present.
** Display the results of the `Task`, `TaskRun`, `ClusterTask`, `Pipeline` and `PipelineRun` resource in their outputs, respectively.
** Display workspaces declared in the `Task`, `TaskRun`, `ClusterTask`, `Pipeline` and `PipelineRun` resource in their outputs, respectively.
* You can now use the `--prefix-name` option with the `tkn clustertask start` command to specify a prefix for the name of a task run.
* Interactive mode support has now been provided to the `tkn clustertask start` command.
* You can now specify `PodTemplate` properties supported by pipelines using local or remote file definitions for `TaskRun` and `PipelineRun` objects.
* You can now use the `--use-params-defaults` option with the `tkn clustertask start` command to use the default values set in the `ClusterTask` configuration and create the task run.
* The `--use-param-defaults` flag for the `tkn pipeline start` command now prompts the interactive mode if the default values have not been specified for some of the parameters.

[id="triggers-new-features-1-2_{context}"]
=== Triggers

* The Common Expression Language (CEL) function named `parseYAML` has been added to parse a YAML string into a map of strings.
* Error messages for parsing CEL expressions have been improved to make them more granular while evaluating expressions and when parsing the hook body for creating the evaluation environment.
* Support is now available for marshaling boolean values and maps if they are used as the values of expressions in a CEL overlay mechanism.
* The following fields have been added to the `EventListener` object:
** The `replicas` field enables the event listener to run more than one pod by specifying the number of replicas in the YAML file.
** The `NodeSelector` field enables the `EventListener` object to schedule the event listener pod to a specific node.
* Webhook interceptors can now parse the `EventListener-Request-URL` header to extract parameters from the original request URL being handled by the event listener.
* Annotations from the event listener can now be propagated to the deployment, services, and other pods. Note that custom annotations on services or deployment are overwritten, and hence, must be added to the event listener annotations so that they are propagated.
* Proper validation for replicas in the `EventListener` specification is now available for cases when a user specifies the `spec.replicas` values as `negative` or `zero`.
* You can now specify the `TriggerCRD` object inside the `EventListener` spec as a reference using the `TriggerRef` field to create the `TriggerCRD` object separately and then bind it inside the `EventListener` spec.
* Validation and defaults for the `TriggerCRD` object are now available.

[id="deprecated-features-1-2_{context}"]
== Deprecated features

* `$(params)` parameters are now removed from the `triggertemplate` resource and replaced by `$(tt.params)` to avoid confusion between the `resourcetemplate` and `triggertemplate` resource parameters.
* The `ServiceAccount` reference of the optional `EventListenerTrigger`-based authentication level has changed from an object reference to a `ServiceAccountName` string. This ensures that the `ServiceAccount` reference is in the same namespace as the `EventListenerTrigger` object.
* The `Conditions` custom resource definition (CRD) is now deprecated; use the `WhenExpressions` CRD instead.
* The `PipelineRun.Spec.ServiceAccountNames` object is being deprecated and replaced by the `PipelineRun.Spec.TaskRunSpec[].ServiceAccountName` object.

[id="known-issues-1-2_{context}"]
== Known issues

* This release of {pipelines-title} adds support for a disconnected installation. However, some images used by the cluster tasks must be mirrored for them to work in disconnected clusters.
* Pipelines in the `openshift` namespace are not deleted after you uninstall the {pipelines-title} Operator. Use the `oc delete pipelines -n openshift --all` command to delete the pipelines.
* Uninstalling the {pipelines-title} Operator does not remove the event listeners.
+
As a workaround, to remove the `EventListener` and `Pod` CRDs:
+
. Edit the `EventListener` object with the `foregroundDeletion` finalizers:
+
[source,terminal]
----
$ oc patch el/<eventlistener_name> -p '{"metadata":{"finalizers":["foregroundDeletion"]}}' --type=merge
----
+
For example:
+
[source,terminal]
----
$ oc patch el/github-listener-interceptor -p '{"metadata":{"finalizers":["foregroundDeletion"]}}' --type=merge
----
+
. Delete the `EventListener` CRD:
+
[source,terminal]
----
$ oc patch crd/eventlisteners.triggers.tekton.dev -p '{"metadata":{"finalizers":[]}}' --type=merge
----

* When you run a multi-arch container image task without command specification on an {ibm-power-name} Systems (ppc64le) or {ibm-z-name} (s390x) cluster, the `TaskRun` resource fails with the following error:
+
[source,terminal]
----
Error executing command: fork/exec /bin/bash: exec format error
----
+
As a workaround, use an architecture specific container image or specify the sha256 digest to point to the correct architecture.
To get the sha256 digest enter:
+
[source,terminal]
----
$ skopeo inspect --raw <image_name>| jq '.manifests[] | select(.platform.architecture == "<architecture>") | .digest'
----

[id="fixed-issues-1-2_{context}"]
== Fixed issues

* A simple syntax validation to check the CEL filter, overlays in the Webhook validator, and the expressions in the interceptor has now been added.
* Triggers no longer overwrite annotations set on the underlying deployment and service objects.
* Previously, an event listener would stop accepting events. This fix adds an idle timeout of 120 seconds for the `EventListener` sink to resolve this issue.
* Previously, canceling a pipeline run with a `Failed(Canceled)` state gave a success message. This has been fixed to display an error instead.
* The `tkn eventlistener list` command now provides the status of the listed event listeners, thus enabling you to easily identify the available ones.
* Consistent error messages are now displayed for the `triggers list` and `triggers describe` commands when triggers are not installed or when a resource cannot be found.
* Previously, a large number of idle connections would build up during cloud event delivery. The `DisableKeepAlives: true` parameter was added to the `cloudeventclient` config to fix this issue. Thus, a new connection is set up for every cloud event.
* Previously, the `creds-init` code would write empty files to the disk even if credentials of a given type were not provided. This fix modifies the `creds-init` code to write files for only those credentials that have actually been mounted from correctly annotated secrets.
