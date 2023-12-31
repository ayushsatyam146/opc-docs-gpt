// Module included in the following assemblies:
//
// * welcome/accessing-your-services.adoc

[id="dedicated-exposing-TCP-services_{context}"]
= Exposing TCP services

{product-title} routes expose applications by proxying traffic through
HTTP/HTTPS(SNI)/TLS(SNI) to pods and services. A
link:https://kubernetes.io/docs/concepts/services-networking/#loadbalancer[LoadBalancer]
service creates an Elastic Load Balancing (ELB) load balancer for your {product-title}
cluster, enabling direct TCP access to applications exposed by your LoadBalancer
service.

[NOTE]
====
LoadBalancer services require an additional purchase. Contact your sales team if
you are interested in using LoadBalancer services for your {product-title}
cluster.
====

== Checking your LoadBalancer Quota

By purchasing LoadBalancer services, you are provided with a quota of
LoadBalancers available for your {product-title} cluster.

[source,terminal]
----
$ oc describe clusterresourcequota loadbalancer-quota
----

.Example output
[source,text]
----
Name:       loadbalancer-quota
Labels:     <none>
...
Resource        Used    Hard
--------        ----    ----
services.loadbalancers  0   4
----

== Exposing TCP service

You can expose your applications over an external LoadBalancer service, enabling
access over the public internet.

[source,terminal]
----
$ oc expose dc httpd-example --type=LoadBalancer --name=lb-service
----

.Example output
[source,text]
----
service/lb-service created
----

== Creating an internal-only TCP service

You can alternatively expose your applications internally only, enabling access
only through AWS VPC Peering or a VPN connection.

[source,terminal]
----
$ oc expose dc httpd-example --type=LoadBalancer --name=internal-lb --dry-run -o yaml | awk '1;/metadata:/{ print "  annotations:\n    service.beta.kubernetes.io/aws-load-balancer-internal: \"true\"" }' | oc create -f -
----

.Example output
[source,terminal]
----
service/internal-lb created
----

== Enabling LoadBalancer access logs

You may, optionally, create an S3 bucket within your own AWS account, and configure the LoadBalancer service to send access logs to this S3 bucket at predefined intervals.

=== Prerequisites

You must first create the S3 bucket within your own AWS account, in the same AWS region that your {product-title} cluster is deployed. This S3 bucket can be configured with all public access blocked, including system permissions. After your S3 bucket is created, you must attach a policy to your bucket as https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html#attach-bucket-policy[outlined by AWS].

=== Configuring the LoadBalancer service

Update and apply the following annotations to your service YAML definition, prior to creating the object in your cluster.

[source,yaml]
----
metadata:
  name: my-service
  annotations:
    # Specifies whether access logs are enabled for the load balancer
    service.beta.kubernetes.io/aws-load-balancer-access-log-enabled: "true"
    # The interval for publishing the access logs. You can specify an interval of either 5 or 60 (minutes).
    service.beta.kubernetes.io/aws-load-balancer-access-log-emit-interval: "60"
    # The name of the Amazon S3 bucket where the access logs are stored
    service.beta.kubernetes.io/aws-load-balancer-access-log-s3-bucket-name: "my-bucket"
    # The logical hierarchy you created for your Amazon S3 bucket, for example `my-bucket-prefix/prod`
    # This must match the prefix specified in the S3 policy
    service.beta.kubernetes.io/aws-load-balancer-access-log-s3-bucket-prefix: "my-bucket-prefix/prod"
----

=== Creating the LoadBalancer service

Once the annotations have been saved into a YAML file, you can create it from the command line:

[source,terminal]
----
$ oc create -f loadbalancer.yaml
----

.Example output
[source,text]
----
service/my-service created
----

== Using your TCP Service

Once your LoadBalancer service is created, you can access your service by using
the URL provided to you by {product-title}. The `LoadBalancer Ingress` value is
a URL unique to your service that remains static as long as the service is not
deleted. If you prefer to use a custom domain, you can create a CNAME DNS record
for this URL.

[source,terminal]
----
$ oc describe svc lb-service
----

.Example output
[source,text]
----
Name:                     lb-service
Namespace:                default
Labels:                   app=httpd-example
Annotations:              <none>
Selector:                 name=httpd-example
Type:                     LoadBalancer
IP:                       10.120.182.252
LoadBalancer Ingress:     a5387ba36201e11e9ba901267fd7abb0-1406434805.us-east-1.elb.amazonaws.com
Port:                     <unset>  8080/TCP
TargetPort:               8080/TCP
NodePort:                 <unset>  31409/TCP
Endpoints:                <none>
Session Affinity:         None
External Traffic Policy:  Cluster
----
