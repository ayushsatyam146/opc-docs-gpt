// Module included in the following assemblies:
//
// * serverless/cli_tools/kn-func-ref.adoc
// * serverless/functions/serverless-functions-getting-started.adoc

:_mod-docs-content-type: REFERENCE
[id="serverless-kn-func-run_{context}"]
= Running a function locally

You can use the `kn func run` command to run a function locally in the current directory or in the directory specified by the `--path` flag. If the function that you are running has never previously been built, or if the project files have been modified since the last time it was built, the `kn func run` command builds the function before running it by default.

.Example command to run a function in the current directory
[source,terminal]
----
$ kn func run
----

.Example command to run a function in a directory specified as a path
[source,terminal]
----
$ kn func run --path=<directory_path>
----

You can also force a rebuild of an existing image before running the function, even if there have been no changes to the project files, by using the `--build` flag:

.Example run command using the build flag
[source,terminal]
----
$ kn func run --build
----

If you set the `build` flag as false, this disables building of the image, and runs the function using the previously built image:

.Example run command using the build flag
[source,terminal]
----
$ kn func run --build=false
----

You can use the help command to learn more about `kn func run` command options:

.Build help command
[source,terminal]
----
$ kn func help run
----
