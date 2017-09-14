---
---

# Queries HTTP Interface

This holds saved statement queries.

Can be accessed through the [connection API](/http-connection) and [restify api](/http-models). 

### Schema

Name | Description
--- | ---
_id | The id of the query.
name | The name of this query.
organisation | The id of the [organisation](#http-organisations) that this persona belongs to.
owner | The id of the [user](/http-users) which created this query.
conditions | A stringify [mongo query](https://docs.mongodb.com/manual/tutorial/query-documents/).
isPublic | If false then this query is only available to the owner, otherwise it's available to everyone in the organisation with permission.

