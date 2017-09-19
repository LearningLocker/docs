---
---

# Roles HTTP Interface

Roles contain a set of permissions, of which then users can be assigned.

Can be accessed through the [Connection HTTP Interface](/http-connection) and [Models HTTP Interface](/http-models). 

### Schema

Name | Description
--- | ---
_id | The id of the role.
createdAt | When this role was created.
updatedAt | When this role was last updated.
title | The name of this role.
description | The description of this role.
owner_id | The id of the [user](/http-users#schema) who created this role.
organisation | The id of the [organisation](/http-organisations#schema) this role is in.
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


### Scopes

A scope is a specific permission. Available scopes: 

Scope | Sub Scope | Description
--- | --- | ---
ALL | | all.
OPENDASH | | opendash.
UDD_READ | | udd/read.
XAPI_ALL | | xapi/all.
XAPI_READ | | xapi/read.
XAPI_STATEMENTS_READ | | statements/read.
XAPI_STATEMENTS_WRITE | | statements/write.
XAPI_STATEMENTS_READ_MINE | | statements/read/mine.
XAPI_STATE_ALL | | state.
XAPI_PROFILE_ALL | | profile.
XAPI_SCOPES | xapi/all | All.
XAPI_SCOPES | xapi/read | Read all.
XAPI_SCOPES | statements/read | Read all statements.
XAPI_SCOPES | statements/write | Write statements (must be used with a read scope).
XAPI_SCOPES | statements/read/mine | Read my statements.
XAPI_SCOPES | state | Access state.
XAPI_SCOPES | profile | Access profiles.
API_SCOPES | all | All.
CLIENT_SCOPES | all | All.
CLIENT_SCOPES | xapi/all | All.
CLIENT_SCOPES | xapi/read | Read all.
CLIENT_SCOPES | statements/read | Read all statements.
CLIENT_SCOPES | statements/write | Write statements (must be used with a read scope).
CLIENT_SCOPES | statements/read/mine | Read my statements.
CLIENT_SCOPES | state | Access state.
CLIENT_SCOPES | profile | Access profiles.
CLIENT_SCOPES | udd/read | Read all.
CLIENT_SCOPES | opendash | Opendash.
SITE_ADMIN | | site_admin.
SITE_SCOPES | site_admin | Site Administrator.
OBSERVER | | observer.
USER_SCOPES | all | Organisation Administrator.
USER_SCOPES | observer | Organisation Observer.
