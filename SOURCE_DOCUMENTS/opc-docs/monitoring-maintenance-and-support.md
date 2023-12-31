// Module included in the following assemblies:
//
// * monitoring/configuring-the-monitoring-stack.adoc

[id="maintenance-and-support_{context}"]
= Maintenance and support for monitoring

The supported way of configuring {product-title} Monitoring is by configuring it using the options described in this document. *Do not use other configurations, as they are unsupported.* Configuration paradigms might change across Prometheus releases, and such cases can only be handled gracefully if all configuration possibilities are controlled. If you use configurations other than those described in this section, your changes will disappear because the `cluster-monitoring-operator` reconciles any differences. The Operator resets everything to the defined state by default and by design.

ifdef::openshift-dedicated,openshift-rosa[]
[IMPORTANT]
====
Installing another Prometheus instance is not supported by the Red Hat Site Reliability Engineers (SRE).
====
endif::openshift-dedicated,openshift-rosa[]
