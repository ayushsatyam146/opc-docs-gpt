// Module included in the following assemblies

// * serverless/cli_tools/kn-func-ref.adoc

:_mod-docs-content-type: PROCEDURE
[id="serverless-kn-func-delete_{context}"]
= Deleting a function

You can delete a function by using the `kn func delete` command. This is useful when a function is no longer required, and can help to save resources on your cluster.

.Procedure

* Delete a function:
+
[source,terminal]
----
$ kn func delete [<function_name> -n <namespace> -p <path>]
----
** If the name or path of the function to delete is not specified, the current directory is searched for a `func.yaml` file that is used to determine the function to delete.
** If the namespace is not specified, it defaults to the `namespace` value in the `func.yaml` file.
