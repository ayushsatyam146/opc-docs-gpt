:_mod-docs-content-type: ASSEMBLY
[id="dedicated-aws-access"]
= Accessing AWS infrastructure
include::_attributes/common-attributes.adoc[]
:context: dedicated-aws-access

toc::[]

Amazon Web Services (AWS) infrastructure access allows
link:https://access.redhat.com/node/3610411[Customer Portal Organization Administrators]
and cluster owners to enable AWS Identity and Access Management (IAM) users to
have federated access to the AWS Management Console for their {product-title}
cluster. Administrators can select between Network Management or Read-only
access options.

[id="dedicated-configuring-aws-access"]
== Configuring AWS infrastructure access

== Prerequisites
* An AWS account with IAM permissions.

[id="dedicated-aws-account-creation"]
=== Creating an AWS account with IAM permissions

Before you can configure access to AWS infrastructure, you will need to set up IAM permissions in your AWS account.

.Procedure

. Log in to your AWS account. If necessary, you can create a new AWS account by following link:https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/[AWS documentation].
. Create an IAM user with `STS:AllowAssumeRole` permissions within the AWS account.
.. Open the IAM dashboard of the AWS Management Console.
.. In the *Policies* section, click *Create Policy*.
.. Select the `JSON` tab and replace the existing text with the following:
+
[source,json]
----
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "*"
        }
    ]
  }
----
.. Click *Review Policy*.
.. Provide an appropriate name and description, then click *Create Policy*.
.. In the *Users* section, click *Add user*.
.. Provide an appropriate user name.
.. Select *AWS Management Console access* and other roles as needed.
.. Adjust the password requirements as necessary for your organization, then click *Next: Policy*.
.. Click the *Attach existing policies directly* option.
.. Search for and check the policy created in previous steps.
+
[NOTE]
====
It is not recommended to set a permissions boundary.
====
.. Click *Next: Tags*, then click *Next: Review*. Confirm the configuration is correct.
.. Click *Create user*, then click *Close* on the success page.
. Gather the IAM user's Amazon Resource Name (ARN). The ARN will have the following format: `arn:aws:iam::000111222333:user/username`.

[id=dedicated-aws-ocm-iam-role]
=== Granting the IAM role from {cluster-manager-first}

.Procedure

. Open the {product-title} Cluster Manager in your browser and select the cluster you want to allow AWS infrastructure access.
. Select the *Access control* tab, and scroll to the *AWS Infrastructure Access* section.
. Paste the AWS IAM ARN and select `Network Management` or `Read-only` permissions, then click *Grant role*.
. Copy the AWS OSD Console URL to your clipboard.
. Sign in to your AWS account with your Account ID or alias, IAM user name, and password.
. In a new browser tab, paste the AWS OSD Console URL that will be used to route to the AWS Switch Role page.
. Your account number and role will be filled in already. Choose a display name if necessary, then click *Switch Role*. You will now see *VPC* under *Recently visited services*.
