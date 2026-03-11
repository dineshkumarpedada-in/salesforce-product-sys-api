%dw 2.0
output application/json
---
{
	"appName": Mule::p('api.Name'),
	"appVersion": Mule::p('api.Version'),
	"timeStamp": now(),
	"correlationId": attributes.headers.'x-correlation-id' default correlationId,
	"flowName": "salesforce-product-system-api-main",
	"requestIdentifier": attributes.method ++ ":" ++ attributes.requestUri
}