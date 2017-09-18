---
---

# Queries HTTP Interface

This holds saved statement queries.

Can be accessed through the [Connection HTTP Interface](/http-connection) and [Models HTTP Interface](/http-models). 

### Schema

Name | Description
--- | ---
_id | The id of the query.
name | The name of this query.
organisation | The id of the [organisation](/http-organisations#schema) that this persona belongs to.
owner | The id of the [user](/http-users#schema) which created this query.
conditions | A JSON encoded [mongo query](https://docs.mongodb.com/manual/tutorial/query-documents/).
isPublic | If false then this visualisation is only available to the owner and users with [org/all/query/view scope](/http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission.

