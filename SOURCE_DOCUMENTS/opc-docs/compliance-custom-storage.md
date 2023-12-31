// Module included in the following assemblies:
//
// * security/compliance_operator/co-scans/compliance-operator-advanced.adoc

[id="compliance-custom-storage_{context}"]
= Setting custom storage size for results
While the custom resources such as `ComplianceCheckResult` represent an aggregated result of one check across all scanned nodes, it can be useful to review the raw results as produced by the scanner. The raw results are produced in the ARF format and can be large (tens of megabytes per node), it is impractical to store them in a Kubernetes resource backed by the `etcd` key-value store. Instead, every scan creates a persistent volume (PV) which defaults to 1GB size. Depending on your environment, you may want to increase the PV size accordingly. This is done using the `rawResultStorage.size` attribute that is exposed in both the `ScanSetting` and `ComplianceScan` resources.

A related parameter is `rawResultStorage.rotation` which controls how many scans are retained in the PV before the older scans are rotated. The default value is 3, setting the rotation policy to 0 disables the rotation. Given the default rotation policy and an estimate of 100MB per a raw ARF scan report, you can calculate the right PV size for your environment.

[id="using-custom-result-storage-values_{context}"]
== Using custom result storage values
Because {product-title} can be deployed in a variety of public clouds or bare metal, the Compliance Operator cannot determine available storage configurations. By default, the Compliance Operator will try to create the PV for storing results using the default storage class of the cluster, but a custom storage class can be configured using the `rawResultStorage.StorageClassName` attribute.

[IMPORTANT]
====
If your cluster does not specify a default storage class, this attribute must be set.
====

Configure the `ScanSetting` custom resource to use a standard storage class and create persistent volumes that are 10GB in size and keep the last 10 results:

.Example `ScanSetting` CR

[source,yaml]
----
apiVersion: compliance.openshift.io/v1alpha1
kind: ScanSetting
metadata:
  name: default
  namespace: openshift-compliance
rawResultStorage:
  storageClassName: standard
  rotation: 10
  size: 10Gi
roles:
- worker
- master
scanTolerations:
- effect: NoSchedule
  key: node-role.kubernetes.io/master
  operator: Exists
schedule: '0 1 * * *'
----
