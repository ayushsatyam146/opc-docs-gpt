// Module included in the following assemblies:
//
// * installing/installing_aws/installing-aws-user-infra.adoc
// * installing/installing_aws/installing-restricted-networks-aws.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-aws-user-infra-delete-bootstrap_{context}"]
= Deleting the bootstrap resources

After you complete the initial Operator configuration for the cluster, remove the bootstrap resources from Amazon Web Services (AWS).

.Prerequisites

* You completed the initial Operator configuration for your cluster.

.Procedure

. Delete the bootstrap resources. If you used the CloudFormation template,
link:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-delete-stack.html[delete its stack]:
** Delete the stack by using the AWS CLI:
+
[source,terminal]
----
$ aws cloudformation delete-stack --stack-name <name> <1>
----
<1> `<name>` is the name of your bootstrap stack.
** Delete the stack by using the link:https://console.aws.amazon.com/cloudformation/[AWS CloudFormation console].
