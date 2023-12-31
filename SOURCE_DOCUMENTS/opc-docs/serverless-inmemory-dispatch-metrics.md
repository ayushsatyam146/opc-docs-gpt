// Module included in the following assemblies:
//
// * serverless/admin_guide/serverless-admin-metrics.adoc

:_mod-docs-content-type: REFERENCE
[id="serverless-inmemory-dispatch-metrics_{context}"]
= InMemoryChannel dispatcher metrics

You can use the following metrics to debug `InMemoryChannel` channels, see how they are performing, and see which events are being dispatched by the channels.

[cols=5*,options="header"]
|===
|Metric name
|Description
|Type
|Tags
|Unit

|`event_count`
|Number of events dispatched by `InMemoryChannel` channels.
|Counter
|`broker_name`, `container_name`, `filter_type`, `namespace_name`, `response_code`, `response_code_class`, `trigger_name`, `unique_name`
|Integer (no units)

|`event_dispatch_latencies`
|The time taken to dispatch an event from an `InMemoryChannel` channel.
|Histogram
|`broker_name`, `container_name`, `filter_type`, `namespace_name`, `response_code`, `response_code_class`, `trigger_name`, `unique_name`
|Milliseconds
|===
