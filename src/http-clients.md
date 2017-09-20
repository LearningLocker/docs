---
---

# Clients HTTP Interface

Details of a clients which will be accessing Learning Locker. It contains details for permissions, authenticating and storing the xapi request.

It is accessible through the [Connection HTTP Interface](../http-connection) and [Models HTTP Interface](../http-models).

### Schema

Name | Description
--- | ---
_id | The unique id of document.
createdAt | When this document was created.
updatedAt | When this document was last updated.
title | String. The title of the client.
api | The client [basic auth](https://en.wikipedia.org/wiki/Basic_access_authentication) details. [See api](#api).
authority | A JSON encoded string of an agent object that will be set on any statements that the client pushes. [See authority](#authority).
scopes | An array of strings. Permission [scopes](../http-roles#scopes) that this client has permission for.
isTrusted | Whether this client is enabled. 
organisation | The [organisation](../http-organisations#schema) this client is attached to.
lrs_id | The id of the [store](../http-stores#schema) that the system will put received xapi statements.

### api

Name | Description
--- | ---
basic_key | The basic auth key.
basic_secret | The basic auth secret.

### authority

This is a JSON encoded string, of the following properties:

Name | Description
--- | ---
objectType | 'Agent'.
name | Name of the agent.
mbox | Optional, of its an mbox
mbox_sha1sum | Optional, mbox sha1
openid | Optional, the open id.
account | Optional, A JSON object. [See Account](#account)
homePage | Optional, the homePage.

One and only one of mbox, mbox_sha1, openid, Account should be provided

### account

Name | Description
--- | ---
name | The unique id or name used to log into the account.
homePage | The url of the home page.
