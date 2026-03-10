%dw 2.0
output application/json
---
{
	status: if ( payload.successful ) "SUCCESS" else "PARTIAL_SUCCESS",
	totalRequested: sizeOf(payload.items),
	totalCreated: sizeOf(payload.items filter $.payload.success),
	(failedRecords: (payload.items filter (!$.payload.success)).payload default []) if(!isEmpty(payload.items filter (!$.payload.success))),
	(successRecords: payload.items filter $.payload.success map (item, index) -> {
		Id: item.payload.id,
		Success: item.payload.success
	}) if(!isEmpty(payload.items filter ($.payload.success)))
}