---
---

# Exports HTTP Interface

This holed quereis which are then used to export data form learning locker.

Can be accessed through the [connection API](/http-connection) and [restify api](/http-models).

### Schema

Name | Description
--- | ---
_id | The unique id of document.
organisation | The organisation id this export template belongs to.
name | Title of this export template.
owner | The owner of this export template.
projection | an array of stringified json mongo projection queries. [See mongo docs](https://docs.mongodb.com/manual/reference/operator/aggregation/project/)
rawMode | If true, in learning locker ui, the projection will be displayed as json text, as opposed to field value inputs.
downloads | A list of download ids which have used this export template.
isPublic | If false then this dashboard is only available to the owner, otherwise it's available to everyone in the organisation with permission.