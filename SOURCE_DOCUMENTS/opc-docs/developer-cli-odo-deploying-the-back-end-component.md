// Module included in the following assemblies:
//
// * cli_reference/developer_cli_odo/creating-a-multicomponent-application-with-odo.adoc

:_mod-docs-content-type: PROCEDURE
[id="deploying-the-back-end-component_{context}"]

= Deploying the back-end component

To create a Java component, import the Java builder image, download the Java application and push the source code to your cluster with `{odo-title}`.

.Procedure

. Import `openjdk18` into the cluster:
+
[source,terminal]
----
$ oc import-image openjdk18 \
--from=registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift --confirm
----

. Tag the image as `builder` to make it accessible for {odo-title}:
+
[source,terminal]
----
$ oc annotate istag/openjdk18:latest tags=builder
----

. Run `odo catalog list components` to see the created image:
+
[source,terminal]
----
$ odo catalog list components
----
+
.Example output
[source,terminal]
----
Odo Devfile Components:
NAME                 DESCRIPTION                            REGISTRY
java-maven           Upstream Maven and OpenJDK 11          DefaultDevfileRegistry
java-openliberty     Open Liberty microservice in Java      DefaultDevfileRegistry
java-quarkus         Upstream Quarkus with Java+GraalVM     DefaultDevfileRegistry
java-springboot      Spring Boot® using Java                DefaultDevfileRegistry
nodejs               Stack with NodeJS 12                   DefaultDevfileRegistry

Odo OpenShift Components:
NAME        PROJECT       TAGS                                                                           SUPPORTED
java        openshift     11,8,latest                                                                    YES
dotnet      openshift     2.1,3.1,latest                                                                 NO
golang      openshift     1.13.4-ubi7,1.13.4-ubi8,latest                                                 NO
httpd       openshift     2.4-el7,2.4-el8,latest                                                         NO
nginx       openshift     1.14-el7,1.14-el8,1.16-el7,1.16-el8,latest                                     NO
nodejs      openshift     10-ubi7,10-ubi8,12-ubi7,12-ubi8,latest                                         NO
perl        openshift     5.26-el7,5.26-ubi8,5.30-el7,latest                                             NO
php         openshift     7.2-ubi7,7.2-ubi8,7.3-ubi7,7.3-ubi8,latest                                     NO
python      openshift     2.7-ubi7,2.7-ubi8,3.6-ubi7,3.6-ubi8,3.8-ubi7,3.8-ubi8,latest                   NO
ruby        openshift     2.5-ubi7,2.5-ubi8,2.6-ubi7,2.6-ubi8,2.7-ubi7,latest                            NO
wildfly     openshift     10.0,10.1,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,8.1,9.0,latest     NO
----

. Create a directory for your components:
+
[source,terminal]
----
$ mkdir my_components && cd my_components
----

. Download the example back-end application:
+
[source,terminal]
----
$ git clone https://github.com/openshift-evangelists/Wild-West-Backend backend
----

. Change to the back-end source directory:
+
[source,terminal]
----
$ cd backend
----

. Check that you have the correct files in the directory:
+
[source,terminal]
----
$ ls
----
+
.Example output
[source,terminal]
----
debug.sh  pom.xml  src
----

. Build the back-end source files with Maven to create a JAR file:
+
[source,terminal]
----
$ mvn package
----
+
.Example output
[source,terminal]
----
...
[INFO] --------------------------------------
[INFO] BUILD SUCCESS
[INFO] --------------------------------------
[INFO] Total time: 2.635 s
[INFO] Finished at: 2019-09-30T16:11:11-04:00
[INFO] Final Memory: 30M/91M
[INFO] --------------------------------------
----

. Create a component configuration of Java component-type named `backend`:
+
[source,terminal]
----
$ odo create --s2i openjdk18 backend --binary target/wildwest-1.0.jar
----
+
.Example output
[source,terminal]
----
 ✓  Validating component [1ms]
 Please use `odo push` command to create the component with source deployed
----
+
Now the configuration file `config.yaml` is in the local directory of the back-end component that contains information about the component for deployment.

. Check the configuration settings of the back-end component in the `config.yaml` file using:
+
[source,terminal]
----
$ odo config view
----
+
.Example output
[source,terminal]
----
COMPONENT SETTINGS
------------------------------------------------
PARAMETER         CURRENT_VALUE
Type              openjdk18
Application       app
Project           myproject
SourceType        binary
Ref
SourceLocation    target/wildwest-1.0.jar
Ports             8080/TCP,8443/TCP,8778/TCP
Name              backend
MinMemory
MaxMemory
DebugPort
Ignore
MinCPU
MaxCPU
----

. Push the component to the {product-title} cluster.
+
[source,terminal]
----
$ odo push
----
+
.Example output
[source,terminal]
----
Validation
 ✓  Checking component [6ms]

Configuration changes
 ✓  Initializing component
 ✓  Creating component [124ms]

Pushing to component backend of type binary
 ✓  Checking files for pushing [1ms]
 ✓  Waiting for component to start [48s]
 ✓  Syncing files to the component [811ms]
 ✓  Building component [3s]
----
+
Using `odo push`, {product-title} creates a container to host the back-end component, deploys the container into a pod running on the {product-title} cluster, and starts the `backend` component.

. Validate:

* The status of the action in {odo-title}:
+
[source,terminal]
----
$ odo log -f
----
+
.Example output
[source,terminal]
----
2019-09-30 20:14:19.738  INFO 444 --- [           main] c.o.wildwest.WildWestApplication         : Starting WildWestApplication v1.0 onbackend-app-1-9tnhc with PID 444 (/deployments/wildwest-1.0.jar started by jboss in /deployments)
----

* The status of the back-end component:
+
[source,terminal]
----
$ odo list
----
+
.Example output
[source,terminal]
----
APP     NAME        TYPE          SOURCE                             STATE
app     backend     openjdk18     file://target/wildwest-1.0.jar     Pushed
----
