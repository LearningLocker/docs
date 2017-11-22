---
---

# Roles HTTP Interface

Roles contain a set of permissions, of which then users can be assigned.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/role.
- [Models HTTP Interface](../http-rest) via http://www.example.org/api/v2/role.

### Schema

Name | Description
--- | ---
_id | The id of the role.
createdAt | When this role was created.
updatedAt | When this role was last updated.
title | The name of this role.
description | The description of this role.
owner_id | The id of the [user](../http-users#schema) who created this role.
organisation | The id of the [organisation](../http-organisations#schema) this role is in.
scopes | A list of [organisation scopes](#organisation-scopes) of this role.

### Organisation Scopes

An organisation scope is a scope that is applied to a user per organisation. Available scopes:

Name |
--- |
all |
org/public/dashboard/view |
org/public/dashboard/edit |
org/all/dashboard/view |
org/all/dashboard/edit |
org/public/visualisation/view |
org/public/visualisation/edit |
org/all/visualisation/view |
org/all/visualisation/edit |
org/public/journey/view |
org/public/journey/edit |
org/all/journey/view |
org/all/journey/edit |
org/public/statementForwarding/view |
org/public/statementForwarding/edit |
org/all/statementForwarding/view |
org/all/statementForwarding/edit |
org/all/query/view |
org/all/query/edit |
org/all/export/view |
org/all/export/edit |
org/all/download/view |
org/all/download/edit |
org/all/persona/manage |
org/all/store/manage |
org/all/user/manage |
org/all/client/manage |
org/all/role/manage |
org/all/organisation/manage |

### Examples

```json
{
	"_id" : "59c2371c16bc715f83c34501",
	"createdAt" : "2017-09-19T12:58:58.884Z",
	"updatedAt" : "2017-09-19T12:58:58.884Z",
	"title" : "Example Role",
	"owner_id" : "59c2371c16bc715f83c34502",
	"organisation" : "59c2371c16bc715f83c34503",
	"scopes" : [
		"all"
	]
}
```
