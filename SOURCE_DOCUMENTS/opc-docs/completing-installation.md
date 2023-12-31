// Module included in the following assemblies:
//
// * TBD

[id="completing-installation_{context}"]
= Completing and verifying the {product-title} installation

When the bootstrap node is done with its work and has handed off control to the new {product-title} cluster, the bootstrap node is destroyed. The installation program waits for the cluster to initialize, creates a route to the {product-title} console, and presents the information and credentials you require to log in to the cluster. Here’s an example:

----
INFO Install complete!                                

INFO Run 'export KUBECONFIG=/home/joe/ocp/auth/kubeconfig' to manage the cluster with 'oc', the {product-title} CLI.

INFO The cluster is ready when 'oc login -u kubeadmin -p <password>' succeeds (wait a few minutes).

INFO Access the {product-title} web-console here: https://console-openshift-console.apps.mycluster.devel.example.com

INFO Login to the console with user: kubeadmin, password: "password"
----

To access the {product-title} cluster from your web browser, log in as kubeadmin with the password, using the URL shown:

     https://console-openshift-console.apps.mycluster.devel.example.com

To access the {product-title} cluster from the command line, identify the location of the credentials file (export the KUBECONFIG variable) and log in as kubeadmin with the provided password:
----
$ export KUBECONFIG=/home/joe/ocp/auth/kubeconfig

$ oc login -u kubeadmin -p <password>
----

At this point, you can begin using the {product-title} cluster. To understand the management of your {product-title} cluster going forward, you should explore the {product-title} control plane.
