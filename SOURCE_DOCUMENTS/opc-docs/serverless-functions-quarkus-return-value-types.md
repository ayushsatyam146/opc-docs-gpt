// Module included in the following assemblies
//
// * serverless/functions/serverless-developing-quarkus-functions.adoc

:_mod-docs-content-type: REFERENCE
[id="serverless-functions-quarkus-return-value-types_{context}"]
= Permitted types

The input and output of a function can be any of the `void`, `String`, or `byte[]` types. Additionally, they can be primitive types and their wrappers, for example, `int` and `Integer`. They can also be the following complex objects: Javabeans, maps, lists, arrays, and the special `CloudEvents<T>` type.

Maps, lists, arrays, the `<T>` type parameter of the `CloudEvents<T>` type, and attributes of Javabeans can only be of types listed here.

.Example
[source,java]
----
public class Functions {
    public List<Integer> getIds();
    public Purchase[] getPurchasesByName(String name);
    public String getNameById(int id);
    public Map<String,Integer> getNameIdMapping();
    public void processImage(byte[] img);
}
----
