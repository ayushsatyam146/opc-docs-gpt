// Module included in the following assemblies:
//
// * cli_reference/developer_cli_odo/installing-odo.adoc

:_mod-docs-content-type: PROCEDURE
[id="installing-odo-on-vs-code_{context}"]

= Installing odo on VS Code

The https://marketplace.visualstudio.com/items?itemName=redhat.vscode-openshift-connector[OpenShift VS Code extension] uses both `odo` and the `oc` binary to interact with your {product-title} cluster. To work with these features, install the OpenShift VS Code extension on VS Code.

.Prerequisites

* You have installed VS Code.

.Procedure

. Open VS Code.

. Launch VS Code Quick Open with `Ctrl`+`P`.

. Enter the following command:
+
----
$ ext install redhat.vscode-openshift-connector
----
