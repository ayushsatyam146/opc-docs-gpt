// Module included in the following assemblies:
//
// * osd_cluster_admin/cluster-admin-role.adoc

[id="dedicated-cluster-admin-grant"]
= Granting the cluster-admin role to users

After enabling cluster-admin rights on your cluster, you can assign the role to users.

.Prerequisites
* Cluster access with cluster owner permissions

.Procedure
. In {cluster-manager}, select the cluster you want to assign cluster-admin privileges.
. Under the *Access Control* tab, locate the *Cluster Administrative Users* section. Click *Add user*.
. After determining an appropriate User ID, select *cluster-admin* from the *Group* selection, then click *Add user*.
+
[NOTE]
====
Cluster-admin user creation can take several minutes to complete.
====
+
[NOTE]
====
Existing dedicated-admin users cannot elevate their role to cluster-admin. A new user must be created with the cluster-admin role assigned.
====
