// Module included in the following assemblies:
//
// * applications/pruning-objects.adoc

:_mod-docs-content-type: PROCEDURE
[id="pruning-hard-pruning-registry_{context}"]
= Hard pruning the registry

The OpenShift Container Registry can accumulate blobs that are not referenced by
the {product-title} cluster's etcd. The basic pruning images procedure,
therefore, is unable to operate on them. These are called _orphaned blobs_.

Orphaned blobs can occur from the following scenarios:

- Manually deleting an image with `oc delete image <sha256:image-id>` command,
which only removes the image from etcd, but not from the registry's storage.

- Pushing to the registry initiated by daemon failures, which causes some blobs to
get uploaded, but the image manifest (which is uploaded as the very last
component) does not. All unique image blobs become orphans.

- {product-title} refusing an image because of quota restrictions.

- The standard image pruner deleting an image manifest, but is interrupted before
it deletes the related blobs.

- A bug in the registry pruner, which fails to remove the intended blobs, causing
the image objects referencing them to be removed and the blobs becoming orphans.
// Find this BZ

_Hard pruning_ the registry, a separate procedure from basic image pruning,
allows cluster administrators to remove orphaned blobs. You should hard prune if
you are running out of storage space in your OpenShift Container Registry and
believe you have orphaned blobs.

This should be an infrequent operation and is necessary only when you have
evidence that significant numbers of new orphans have been created. Otherwise,
you can perform standard image pruning at regular intervals, for example, once a
day (depending on the number of images being created).

.Procedure

To hard prune orphaned blobs from the registry:

. *Log in.*
+
Log in to the cluster with the CLI as `kubeadmin` or another privileged user that
has access to the `openshift-image-registry` namespace.

. *Run a basic image prune*.
+
Basic image pruning removes additional images that are no longer needed. The
hard prune does not remove images on its own. It only removes blobs stored in
the registry storage. Therefore, you should run this just before the hard prune.

. *Switch the registry to read-only mode.*
+
If the registry is not running in read-only mode, any pushes happening at the
same time as the prune will either:
+
--
- fail and cause new orphans, or
- succeed although the images cannot be pulled (because some of the
referenced blobs were deleted).
--
+
Pushes will not succeed until the registry is switched back to read-write mode.
Therefore, the hard prune must be carefully scheduled.
+
To switch the registry to read-only mode:

.. In `configs.imageregistry.operator.openshift.io/cluster`, set `spec.readOnly` to `true`:
+
[source,terminal]
----
$ oc patch configs.imageregistry.operator.openshift.io/cluster -p '{"spec":{"readOnly":true}}' --type=merge
----

. *Add the `system:image-pruner` role.*
+
The service account used to run the registry instances requires additional
permissions to list some resources.

.. Get the service account name:
+
[source,terminal]
----
$ service_account=$(oc get -n openshift-image-registry \
    -o jsonpath='{.spec.template.spec.serviceAccountName}' deploy/image-registry)
----

.. Add the `system:image-pruner` cluster role to the service account:
+
[source,terminal]
----
$ oc adm policy add-cluster-role-to-user \
    system:image-pruner -z \
    ${service_account} -n openshift-image-registry
----

. *Optional: Run the pruner in dry-run mode.*
+
To see how many blobs would be removed, run the hard pruner in dry-run mode. No changes are actually made. The following example references an image registry pod called `image-registry-3-vhndw`:
+
[source,terminal]
----
$ oc -n openshift-image-registry exec pod/image-registry-3-vhndw -- /bin/sh -c '/usr/bin/dockerregistry -prune=check'
----
+
Alternatively, to get the exact paths for the prune candidates, increase the
logging level:
+
[source,terminal]
----
$ oc -n openshift-image-registry exec pod/image-registry-3-vhndw -- /bin/sh -c 'REGISTRY_LOG_LEVEL=info /usr/bin/dockerregistry -prune=check'
----
+
.Example output
[source,terminal]
----
time="2017-06-22T11:50:25.066156047Z" level=info msg="start prune (dry-run mode)" distribution_version="v2.4.1+unknown" kubernetes_version=v1.6.1+$Format:%h$ openshift_version=unknown
time="2017-06-22T11:50:25.092257421Z" level=info msg="Would delete blob: sha256:00043a2a5e384f6b59ab17e2c3d3a3d0a7de01b2cabeb606243e468acc663fa5" go.version=go1.7.5 instance.id=b097121c-a864-4e0c-ad6c-cc25f8fdf5a6
time="2017-06-22T11:50:25.092395621Z" level=info msg="Would delete blob: sha256:0022d49612807cb348cabc562c072ef34d756adfe0100a61952cbcb87ee6578a" go.version=go1.7.5 instance.id=b097121c-a864-4e0c-ad6c-cc25f8fdf5a6
time="2017-06-22T11:50:25.092492183Z" level=info msg="Would delete blob: sha256:0029dd4228961086707e53b881e25eba0564fa80033fbbb2e27847a28d16a37c" go.version=go1.7.5 instance.id=b097121c-a864-4e0c-ad6c-cc25f8fdf5a6
time="2017-06-22T11:50:26.673946639Z" level=info msg="Would delete blob: sha256:ff7664dfc213d6cc60fd5c5f5bb00a7bf4a687e18e1df12d349a1d07b2cf7663" go.version=go1.7.5 instance.id=b097121c-a864-4e0c-ad6c-cc25f8fdf5a6
time="2017-06-22T11:50:26.674024531Z" level=info msg="Would delete blob: sha256:ff7a933178ccd931f4b5f40f9f19a65be5eeeec207e4fad2a5bafd28afbef57e" go.version=go1.7.5 instance.id=b097121c-a864-4e0c-ad6c-cc25f8fdf5a6
time="2017-06-22T11:50:26.674675469Z" level=info msg="Would delete blob: sha256:ff9b8956794b426cc80bb49a604a0b24a1553aae96b930c6919a6675db3d5e06" go.version=go1.7.5 instance.id=b097121c-a864-4e0c-ad6c-cc25f8fdf5a6
...
Would delete 13374 blobs
Would free up 2.835 GiB of disk space
Use -prune=delete to actually delete the data
----

. *Run the hard prune.*
+
Execute the following command inside one running instance of a `image-registry` pod to run the hard prune. The following example references an image registry pod called `image-registry-3-vhndw`:
+
[source,terminal]
----
$ oc -n openshift-image-registry exec pod/image-registry-3-vhndw -- /bin/sh -c '/usr/bin/dockerregistry -prune=delete'
----
+
.Example output
[source,terminal]
----
Deleted 13374 blobs
Freed up 2.835 GiB of disk space
----

. *Switch the registry back to read-write mode.*
+
After the prune is finished, the registry can be switched back to read-write
mode. In `configs.imageregistry.operator.openshift.io/cluster`, set
`spec.readOnly` to `false`:
+
[source,terminal]
----
$ oc patch configs.imageregistry.operator.openshift.io/cluster -p '{"spec":{"readOnly":false}}' --type=merge
----
