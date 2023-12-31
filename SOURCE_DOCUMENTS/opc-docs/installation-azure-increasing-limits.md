// Module included in the following assemblies:
//
// * installing/installing_azure/installing-azure-account.adoc
// * installing/installing_azure/installing-azure-user-infra.adoc
// * installing/installing_azure/installing-restricted-networks-azure-user-provisioned.adoc

:_mod-docs-content-type: PROCEDURE
[id="installation-azure-increasing-limits_{context}"]
= Increasing Azure account limits

To increase an account limit, file a support request on the Azure portal.
[NOTE]
====
You can increase only one type of quota per support request.
====

.Procedure

. From the Azure portal, click *Help + support* in the lower left corner.

. Click *New support request* and then select the required values:
.. From the *Issue type* list, select *Service and subscription limits (quotas)*.
.. From the *Subscription* list, select the subscription to modify.
.. From the *Quota type* list, select the quota to increase. For example, select
*Compute-VM (cores-vCPUs) subscription limit increases* to increase the number
of vCPUs, which is required to install a cluster.
.. Click *Next: Solutions*.

. On the *Problem Details* page, provide the required information for your quota
increase:
.. Click *Provide details* and provide the required details in the *Quota details* window.
.. In the SUPPORT METHOD and CONTACT INFO sections, provide the issue severity
and your contact details.

. Click *Next: Review + create* and then click *Create*.
