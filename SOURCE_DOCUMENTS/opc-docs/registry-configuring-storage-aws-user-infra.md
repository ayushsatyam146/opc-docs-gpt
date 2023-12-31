// Module included in the following assemblies:
//
// * installing/installing_aws/installing-aws-user-infra.adoc
// * installing/installing_aws/installing-restricted-networks-aws.adoc
// * registry/configuring_registry_storage-aws-user-infrastructure.adoc

:_mod-docs-content-type: PROCEDURE
[id="registry-configuring-storage-aws-user-infra_{context}"]
= Configuring registry storage for AWS with user-provisioned infrastructure

During installation, your cloud credentials are sufficient to create an Amazon S3 bucket
and the Registry Operator will automatically configure storage.

If the Registry Operator cannot create an S3 bucket and automatically configure
storage, you can create an S3 bucket and configure storage with the following
procedure.

.Prerequisites

* You have a cluster on AWS with user-provisioned infrastructure.
* For Amazon S3 storage, the secret is expected to contain two keys:
** `REGISTRY_STORAGE_S3_ACCESSKEY`
** `REGISTRY_STORAGE_S3_SECRETKEY`

.Procedure

Use the following procedure if the Registry Operator cannot create an S3 bucket
and automatically configure storage.

. Set up a link:https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config[Bucket Lifecycle Policy]
to abort incomplete multipart uploads that are one day old.

. Fill in the storage configuration in
`configs.imageregistry.operator.openshift.io/cluster`:
+
[source,terminal]
----
$ oc edit configs.imageregistry.operator.openshift.io/cluster
----
+
.Example configuration
[source,yaml]
----
storage:
  s3:
    bucket: <bucket-name>
    region: <region-name>
----

[WARNING]
====
To secure your registry images in AWS, link:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-publicaccessblockconfiguration.html[block public access]
to the S3 bucket.
====
