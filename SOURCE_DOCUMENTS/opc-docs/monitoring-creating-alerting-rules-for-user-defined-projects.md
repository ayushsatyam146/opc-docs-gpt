// Module included in the following assemblies:
//
// * monitoring/managing-alerts.adoc

:_mod-docs-content-type: PROCEDURE
[id="creating-alerting-rules-for-user-defined-projects_{context}"]
= Creating alerting rules for user-defined projects

You can create alerting rules for user-defined projects. Those alerting rules will trigger alerts based on the values of the chosen metrics.

.Prerequisites

* You have enabled monitoring for user-defined projects.
* You are logged in as a user that has the `monitoring-rules-edit` cluster role for the project where you want to create an alerting rule.
* You have installed the OpenShift CLI (`oc`).

.Procedure

. Create a YAML file for alerting rules. In this example, it is called `example-app-alerting-rule.yaml`.

. Add an alerting rule configuration to the YAML file. For example:
+
[NOTE]
====
When you create an alerting rule, a project label is enforced on it if a rule with the same name exists in another project.
====
+
[source,yaml]
----
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: example-alert
  namespace: ns1
spec:
  groups:
  - name: example
    rules:
    - alert: VersionAlert
      expr: version{job="prometheus-example-app"} == 0
----
+
This configuration creates an alerting rule named `example-alert`. The alerting rule fires an alert when the `version` metric exposed by the sample service becomes `0`.

. Apply the configuration file to the cluster:
+
[source,terminal]
----
$ oc apply -f example-app-alerting-rule.yaml
----