---
---

# Queries HTTP Interface

This holds saved statement queries.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/query.
- [Models HTTP Interface](../http-rest) via http://www.example.org/api/v2/query.

### Schema

Name | Description
--- | ---
_id | The id of the query.
name | The name of this query.
organisation | The id of the [organisation](../http-organisations#schema) that this persona belongs to.
owner | The id of the [user](../http-users#schema) which created this query.
conditions | A JSON encoded [mongo query](https://docs.mongodb.com/manual/tutorial/query-documents/).
isPublic | If false then this visualisation is only available to the owner and users with [org/all/query/view scope](../http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission.

### Example Model

```json
{
	"_id" : "59c2371c16bc715f83c34501",
	"name" : "All comments",
	"owner" : "59c2371c16bc715f83c34502",
	"organisation" : "59c2371c16bc715f83c34503",
	"isPublic" : false,
	"conditions" : "{\"statement.verb.id\":\"http://adlnet.gov/expapi/verbs/commented\"}"
}
```
