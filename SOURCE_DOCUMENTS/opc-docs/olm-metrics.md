// Module included in the following assemblies:
//
// * operators/understanding/olm/olm-understanding-olm.adoc

[id="olm-metrics_{context}"]
= Exposed metrics

Operator Lifecycle Manager (OLM) exposes certain OLM-specific resources for use by the Prometheus-based {product-title} cluster monitoring stack.

.Metrics exposed by OLM
[cols="2a,8a",options="header"]
|===
|Name |Description

|`catalog_source_count`
|Number of catalog sources.

|`catalogsource_ready`
|State of a catalog source. The value `1` indicates that the catalog source is in a `READY` state. The value of `0` indicates that the catalog source is not in a `READY` state.

|`csv_abnormal`
|When reconciling a cluster service version (CSV), present whenever a CSV version is in any state other than `Succeeded`, for example when it is not installed. Includes the `name`, `namespace`, `phase`, `reason`, and `version` labels. A Prometheus alert is created when this metric is present.

|`csv_count`
|Number of CSVs successfully registered.

|`csv_succeeded`
|When reconciling a CSV, represents whether a CSV version is in a `Succeeded` state (value `1`) or not (value `0`). Includes the `name`, `namespace`, and `version` labels.

|`csv_upgrade_count`
|Monotonic count of CSV upgrades.

|`install_plan_count`
|Number of install plans.

|`installplan_warnings_total`
|Monotonic count of warnings generated by resources, such as deprecated resources, included in an install plan.

|`olm_resolution_duration_seconds`
|The duration of a dependency resolution attempt.

|`subscription_count`
|Number of subscriptions.

|`subscription_sync_total`
|Monotonic count of subscription syncs. Includes the `channel`, `installed` CSV, and subscription `name` labels.

|===
