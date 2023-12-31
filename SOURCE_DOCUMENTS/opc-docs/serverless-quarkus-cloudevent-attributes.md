// Module included in the following assemblies
//
// * serverless/functions/serverless-developing-quarkus-functions.adoc

:_mod-docs-content-type: CONCEPT
[id="serverless-quarkus-cloudevent-attributes_{context}"]
= CloudEvent attributes

If you need to read or write the attributes of a CloudEvent, such as `type` or `subject`, you can use the `CloudEvent<T>` generic interface and the `CloudEventBuilder` builder. The `<T>` type parameter must be one of the permitted types.

In the following example, `CloudEventBuilder` is used to return success or failure of processing the purchase:

[source,java]
----
public class Functions {

    private boolean _processPurchase(Purchase purchase) {
        // do stuff
    }

    public CloudEvent<Void> processPurchase(CloudEvent<Purchase> purchaseEvent) {
        System.out.println("subject is: " + purchaseEvent.subject());

        if (!_processPurchase(purchaseEvent.data())) {
            return CloudEventBuilder.create()
                    .type("purchase.error")
                    .build();
        }
        return CloudEventBuilder.create()
                .type("purchase.success")
                .build();
    }
}
----
