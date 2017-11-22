---
---

# Stores HTTP Interface

A store holds collections of statements. (may be referred to as lrs).

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/lrs.
- [Models HTTP Interface](../http-rest) via http://www.example.org/api/v2/lrs.

### Schema

Name | Description
--- | ---
_id | The id of this store.
Title | The name of this store.
createdAt | When this store was created.
updatedAt | When this was last updated.
description | The description of this store. 
owner_id | The id of the [user](../http-users#schema) who created this store.
organisation | The [organisation](../http-organisations#schema) this store belongs to.
statementCount | Number of statements in this store.

### Example Model

```json
{
	"_id" : "59c2371c16bc715f83c34508",
	"title" : "Example Store",
	"createdAt" : "2017-04-27T09:40:44.920Z",
	"updatedAt" : "2017-04-27T09:40:49.139Z",
	"organisation" : "59c2371c16bc715f83c34507",
	"statementCount" : 500
}
```
