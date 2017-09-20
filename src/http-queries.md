---
---

# Queries HTTP Interface

This holds saved statement queries.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/query.
- [Models HTTP Interface](../http-models) via http://www.example.org/api/query.

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
	"name" : "Example Query",
	"owner" : "59c2371c16bc715f83c34502",
	"organisation" : "59c2371c16bc715f83c34503",
	"isPublic" : false,
	"conditions" : "{\"$and\":[{\"$comment\":\"{\\\"criterionLabel\\\":\\\"A\\\",\\\"criteriaPath\\\":[\\\"statement\\\",\\\"verb\\\"]}\",\"$or\":[{\"statement.verb.id\":\"http://adlnet.gov/expapi/verbs/attended7738d476-3b3d-4ab9-8878-71d9beb83e00\"}]}]}"
}
```
