---
---

# Clients HTTP Interface

Details of a cleints which will be accessing Learning Locker. It contains details for permissions, authenticating and storing the xapi request.

It is accessable through the [connection API](/http-connection) and [restify api](/http-models). Accepted properties:

Name | Description
--- | ---
_id | The unique id of document.
createdAt | When this document was created.
updatedAt | When this document was last updated.
title | String. The title of the cleint.
api | The client [basic auth](https://en.wikipedia.org/wiki/Basic_access_authentication) details. [See api](#api).
authority | A json encoded string of an agent object that will be added to any statements the client pushes statement model. [See authority](#authority).
scopes | An array of strings. permission scopes that this client has permission for.
isTrusted | Whether this client is active. 
organisation | The organisation this client is attached to.
lrs_id | The id of the [lrs](/lrs) that the system will put recieved xapi statements.

# api

Name | Description
--- | ---
basic_key | The basic auth key.
basic_secret | The basic auth secret.

# authority

This is a json encoded string, of the following properties:

Name | Description
--- | ---
objectType | 'Agent'.
name | Name of the agent.
mbox | Optional, of its an mbox
mbox_sha1sum | Optional, mbox sha1
openid | Optional, the open id.
homePage | Optional, the homePage.

One and only one of mbox, mbox_sha1, openid, homePage should be provided