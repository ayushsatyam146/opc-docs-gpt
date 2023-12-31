// Module included in the following assemblies:
//
// * serverless/monitor/cluster-logging-serverless.adoc

:_mod-docs-content-type: PROCEDURE
[id="using-cluster-logging-to-find-logs-for-services-deployed-with-knative-serving_{context}"]
= Using OpenShift Logging to find logs for services deployed with Knative Serving

With OpenShift Logging, the logs that your applications write to the console are collected in Elasticsearch. The following procedure outlines how to apply these capabilities to applications deployed by using Knative Serving.

.Prerequisites

* Install the OpenShift CLI (`oc`).

.Procedure

. Get the Kibana route:
+
[source,terminal]
----
$ oc -n openshift-logging get route kibana
----

. Use the route's URL to navigate to the Kibana dashboard and log in.

. Check that the index is set to *.all*. If the index is not set to *.all*, only the OpenShift system logs will be listed.

. Filter the logs by using the `knative-serving` namespace. Enter a filter for the service in the search box to filter results.
+
.Example filter
[source,terminal]
----
kubernetes.namespace_name:default AND kubernetes.labels.serving_knative_dev\/service:{service_name}
----
+
You can also filter by using `/configuration` or `/revision`.

. Narrow your search by using `kubernetes.container_name:<user_container>` to only display the logs generated by your application. Otherwise, you will see logs from the queue-proxy.

[NOTE]
====
Use JSON-based structured logging in your application to allow for the quick filtering of these logs in production environments.
====
