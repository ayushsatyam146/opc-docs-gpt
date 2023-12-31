// Module included in the following assemblies:
//
// * osd_cluster_admin/dedicated-admin-role.adoc

[id="dedicated-managing-service-accounts_{context}"]
= Managing service accounts

Service accounts are API objects that exist within each project. To manage
service accounts, you can use the `oc` command with the `sa` or `serviceaccount`
object type or use the web console.

The *dedicated-admin* service creates the *dedicated-admins* group. This group is
granted the roles at the cluster or individual project level. Users can be
assigned to this group and group membership defines who has OpenShift Dedicated
administrator access. However, by design, service accounts cannot be added to
regular groups.

Instead, the dedicated-admin service creates a special project for this purpose
named *dedicated-admin*. The service account group for this project is granted
OpenShift Dedicated *admin* roles, granting OpenShift Dedicated administrator
access to all service accounts within the *dedicated-admin* project. These service
accounts can then be used to perform any actions that require OpenShift
Dedicated administrator access.

Users that are members of the *dedicated-admins* group, and thus have been granted
the *dedicated-admin* role, have `edit` access to the *dedicated-admin* project. This
allows these users to manage the service accounts in this project and create new
ones as needed. 

To get a list of existing service accounts in the current project, run:

[source,terminal]
----
$ oc get sa
----

.Example output
[source,text]
----
NAME       SECRETS   AGE
builder    2         2d
default    2         2d
deployer   2         2d
----

To create a new service account, run:

[source,terminal]
----
$ oc create sa <service-account-name>
----

As soon as a service account is created, two secrets are automatically added to
it:

* an API token
* credentials for the OpenShift Container Registry

These can be seen by describing the service account:

[source,terminal]
----
$ oc describe sa <service-account-name>
----

The system ensures that service accounts always have an API token and registry
credentials.

The generated API token and registry credentials do not expire, but they can be
revoked by deleting the secret. When the secret is deleted, a new one is
automatically generated to take its place.
