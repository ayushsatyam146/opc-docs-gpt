// Automatically generated by 'openshift-apidocs-gen'. Do not edit.
:_mod-docs-content-type: ASSEMBLY
[id="scheduler-config-openshift-io-v1"]
= Scheduler [config.openshift.io/v1]
:toc: macro
:toc-title:

toc::[]


Description::
+
--
Scheduler holds cluster-wide config information to run the Kubernetes Scheduler and influence its placement decisions. The canonical name for this config is `cluster`.
 Compatibility level 1: Stable within a major release for a minimum of 12 months or 3 minor releases (whichever is longer).
--

Type::
  `object`

Required::
  - `spec`


== Specification

[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `apiVersion`
| `string`
| APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources

| `kind`
| `string`
| Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

| `metadata`
| xref:../objects/index.adoc#io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta[`ObjectMeta`]
| Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

| `spec`
| `object`
| spec holds user settable values for configuration

| `status`
| `object`
| status holds observed values from the cluster. They may not be overridden.

|===
=== .spec
Description::
+
--
spec holds user settable values for configuration
--

Type::
  `object`




[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `defaultNodeSelector`
| `string`
| defaultNodeSelector helps set the cluster-wide default node selector to restrict pod placement to specific nodes. This is applied to the pods created in all namespaces and creates an intersection with any existing nodeSelectors already set on a pod, additionally constraining that pod's selector. For example, defaultNodeSelector: "type=user-node,region=east" would set nodeSelector field in pod spec to "type=user-node,region=east" to all pods created in all namespaces. Namespaces having project-wide node selectors won't be impacted even if this field is set. This adds an annotation section to the namespace. For example, if a new namespace is created with node-selector='type=user-node,region=east', the annotation openshift.io/node-selector: type=user-node,region=east gets added to the project. When the openshift.io/node-selector annotation is set on the project the value is used in preference to the value we are setting for defaultNodeSelector field. For instance, openshift.io/node-selector: "type=user-node,region=west" means that the default of "type=user-node,region=east" set in defaultNodeSelector would not be applied.

| `mastersSchedulable`
| `boolean`
| MastersSchedulable allows masters nodes to be schedulable. When this flag is turned on, all the master nodes in the cluster will be made schedulable, so that workload pods can run on them. The default value for this field is false, meaning none of the master nodes are schedulable. Important Note: Once the workload pods start running on the master nodes, extreme care must be taken to ensure that cluster-critical control plane components are not impacted. Please turn on this field after doing due diligence.

| `policy`
| `object`
| DEPRECATED: the scheduler Policy API has been deprecated and will be removed in a future release. policy is a reference to a ConfigMap containing scheduler policy which has user specified predicates and priorities. If this ConfigMap is not available scheduler will default to use DefaultAlgorithmProvider. The namespace for this configmap is openshift-config.

| `profile`
| `string`
| profile sets which scheduling profile should be set in order to configure scheduling decisions for new pods.
 Valid values are "LowNodeUtilization", "HighNodeUtilization", "NoScoring" Defaults to "LowNodeUtilization"

|===
=== .spec.policy
Description::
+
--
DEPRECATED: the scheduler Policy API has been deprecated and will be removed in a future release. policy is a reference to a ConfigMap containing scheduler policy which has user specified predicates and priorities. If this ConfigMap is not available scheduler will default to use DefaultAlgorithmProvider. The namespace for this configmap is openshift-config.
--

Type::
  `object`

Required::
  - `name`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `name`
| `string`
| name is the metadata.name of the referenced config map

|===
=== .status
Description::
+
--
status holds observed values from the cluster. They may not be overridden.
--

Type::
  `object`





== API endpoints

The following API endpoints are available:

* `/apis/config.openshift.io/v1/schedulers`
- `DELETE`: delete collection of Scheduler
- `GET`: list objects of kind Scheduler
- `POST`: create a Scheduler
* `/apis/config.openshift.io/v1/schedulers/{name}`
- `DELETE`: delete a Scheduler
- `GET`: read the specified Scheduler
- `PATCH`: partially update the specified Scheduler
- `PUT`: replace the specified Scheduler
* `/apis/config.openshift.io/v1/schedulers/{name}/status`
- `GET`: read status of the specified Scheduler
- `PATCH`: partially update status of the specified Scheduler
- `PUT`: replace status of the specified Scheduler


=== /apis/config.openshift.io/v1/schedulers


.Global query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `pretty`
| `string`
| If 'true', then the output is pretty printed.
|===

HTTP method::
  `DELETE`

Description::
  delete collection of Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `allowWatchBookmarks`
| `boolean`
| allowWatchBookmarks requests watch events with type "BOOKMARK". Servers that do not implement bookmarks may ignore this flag and bookmarks are sent at the server's discretion. Clients should not assume bookmarks are returned at any specific interval, nor may they assume the server will send any BOOKMARK event during a session. If this is not a watch, this field is ignored.
| `continue`
| `string`
| The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server, the server will respond with a 410 ResourceExpired error together with a continue token. If the client needs a consistent list, it must restart their list without the continue field. Otherwise, the client may send another list request with the token received with the 410 error, the server will respond with a list starting from the next key, but from the latest snapshot, which is inconsistent from the previous list results - objects that are created, modified, or deleted after the first list request will be included in the response, as long as their keys are after the "next key".

This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
| `fieldSelector`
| `string`
| A selector to restrict the list of returned objects by their fields. Defaults to everything.
| `labelSelector`
| `string`
| A selector to restrict the list of returned objects by their labels. Defaults to everything.
| `limit`
| `integer`
| limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.

The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
| `resourceVersion`
| `string`
| resourceVersion sets a constraint on what resource versions a request may be served from. See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.

Defaults to unset
| `resourceVersionMatch`
| `string`
| resourceVersionMatch determines how resourceVersion is applied to list calls. It is highly recommended that resourceVersionMatch be set for list calls where resourceVersion is set See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.

Defaults to unset
| `sendInitialEvents`
| `boolean`
| `sendInitialEvents=true` may be set together with `watch=true`. In that case, the watch stream will begin with synthetic events to produce the current state of objects in the collection. Once all such events have been sent, a synthetic "Bookmark" event  will be sent. The bookmark will report the ResourceVersion (RV) corresponding to the set of objects, and be marked with `"k8s.io/initial-events-end": "true"` annotation. Afterwards, the watch stream will proceed as usual, sending watch events corresponding to changes (subsequent to the RV) to objects watched.

When `sendInitialEvents` option is set, we require `resourceVersionMatch` option to also be set. The semantic of the watch request is as following: - `resourceVersionMatch` = NotOlderThan
  is interpreted as "data at least as new as the provided `resourceVersion`"
  and the bookmark event is send when the state is synced
  to a `resourceVersion` at least as fresh as the one provided by the ListOptions.
  If `resourceVersion` is unset, this is interpreted as "consistent read" and the
  bookmark event is send when the state is synced at least to the moment
  when request started being processed.
- `resourceVersionMatch` set to any other value or unset
  Invalid error is returned.

Defaults to true if `resourceVersion=""` or `resourceVersion="0"` (for backward compatibility reasons) and to false otherwise.
| `timeoutSeconds`
| `integer`
| Timeout for the list/watch call. This limits the duration of the call, regardless of any activity or inactivity.
| `watch`
| `boolean`
| Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
|===


.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../objects/index.adoc#io.k8s.apimachinery.pkg.apis.meta.v1.Status[`Status`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `GET`

Description::
  list objects of kind Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `allowWatchBookmarks`
| `boolean`
| allowWatchBookmarks requests watch events with type "BOOKMARK". Servers that do not implement bookmarks may ignore this flag and bookmarks are sent at the server's discretion. Clients should not assume bookmarks are returned at any specific interval, nor may they assume the server will send any BOOKMARK event during a session. If this is not a watch, this field is ignored.
| `continue`
| `string`
| The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server, the server will respond with a 410 ResourceExpired error together with a continue token. If the client needs a consistent list, it must restart their list without the continue field. Otherwise, the client may send another list request with the token received with the 410 error, the server will respond with a list starting from the next key, but from the latest snapshot, which is inconsistent from the previous list results - objects that are created, modified, or deleted after the first list request will be included in the response, as long as their keys are after the "next key".

This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
| `fieldSelector`
| `string`
| A selector to restrict the list of returned objects by their fields. Defaults to everything.
| `labelSelector`
| `string`
| A selector to restrict the list of returned objects by their labels. Defaults to everything.
| `limit`
| `integer`
| limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.

The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
| `resourceVersion`
| `string`
| resourceVersion sets a constraint on what resource versions a request may be served from. See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.

Defaults to unset
| `resourceVersionMatch`
| `string`
| resourceVersionMatch determines how resourceVersion is applied to list calls. It is highly recommended that resourceVersionMatch be set for list calls where resourceVersion is set See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.

Defaults to unset
| `sendInitialEvents`
| `boolean`
| `sendInitialEvents=true` may be set together with `watch=true`. In that case, the watch stream will begin with synthetic events to produce the current state of objects in the collection. Once all such events have been sent, a synthetic "Bookmark" event  will be sent. The bookmark will report the ResourceVersion (RV) corresponding to the set of objects, and be marked with `"k8s.io/initial-events-end": "true"` annotation. Afterwards, the watch stream will proceed as usual, sending watch events corresponding to changes (subsequent to the RV) to objects watched.

When `sendInitialEvents` option is set, we require `resourceVersionMatch` option to also be set. The semantic of the watch request is as following: - `resourceVersionMatch` = NotOlderThan
  is interpreted as "data at least as new as the provided `resourceVersion`"
  and the bookmark event is send when the state is synced
  to a `resourceVersion` at least as fresh as the one provided by the ListOptions.
  If `resourceVersion` is unset, this is interpreted as "consistent read" and the
  bookmark event is send when the state is synced at least to the moment
  when request started being processed.
- `resourceVersionMatch` set to any other value or unset
  Invalid error is returned.

Defaults to true if `resourceVersion=""` or `resourceVersion="0"` (for backward compatibility reasons) and to false otherwise.
| `timeoutSeconds`
| `integer`
| Timeout for the list/watch call. This limits the duration of the call, regardless of any activity or inactivity.
| `watch`
| `boolean`
| Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
|===


.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../objects/index.adoc#io.openshift.config.v1.SchedulerList[`SchedulerList`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `POST`

Description::
  create a Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `dryRun`
| `string`
| When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
| `fieldManager`
| `string`
| fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint.
| `fieldValidation`
| `string`
| fieldValidation instructs the server on how to handle objects in the request (POST/PUT/PATCH) containing unknown or duplicate fields. Valid values are: - Ignore: This will ignore any unknown fields that are silently dropped from the object, and will ignore all but the last duplicate field that the decoder encounters. This is the default behavior prior to v1.23. - Warn: This will send a warning via the standard warning response header for each unknown field that is dropped from the object, and for each duplicate field that is encountered. The request will still succeed if there are no other errors, and will only persist the last of any duplicate fields. This is the default in v1.23+ - Strict: This will fail the request with a BadRequest error if any unknown fields would be dropped from the object, or if any duplicate fields are present. The error returned from the server will contain all unknown and duplicate fields encountered.
|===

.Body parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `body`
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 201 - Created
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 202 - Accepted
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 401 - Unauthorized
| Empty
|===


=== /apis/config.openshift.io/v1/schedulers/{name}

.Global path parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `name`
| `string`
| name of the Scheduler
|===

.Global query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `pretty`
| `string`
| If 'true', then the output is pretty printed.
|===

HTTP method::
  `DELETE`

Description::
  delete a Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `dryRun`
| `string`
| When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
| `gracePeriodSeconds`
| `integer`
| The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
| `orphanDependents`
| `boolean`
| Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
| `propagationPolicy`
| `string`
| Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
|===

.Body parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `body`
| xref:../objects/index.adoc#io.k8s.apimachinery.pkg.apis.meta.v1.DeleteOptions[`DeleteOptions`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../objects/index.adoc#io.k8s.apimachinery.pkg.apis.meta.v1.Status[`Status`] schema
| 202 - Accepted
| xref:../objects/index.adoc#io.k8s.apimachinery.pkg.apis.meta.v1.Status[`Status`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `GET`

Description::
  read the specified Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `resourceVersion`
| `string`
| resourceVersion sets a constraint on what resource versions a request may be served from. See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.

Defaults to unset
|===


.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PATCH`

Description::
  partially update the specified Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `dryRun`
| `string`
| When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
| `fieldManager`
| `string`
| fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint. This field is required for apply requests (application/apply-patch) but optional for non-apply patch types (JsonPatch, MergePatch, StrategicMergePatch).
| `fieldValidation`
| `string`
| fieldValidation instructs the server on how to handle objects in the request (POST/PUT/PATCH) containing unknown or duplicate fields. Valid values are: - Ignore: This will ignore any unknown fields that are silently dropped from the object, and will ignore all but the last duplicate field that the decoder encounters. This is the default behavior prior to v1.23. - Warn: This will send a warning via the standard warning response header for each unknown field that is dropped from the object, and for each duplicate field that is encountered. The request will still succeed if there are no other errors, and will only persist the last of any duplicate fields. This is the default in v1.23+ - Strict: This will fail the request with a BadRequest error if any unknown fields would be dropped from the object, or if any duplicate fields are present. The error returned from the server will contain all unknown and duplicate fields encountered.
| `force`
| `boolean`
| Force is going to "force" Apply requests. It means user will re-acquire conflicting fields owned by other people. Force flag must be unset for non-apply patch requests.
|===

.Body parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `body`
| xref:../objects/index.adoc#io.k8s.apimachinery.pkg.apis.meta.v1.Patch[`Patch`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PUT`

Description::
  replace the specified Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `dryRun`
| `string`
| When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
| `fieldManager`
| `string`
| fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint.
| `fieldValidation`
| `string`
| fieldValidation instructs the server on how to handle objects in the request (POST/PUT/PATCH) containing unknown or duplicate fields. Valid values are: - Ignore: This will ignore any unknown fields that are silently dropped from the object, and will ignore all but the last duplicate field that the decoder encounters. This is the default behavior prior to v1.23. - Warn: This will send a warning via the standard warning response header for each unknown field that is dropped from the object, and for each duplicate field that is encountered. The request will still succeed if there are no other errors, and will only persist the last of any duplicate fields. This is the default in v1.23+ - Strict: This will fail the request with a BadRequest error if any unknown fields would be dropped from the object, or if any duplicate fields are present. The error returned from the server will contain all unknown and duplicate fields encountered.
|===

.Body parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `body`
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 201 - Created
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 401 - Unauthorized
| Empty
|===


=== /apis/config.openshift.io/v1/schedulers/{name}/status

.Global path parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `name`
| `string`
| name of the Scheduler
|===

.Global query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `pretty`
| `string`
| If 'true', then the output is pretty printed.
|===

HTTP method::
  `GET`

Description::
  read status of the specified Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `resourceVersion`
| `string`
| resourceVersion sets a constraint on what resource versions a request may be served from. See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.

Defaults to unset
|===


.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PATCH`

Description::
  partially update status of the specified Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `dryRun`
| `string`
| When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
| `fieldManager`
| `string`
| fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint. This field is required for apply requests (application/apply-patch) but optional for non-apply patch types (JsonPatch, MergePatch, StrategicMergePatch).
| `fieldValidation`
| `string`
| fieldValidation instructs the server on how to handle objects in the request (POST/PUT/PATCH) containing unknown or duplicate fields. Valid values are: - Ignore: This will ignore any unknown fields that are silently dropped from the object, and will ignore all but the last duplicate field that the decoder encounters. This is the default behavior prior to v1.23. - Warn: This will send a warning via the standard warning response header for each unknown field that is dropped from the object, and for each duplicate field that is encountered. The request will still succeed if there are no other errors, and will only persist the last of any duplicate fields. This is the default in v1.23+ - Strict: This will fail the request with a BadRequest error if any unknown fields would be dropped from the object, or if any duplicate fields are present. The error returned from the server will contain all unknown and duplicate fields encountered.
| `force`
| `boolean`
| Force is going to "force" Apply requests. It means user will re-acquire conflicting fields owned by other people. Force flag must be unset for non-apply patch requests.
|===

.Body parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `body`
| xref:../objects/index.adoc#io.k8s.apimachinery.pkg.apis.meta.v1.Patch[`Patch`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PUT`

Description::
  replace status of the specified Scheduler


.Query parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `dryRun`
| `string`
| When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
| `fieldManager`
| `string`
| fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint.
| `fieldValidation`
| `string`
| fieldValidation instructs the server on how to handle objects in the request (POST/PUT/PATCH) containing unknown or duplicate fields. Valid values are: - Ignore: This will ignore any unknown fields that are silently dropped from the object, and will ignore all but the last duplicate field that the decoder encounters. This is the default behavior prior to v1.23. - Warn: This will send a warning via the standard warning response header for each unknown field that is dropped from the object, and for each duplicate field that is encountered. The request will still succeed if there are no other errors, and will only persist the last of any duplicate fields. This is the default in v1.23+ - Strict: This will fail the request with a BadRequest error if any unknown fields would be dropped from the object, or if any duplicate fields are present. The error returned from the server will contain all unknown and duplicate fields encountered.
|===

.Body parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `body`
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 201 - Created
| xref:../config_apis/scheduler-config-openshift-io-v1.adoc#scheduler-config-openshift-io-v1[`Scheduler`] schema
| 401 - Unauthorized
| Empty
|===

