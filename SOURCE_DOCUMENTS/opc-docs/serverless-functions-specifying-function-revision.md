// Module included in the following assemblies:
//
// * serverless/functions/serverless-functions-on-cluster-builds.adoc

:_mod-docs-content-type: PROCEDURE
[id="serverless-functions-specifying-function-revision_{context}"]
= Specifying function revision

When building and deploying a function on the cluster, you must specify the location of the function code by specifying the Git repository, branch, and subdirectory within the repository. You do not need to specify the branch if you use the `main` branch. Similarly, you do not need to specify the subdirectory if your function is at the root of the repository. You can specify these parameters in the `func.yaml` configuration file, or by using flags with the `kn func deploy` command.

.Prerequisites

* {pipelines-title} must be installed on your cluster.

* You have installed the OpenShift (`oc`) CLI.

* You have installed the Knative (`kn`) CLI.

.Procedure

* Deploy your function:
+
[source,terminal]
----
$ kn func deploy --remote \ <1>
                 --git-url <repo-url> \ <2>
                 [--git-branch <branch>] \ <3>
                 [--git-dir <function-dir>] <4>
----
+
--
<1> With the `--remote` flag, the build runs remotely.
<2> Substitute `<repo-url>` with the URL of the Git repository.
<3> Substitute `<branch>` with the Git branch, tag, or commit. If using the latest commit on the `main` branch, you can skip this flag.
<4> Substitute `<function-dir>` with the directory containing the function if it is different than the repository root directory.
--
+
For example:
+
[source,terminal]
----
$ kn func deploy --remote \
                 --git-url https://example.com/alice/myfunc.git \
                 --git-branch my-feature \
                 --git-dir functions/example-func/
----
