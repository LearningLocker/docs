---
---

# Stores HTTP Interface

A store holds collections of statements. (may be referred to as lrs).

Can be accessed through the [connection API](/http-connection) and [restify api](/http-models).

### Schema

Name | Description
--- | ---
_id | The id of this store.
Title | The name of this store.
createdAt | When this store was created.
updatedAt | When this was last updated.
description | The description of this store. 
owner_id | The id of the [user](/http-users#schema) who created this store.
organisation | The [organisation](/http-organisations#schema) this store belongs to.
statementCount | Number of statements in this store.
