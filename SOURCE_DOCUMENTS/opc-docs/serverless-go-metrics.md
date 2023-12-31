// Module included in the following assemblies:
//
// * serverless/admin_guide/serverless-admin-metrics.adoc

:_mod-docs-content-type: REFERENCE
[id="serverless-go-metrics_{context}"]
= Go runtime metrics

Each Knative Serving control plane process emits a number of Go runtime memory statistics (link:https://golang.org/pkg/runtime/#MemStats[MemStats]).

[NOTE]
====
The `name` tag for each metric is an empty tag.
====

[cols=5*,options="header"]
|===
|Metric name
|Description
|Type
|Tags
|Unit

|`go_alloc`
|The number of bytes of allocated heap objects. This metric is the same as `heap_alloc`.
|Gauge
|`name`
|Integer (no units)

|`go_total_alloc`
|The cumulative bytes allocated for heap objects.
|Gauge
|`name`
|Integer (no units)

|`go_sys`
|The total bytes of memory obtained from the operating system.
|Gauge
|`name`
|Integer (no units)

|`go_lookups`
|The number of pointer lookups performed by the runtime.
|Gauge
|`name`
|Integer (no units)

|`go_mallocs`
|The cumulative count of heap objects allocated.
|Gauge
|`name`
|Integer (no units)

|`go_frees`
|The cumulative count of heap objects that have been freed.
|Gauge
|`name`
|Integer (no units)

|`go_heap_alloc`
|The number of bytes of allocated heap objects.
|Gauge
|`name`
|Integer (no units)

|`go_heap_sys`
|The number of bytes of heap memory obtained from the operating system.
|Gauge
|`name`
|Integer (no units)

|`go_heap_idle`
|The number of bytes in idle, unused spans.
|Gauge
|`name`
|Integer (no units)

|`go_heap_in_use`
|The number of bytes in spans that are currently in use.
|Gauge
|`name`
|Integer (no units)

|`go_heap_released`
|The number of bytes of physical memory returned to the operating system.
|Gauge
|`name`
|Integer (no units)

|`go_heap_objects`
|The number of allocated heap objects.
|Gauge
|`name`
|Integer (no units)

|`go_stack_in_use`
|The number of bytes in stack spans that are currently in use.
|Gauge
|`name`
|Integer (no units)

|`go_stack_sys`
|The number of bytes of stack memory obtained from the operating system.
|Gauge
|`name`
|Integer (no units)

|`go_mspan_in_use`
|The number of bytes of allocated `mspan` structures.
|Gauge
|`name`
|Integer (no units)

|`go_mspan_sys`
|The number of bytes of memory obtained from the operating system for `mspan` structures.
|Gauge
|`name`
|Integer (no units)

|`go_mcache_in_use`
|The number of bytes of allocated `mcache` structures.
|Gauge
|`name`
|Integer (no units)

|`go_mcache_sys`
|The number of bytes of memory obtained from the operating system for `mcache` structures.
|Gauge
|`name`
|Integer (no units)

|`go_bucket_hash_sys`
|The number of bytes of memory in profiling bucket hash tables.
|Gauge
|`name`
|Integer (no units)

|`go_gc_sys`
|The number of bytes of memory in garbage collection metadata.
|Gauge
|`name`
|Integer (no units)

|`go_other_sys`
|The number of bytes of memory in miscellaneous, off-heap runtime allocations.
|Gauge
|`name`
|Integer (no units)

|`go_next_gc`
|The target heap size of the next garbage collection cycle.
|Gauge
|`name`
|Integer (no units)

|`go_last_gc`
|The time that the last garbage collection was completed in link:https://en.wikipedia.org/wiki/Unix_time[_Epoch_ or Unix time].
|Gauge
|`name`
|Nanoseconds

|`go_total_gc_pause_ns`
|The cumulative time in garbage collection _stop-the-world_ pauses since the program started.
|Gauge
|`name`
|Nanoseconds

|`go_num_gc`
|The number of completed garbage collection cycles.
|Gauge
|`name`
|Integer (no units)

|`go_num_forced_gc`
|The number of garbage collection cycles that were forced due to an application calling the garbage collection function.
|Gauge
|`name`
|Integer (no units)

|`go_gc_cpu_fraction`
|The fraction of the available CPU time of the program that has been used by the garbage collector since the program started.
|Gauge
|`name`
|Integer (no units)
|===
