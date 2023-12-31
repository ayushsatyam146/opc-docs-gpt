// Module included in the following assemblies:
//
// applications/projects/working-with-projects.adoc

:_mod-docs-content-type: PROCEDURE
[id="deleting-a-project-using-the-CLI_{context}"]
= Deleting a project using the CLI

When you delete a project, the server updates the project status to
*Terminating* from *Active*. Then, the server clears all content from a project
that is in the *Terminating* state before finally removing the project. While a
project is in *Terminating* status, you cannot add new content to the project.
Projects can be deleted from the CLI or the web console.

.Procedure

. Run:
+
[source,terminal]
----
$ oc delete project <project_name>
----
