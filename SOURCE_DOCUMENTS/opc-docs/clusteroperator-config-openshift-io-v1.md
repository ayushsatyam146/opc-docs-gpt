// Automatically generated by 'openshift-apidocs-gen'. Do not edit.
:_mod-docs-content-type: ASSEMBLY
[id="clusteroperator-config-openshift-io-v1"]
= ClusterOperator [config.openshift.io/v1]
:toc: macro
:toc-title:

toc::[]


Description::
+
--
ClusterOperator is the Custom Resource object which holds the current state of an operator. This object is used by operators to convey their state to the rest of the cluster.
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
| spec holds configuration that could apply to any operator.

| `status`
| `object`
| status holds the information about the state of an operator.  It is consistent with status information across the Kubernetes ecosystem.

|===
=== .spec
Description::
+
--
spec holds configuration that could apply to any operator.
--

Type::
  `object`




=== .status
Description::
+
--
status holds the information about the state of an operator.  It is consistent with status information across the Kubernetes ecosystem.
--

Type::
  `object`




[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `conditions`
| `array`
| conditions describes the state of the operator's managed and monitored components.

| `conditions[]`
| `object`
| ClusterOperatorStatusCondition represents the state of the operator's managed and monitored components.

| `extension`
| ``
| extension contains any additional status information specific to the operator which owns this status object.

| `relatedObjects`
| `array`
| relatedObjects is a list of objects that are "interesting" or related to this operator.  Common uses are: 1. the detailed resource driving the operator 2. operator namespaces 3. operand namespaces

| `relatedObjects[]`
| `object`
| ObjectReference contains enough information to let you inspect or modify the referred object.

| `versions`
| `array`
| versions is a slice of operator and operand version tuples.  Operators which manage multiple operands will have multiple operand entries in the array.  Available operators must report the version of the operator itself with the name "operator". An operator reports a new "operator" version when it has rolled out the new version to all of its operands.

| `versions[]`
| `object`
|

|===
=== .status.conditions
Description::
+
--
conditions describes the state of the operator's managed and monitored components.
--

Type::
  `array`




=== .status.conditions[]
Description::
+
--
ClusterOperatorStatusCondition represents the state of the operator's managed and monitored components.
--

Type::
  `object`

Required::
  - `lastTransitionTime`
  - `status`
  - `type`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `lastTransitionTime`
| `string`
| lastTransitionTime is the time of the last update to the current status property.

| `message`
| `string`
| message provides additional information about the current condition. This is only to be consumed by humans.  It may contain Line Feed characters (U+000A), which should be rendered as new lines.

| `reason`
| `string`
| reason is the CamelCase reason for the condition's current status.

| `status`
| `string`
| status of the condition, one of True, False, Unknown.

| `type`
| `string`
| type specifies the aspect reported by this condition.

|===
=== .status.relatedObjects
Description::
+
--
relatedObjects is a list of objects that are "interesting" or related to this operator.  Common uses are: 1. the detailed resource driving the operator 2. operator namespaces 3. operand namespaces
--

Type::
  `array`




=== .status.relatedObjects[]
Description::
+
--
ObjectReference contains enough information to let you inspect or modify the referred object.
--

Type::
  `object`

Required::
  - `group`
  - `name`
  - `resource`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `group`
| `string`
| group of the referent.

| `name`
| `string`
| name of the referent.

| `namespace`
| `string`
| namespace of the referent.

| `resource`
| `string`
| resource of the referent.

|===
=== .status.versions
Description::
+
--
versions is a slice of operator and operand version tuples.  Operators which manage multiple operands will have multiple operand entries in the array.  Available operators must report the version of the operator itself with the name "operator". An operator reports a new "operator" version when it has rolled out the new version to all of its operands.
--

Type::
  `array`




=== .status.versions[]
Description::
+
--

--

Type::
  `object`

Required::
  - `name`
  - `version`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `name`
| `string`
| name is the name of the particular operand this version is for.  It usually matches container images, not operators.

| `version`
| `string`
| version indicates which version of a particular operand is currently being managed.  It must always match the Available operand.  If 1.0.0 is Available, then this must indicate 1.0.0 even if the operator is trying to rollout 1.1.0

|===

== API endpoints

The following API endpoints are available:

* `/apis/config.openshift.io/v1/clusteroperators`
- `DELETE`: delete collection of ClusterOperator
- `GET`: list objects of kind ClusterOperator
- `POST`: create a ClusterOperator
* `/apis/config.openshift.io/v1/clusteroperators/{name}`
- `DELETE`: delete a ClusterOperator
- `GET`: read the specified ClusterOperator
- `PATCH`: partially update the specified ClusterOperator
- `PUT`: replace the specified ClusterOperator
* `/apis/config.openshift.io/v1/clusteroperators/{name}/status`
- `GET`: read status of the specified ClusterOperator
- `PATCH`: partially update status of the specified ClusterOperator
- `PUT`: replace status of the specified ClusterOperator


=== /apis/config.openshift.io/v1/clusteroperators


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
  delete collection of ClusterOperator


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
  list objects of kind ClusterOperator


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
| xref:../objects/index.adoc#io.openshift.config.v1.ClusterOperatorList[`ClusterOperatorList`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `POST`

Description::
  create a ClusterOperator


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
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 201 - Created
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 202 - Accepted
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 401 - Unauthorized
| Empty
|===


=== /apis/config.openshift.io/v1/clusteroperators/{name}

.Global path parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `name`
| `string`
| name of the ClusterOperator
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
  delete a ClusterOperator


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
  read the specified ClusterOperator


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
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PATCH`

Description::
  partially update the specified ClusterOperator


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
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PUT`

Description::
  replace the specified ClusterOperator


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
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 201 - Created
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 401 - Unauthorized
| Empty
|===


=== /apis/config.openshift.io/v1/clusteroperators/{name}/status

.Global path parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `name`
| `string`
| name of the ClusterOperator
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
  read status of the specified ClusterOperator


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
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PATCH`

Description::
  partially update status of the specified ClusterOperator


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
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PUT`

Description::
  replace status of the specified ClusterOperator


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
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 201 - Created
| xref:../config_apis/clusteroperator-config-openshift-io-v1.adoc#clusteroperator-config-openshift-io-v1[`ClusterOperator`] schema
| 401 - Unauthorized
| Empty
|===

