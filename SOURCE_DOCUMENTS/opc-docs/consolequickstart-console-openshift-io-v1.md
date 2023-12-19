// Automatically generated by 'openshift-apidocs-gen'. Do not edit.
:_mod-docs-content-type: ASSEMBLY
[id="consolequickstart-console-openshift-io-v1"]
= ConsoleQuickStart [console.openshift.io/v1]
:toc: macro
:toc-title:

toc::[]


Description::
+
--
ConsoleQuickStart is an extension for guiding user through various workflows in the OpenShift web console.
 Compatibility level 2: Stable within a major release for a minimum of 9 months or 3 minor releases (whichever is longer).
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
| ConsoleQuickStartSpec is the desired quick start configuration.

|===
=== .spec
Description::
+
--
ConsoleQuickStartSpec is the desired quick start configuration.
--

Type::
  `object`

Required::
  - `description`
  - `displayName`
  - `durationMinutes`
  - `introduction`
  - `tasks`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `accessReviewResources`
| `array`
| accessReviewResources contains a list of resources that the user's access will be reviewed against in order for the user to complete the Quick Start. The Quick Start will be hidden if any of the access reviews fail.

| `accessReviewResources[]`
| `object`
| ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface

| `conclusion`
| `string`
| conclusion sums up the Quick Start and suggests the possible next steps. (includes markdown)

| `description`
| `string`
| description is the description of the Quick Start. (includes markdown)

| `displayName`
| `string`
| displayName is the display name of the Quick Start.

| `durationMinutes`
| `integer`
| durationMinutes describes approximately how many minutes it will take to complete the Quick Start.

| `icon`
| `string`
| icon is a base64 encoded image that will be displayed beside the Quick Start display name. The icon should be an vector image for easy scaling. The size of the icon should be 40x40.

| `introduction`
| `string`
| introduction describes the purpose of the Quick Start. (includes markdown)

| `nextQuickStart`
| `array (string)`
| nextQuickStart is a list of the following Quick Starts, suggested for the user to try.

| `prerequisites`
| `array (string)`
| prerequisites contains all prerequisites that need to be met before taking a Quick Start. (includes markdown)

| `tags`
| `array (string)`
| tags is a list of strings that describe the Quick Start.

| `tasks`
| `array`
| tasks is the list of steps the user has to perform to complete the Quick Start.

| `tasks[]`
| `object`
| ConsoleQuickStartTask is a single step in a Quick Start.

|===
=== .spec.accessReviewResources
Description::
+
--
accessReviewResources contains a list of resources that the user's access will be reviewed against in order for the user to complete the Quick Start. The Quick Start will be hidden if any of the access reviews fail.
--

Type::
  `array`




=== .spec.accessReviewResources[]
Description::
+
--
ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface
--

Type::
  `object`




[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `group`
| `string`
| Group is the API Group of the Resource.  "*" means all.

| `name`
| `string`
| Name is the name of the resource being requested for a "get" or deleted for a "delete". "" (empty) means all.

| `namespace`
| `string`
| Namespace is the namespace of the action being requested.  Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview

| `resource`
| `string`
| Resource is one of the existing resource types.  "*" means all.

| `subresource`
| `string`
| Subresource is one of the existing resource types.  "" means none.

| `verb`
| `string`
| Verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.  "*" means all.

| `version`
| `string`
| Version is the API Version of the Resource.  "*" means all.

|===
=== .spec.tasks
Description::
+
--
tasks is the list of steps the user has to perform to complete the Quick Start.
--

Type::
  `array`




=== .spec.tasks[]
Description::
+
--
ConsoleQuickStartTask is a single step in a Quick Start.
--

Type::
  `object`

Required::
  - `description`
  - `title`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `description`
| `string`
| description describes the steps needed to complete the task. (includes markdown)

| `review`
| `object`
| review contains instructions to validate the task is complete. The user will select 'Yes' or 'No'. using a radio button, which indicates whether the step was completed successfully.

| `summary`
| `object`
| summary contains information about the passed step.

| `title`
| `string`
| title describes the task and is displayed as a step heading.

|===
=== .spec.tasks[].review
Description::
+
--
review contains instructions to validate the task is complete. The user will select 'Yes' or 'No'. using a radio button, which indicates whether the step was completed successfully.
--

Type::
  `object`

Required::
  - `failedTaskHelp`
  - `instructions`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `failedTaskHelp`
| `string`
| failedTaskHelp contains suggestions for a failed task review and is shown at the end of task. (includes markdown)

| `instructions`
| `string`
| instructions contains steps that user needs to take in order to validate his work after going through a task. (includes markdown)

|===
=== .spec.tasks[].summary
Description::
+
--
summary contains information about the passed step.
--

Type::
  `object`

Required::
  - `failed`
  - `success`



[cols="1,1,1",options="header"]
|===
| Property | Type | Description

| `failed`
| `string`
| failed briefly describes the unsuccessfully passed task. (includes markdown)

| `success`
| `string`
| success describes the succesfully passed task.

|===

== API endpoints

The following API endpoints are available:

* `/apis/console.openshift.io/v1/consolequickstarts`
- `DELETE`: delete collection of ConsoleQuickStart
- `GET`: list objects of kind ConsoleQuickStart
- `POST`: create a ConsoleQuickStart
* `/apis/console.openshift.io/v1/consolequickstarts/{name}`
- `DELETE`: delete a ConsoleQuickStart
- `GET`: read the specified ConsoleQuickStart
- `PATCH`: partially update the specified ConsoleQuickStart
- `PUT`: replace the specified ConsoleQuickStart


=== /apis/console.openshift.io/v1/consolequickstarts


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
  delete collection of ConsoleQuickStart


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
  list objects of kind ConsoleQuickStart


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
| xref:../objects/index.adoc#io.openshift.console.v1.ConsoleQuickStartList[`ConsoleQuickStartList`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `POST`

Description::
  create a ConsoleQuickStart


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
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
| 201 - Created
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
| 202 - Accepted
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
| 401 - Unauthorized
| Empty
|===


=== /apis/console.openshift.io/v1/consolequickstarts/{name}

.Global path parameters
[cols="1,1,2",options="header"]
|===
| Parameter | Type | Description
| `name`
| `string`
| name of the ConsoleQuickStart
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
  delete a ConsoleQuickStart


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
  read the specified ConsoleQuickStart


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
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PATCH`

Description::
  partially update the specified ConsoleQuickStart


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
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
| 401 - Unauthorized
| Empty
|===

HTTP method::
  `PUT`

Description::
  replace the specified ConsoleQuickStart


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
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
|
|===

.HTTP responses
[cols="1,1",options="header"]
|===
| HTTP code | Reponse body
| 200 - OK
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
| 201 - Created
| xref:../console_apis/consolequickstart-console-openshift-io-v1.adoc#consolequickstart-console-openshift-io-v1[`ConsoleQuickStart`] schema
| 401 - Unauthorized
| Empty
|===

