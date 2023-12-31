// Module included in the following assemblies:
//
// storage/persistent_storage/persistent-storage-efs.adoc

[id="efs-provisioner_{context}"]
= Create the EFS provisioner

The EFS provisioner is an {product-title} pod that mounts the EFS volume
as an NFS share.

.Prerequisites

* Create a config map that defines the EFS environment variables.
* Create a service account that contains the necessary cluster
and role permissions.
* Create a storage class for provisioning volumes.
* Configure the Amazon Web Services (AWS) security groups to allow incoming
NFS traffic on all {product-title} nodes.
* Configure the AWS EFS volume security groups to allow incoming
SSH traffic from all sources.

.Procedure

. Define the EFS provisioner by creating a `provisioner.yaml` file with the
following contents:
+
[source,yaml]
----
kind: Pod
apiVersion: v1
metadata:
  name: efs-provisioner
spec:
  serviceAccount: efs-provisioner
  containers:
    - name: efs-provisioner
      image: quay.io/external_storage/efs-provisioner:latest
      env:
        - name: PROVISIONER_NAME
          valueFrom:
            configMapKeyRef:
              name: efs-provisioner
              key: provisioner.name
        - name: FILE_SYSTEM_ID
          valueFrom:
            configMapKeyRef:
              name: efs-provisioner
              key: file.system.id
        - name: AWS_REGION
          valueFrom:
            configMapKeyRef:
              name: efs-provisioner
              key: aws.region
        - name: DNS_NAME
          valueFrom:
            configMapKeyRef:
              name: efs-provisioner
              key: dns.name
              optional: true
      volumeMounts:
        - name: pv-volume
          mountPath: /persistentvolumes
  volumes:
    - name: pv-volume
      nfs:
        server: <file-system-id>.efs.<aws_region>.amazonaws.com <1>
        path: / <2>
----
<1> Contains the DNS name of the EFS volume. This field must be updated
for the pod to discover the EFS volume.
<2> The mount path of the EFS volume. Each persistent volume is created
as a separate subdirectory on the EFS volume. If this EFS volume is used
for other projects outside of {product-title}, then it is recommended to
create a unique subdirectory {product-title} manually on EFS for the
cluster to prevent projects from accessing another project's data. Specifying a
directory that does not exist results in an error.

. After the file has been configured, create it in your cluster
by running the following command:
+
[source,terminal]
----
$ oc create -f provisioner.yaml
----
