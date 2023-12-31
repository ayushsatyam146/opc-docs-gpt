// Module included in the following assemblies:
//
// * builds/triggering-builds-build-hooks.adoc

:_mod-docs-content-type: PROCEDURE
[id="builds-setting-triggers-manually_{context}"]
= Setting triggers manually

Triggers can be added to and removed from build configurations with `oc set triggers`.

.Procedure

* To set a GitHub webhook trigger on a build configuration, use:
+
[source,terminal]
----
$ oc set triggers bc <name> --from-github
----

* To set an imagechange trigger, use:
+
[source,terminal]
----
$ oc set triggers bc <name> --from-image='<image>'
----

* To remove a trigger, add `--remove`:
+
[source,terminal]
----
$ oc set triggers bc <name> --from-bitbucket --remove
----

[NOTE]
====
When a webhook trigger already exists, adding it again regenerates the webhook secret.
====

For more information, consult the help documentation with by running:

[source,terminal]
----
$ oc set triggers --help
----
