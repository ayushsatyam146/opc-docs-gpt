// Module included in the following assemblies:
//
// * installing/installing_gcp/installing-gcp-user-infra-vpc.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-creating-gcp-shared-vpc-cluster-wide-firewall-rules_{context}"]
= Creating cluster-wide firewall rules for a shared VPC in GCP

You can create cluster-wide firewall rules to allow the access that the {product-title} cluster requires.

[WARNING]
====
If you do not choose to create firewall rules based on cluster events, you must create cluster-wide firewall rules.
====

.Prerequisites

* You exported the variables that the Deployment Manager templates require to deploy your cluster.
* You created the networking and load balancing components in GCP that your cluster requires.

.Procedure

. Add a single firewall rule to allow the Google Cloud Engine health checks to access all of the services. This rule enables the ingress load balancers to determine the health status of their instances.
+
[source,terminal]
----
$ gcloud compute firewall-rules create --allow='tcp:30000-32767,udp:30000-32767' --network="${CLUSTER_NETWORK}" --source-ranges='130.211.0.0/22,35.191.0.0/16,209.85.152.0/22,209.85.204.0/22' --target-tags="${INFRA_ID}-master,${INFRA_ID}-worker" ${INFRA_ID}-ingress-hc --account=${HOST_PROJECT_ACCOUNT} --project=${HOST_PROJECT}
----

. Add a single firewall rule to allow access to all cluster services:
+
--
** For an external cluster:
+
[source,terminal]
----
$ gcloud compute firewall-rules create --allow='tcp:80,tcp:443' --network="${CLUSTER_NETWORK}" --source-ranges="0.0.0.0/0" --target-tags="${INFRA_ID}-master,${INFRA_ID}-worker" ${INFRA_ID}-ingress --account=${HOST_PROJECT_ACCOUNT} --project=${HOST_PROJECT}
----
** For a private cluster:
+
[source,terminal]
----
$ gcloud compute firewall-rules create --allow='tcp:80,tcp:443' --network="${CLUSTER_NETWORK}" --source-ranges=${NETWORK_CIDR} --target-tags="${INFRA_ID}-master,${INFRA_ID}-worker" ${INFRA_ID}-ingress --account=${HOST_PROJECT_ACCOUNT} --project=${HOST_PROJECT}
----
--
+
Because this rule only allows traffic on TCP ports `80` and `443`, ensure that you add all the ports that your services use.
