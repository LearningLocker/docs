---
---

# Exports HTTP Interface

This holds queries which are then used to export data form learning locker.

Can be accessed through the [Connection HTTP Interface](../http-connection) and [Models HTTP Interface](../http-models).

### Schema

Name | Description
--- | ---
_id | The unique id of document.
organisation | The organisation id this export template belongs to.
name | Title of this export template.
owner | The id of the [user](../http-users#schema) who created this export template.
projection | An array of stringified json mongo projection queries. [See mongo docs](https://docs.mongodb.com/manual/reference/operator/aggregation/project/)
rawMode | If true, in Learning Locker UI, the projection will be displayed as JSON text, as opposed to field value inputs.
downloads | A list ids of [downloads](../http-downloads#schema) which have used this export template.
isPublic | If false then this dashboard is only available to the owner and users with [org/all/export/view scope](../http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission.

### Example Model

```json
{
	"_id" : "59c2371c16bc715f83c34501",
	"name" : "Example Export",
	"organisation" : "59c2371c16bc715f83c34502",
	"downloads" : [ ],
	"rawMode" : false,
	"projections" : [
		"{\"_id\":1,\"version\":\"$statement.version\"}"
	]
}
```
