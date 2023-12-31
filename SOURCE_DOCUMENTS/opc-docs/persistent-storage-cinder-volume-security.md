// Module included in the following assemblies:
//
// * storage/persistent_storage/persistent_storage-cinder.adoc

:_mod-docs-content-type: PROCEDURE
[id="persistent-storage-cinder-volume-security_{context}"]
= Cinder volume security

If you use Cinder PVs in your application, configure security for their
deployment configurations.

.Prerequisites
- An SCC must be created that uses the appropriate `fsGroup` strategy.

.Procedure

. Create a service account and add it to the SCC:
+
[source,terminal]
----
$ oc create serviceaccount <service_account>
----
+
[source,terminal]
----
$ oc adm policy add-scc-to-user <new_scc> -z <service_account> -n <project>
----

. In your application's deployment configuration, provide the service account
name and `securityContext`:
+
[source,yaml]
----
apiVersion: v1
kind: ReplicationController
metadata:
  name: frontend-1
spec:
  replicas: 1  <1>
  selector:    <2>
    name: frontend
  template:    <3>
    metadata:
      labels:  <4>
        name: frontend <5>
    spec:
      containers:
      - image: openshift/hello-openshift
        name: helloworld
        ports:
        - containerPort: 8080
          protocol: TCP
      restartPolicy: Always
      serviceAccountName: <service_account> <6>
      securityContext:
        fsGroup: 7777 <7>
----
<1> The number of copies of the pod to run.
<2> The label selector of the pod to run.
<3> A template for the pod that the controller creates.
<4> The labels on the pod. They must include labels from the label selector.
<5> The maximum name length after expanding any parameters is 63 characters.
<6> Specifies the service account you created.
<7> Specifies an `fsGroup` for the pods.
