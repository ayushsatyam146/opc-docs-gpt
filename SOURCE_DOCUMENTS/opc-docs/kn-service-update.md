// Module included in the following assemblies:
//
// * serverless/reference/kn-serving-ref.adoc

:_mod-docs-content-type: REFERENCE
[id="kn-service-update_{context}"]
= Updating serverless applications by using the Knative CLI

You can use the `kn service update` command for interactive sessions on the command line as you build up a service incrementally. In contrast to the `kn service apply` command, when using the `kn service update` command you only have to specify the changes that you want to update, rather than the full configuration for the Knative service.

.Example commands

* Update a service by adding a new environment variable:
+
[source,terminal]
----
$ kn service update <service_name> --env <key>=<value>
----

* Update a service by adding a new port:
+
[source,terminal]
----
$ kn service update <service_name> --port 80
----

* Update a service by adding new request and limit parameters:
+
[source,terminal]
----
$ kn service update <service_name> --request cpu=500m --limit memory=1024Mi --limit cpu=1000m
----

* Assign the `latest` tag to a revision:
+
[source,terminal]
----
$ kn service update <service_name> --tag <revision_name>=latest
----

* Update a tag from `testing` to `staging` for the latest `READY` revision of a service:
+
[source,terminal]
----
$ kn service update <service_name> --untag testing --tag @latest=staging
----

* Add the `test` tag to a revision that receives 10% of traffic, and send the rest of the traffic to the latest `READY` revision of a service:
+
[source,terminal]
----
$ kn service update <service_name> --tag <revision_name>=test --traffic test=10,@latest=90
----
