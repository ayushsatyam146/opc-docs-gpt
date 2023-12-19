// Module included in the following assemblies:
//
// * logging/logging_alerts/default-logging-alerts.adoc

:_mod-docs-content-type: REFERENCE
[id="logging-fluentd-collector-alerts_{context}"]
= Fluentd collector alerts

The following alerts are generated by the legacy Fluentd log collector. You can view these alerts in the {product-title} web console.

.Fluentd collector alerts
[cols="2,2,2,1",options="header"]
|===
|Alert |Message |Description |Severity

|`FluentDHighErrorRate`
|`<value> of records have resulted in an error by fluentd <instance>.`
|The number of FluentD output errors is high, by default more than 10 in the previous 15 minutes.
|Warning

|`FluentdNodeDown`
|`Prometheus could not scrape fluentd <instance> for more than 10m.`
|Fluentd is reporting that Prometheus could not scrape a specific Fluentd instance.
|Critical

|`FluentdQueueLengthIncreasing`
|`In the last 1h, fluentd <instance> buffer queue length constantly increased more than 1. Current value is <value>.`
|Fluentd is reporting that the queue size is increasing.
|Warning

|`FluentDVeryHighErrorRate`
|`<value> of records have resulted in an error by fluentd <instance>.`
|The number of FluentD output errors is very high, by default more than 25 in the previous 15 minutes.
|Critical

|===