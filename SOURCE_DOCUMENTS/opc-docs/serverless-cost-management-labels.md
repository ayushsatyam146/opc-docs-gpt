// Module included in the following assemblies:
//
// * /serverless/integrations/serverless-cost-management-integration.adoc

:_mod-docs-content-type: REFERENCE
[id="serverless-cost-management-labels_{context}"]
= Using labels for cost management queries

Labels, also known as _tags_ in cost management, can be applied for nodes, namespaces or pods. Each label is a key and value pair. You can use a combination of multiple labels to generate reports. You can access reports about costs by using the link:https://console.redhat.com/openshift/cost-management/[Red Hat hybrid console].

Labels are inherited from nodes to namespaces, and from namespaces to pods. However, labels are not overridden if they already exist on a resource. For example, Knative services have a default `app=<revision_name>` label:

.Example Knative service default label
[source,yaml]
----
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: example-service
spec:
...
      labels:
        app: <revision_name>
...
----

If you define a label for a namespace, such as `app=my-domain`, the cost management service does not take into account costs coming from a Knative service with the tag `app=<revision_name>` when querying the application using the `app=my-domain` tag. Costs for Knative services that have this tag must be queried under the `app=<revision_name>` tag.
