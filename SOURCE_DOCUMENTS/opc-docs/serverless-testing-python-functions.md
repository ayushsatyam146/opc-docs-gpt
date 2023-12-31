// Module included in the following assemblies
//
// * serverless/functions/serverless-developing-python-functions.adoc

:_mod-docs-content-type: PROCEDURE
[id="serverless-testing-python-functions_{context}"]
= Testing Python functions

You can test Python functions locally on your computer. The default project contains a `test_func.py` file, which provides a simple unit test for functions.

[NOTE]
====
The default test framework for Python functions is `unittest`. You can use a different test framework if you prefer.
====

.Prerequisites

* To run Python functions tests locally, you must install the required dependencies:
+
[source,terminal]
----
$ pip install -r requirements.txt
----

.Procedure

. Navigate to the folder for your function that contains the `test_func.py` file.

. Run the tests:
+
[source,terminal]
----
$ python3 test_func.py
----
