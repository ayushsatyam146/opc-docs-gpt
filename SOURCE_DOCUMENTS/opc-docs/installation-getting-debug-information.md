// Module included in the following assemblies:
//

[id="installing-getting-debug-information_{context}"]
= Getting debug information from the installation program

You can use any of the following actions to get debug information from the installation program.

* Look at debug messages from a past installation in the hidden `.openshift_install.log` file. For example, enter:
+
[source,terminal]
----
$ cat ~/<installation_directory>/.openshift_install.log <1>
----
<1> For `installation_directory`, specify the same directory you specified when you ran `./openshift-install create cluster`.

* Change to the directory that contains the installation program and re-run it with `--log-level=debug`:
+
[source,terminal]
----
$ ./openshift-install create cluster --dir <installation_directory> --log-level debug <1>
----
<1> For `installation_directory`, specify the same directory you specified when you ran `./openshift-install create cluster`.
