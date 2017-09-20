
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
scopes | An array of strings. Permission [scopes](#client-scopes) that this client has permission for.
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

### Client Scopes

A scope is a specific permission. Available scopes: 

Scope | Description
--- | --- | ---
all | Permission to read and write everything.
all/read | Permission to read everything.
xapi/all | Permission to read and write to the xAPI.
xapi/read | Read all.
statements/read | Read all statements.
statements/write | Write statements (must be used with a read scope).
statements/read/mine | Read my statements.
state | Access state.
profile | Access profiles.

### Example Model

```json
{
	"_id" : "59c2371616bc715f83c34506",
	"createdAt" : "2017-09-20T09:40:44.962Z",
	"updatedAt" : "2017-09-20T09:40:58.376Z",
	"organisation" : "59c2371c16bc715f83c34507",
	"lrs_id" : "59c2371c16bc715f83c34508",
	"title" : "Example Client",
	"scopes" : [
		"xapi/all",
		"all"
	],
	"isTrusted" : true,
	"authority" : "{\"objectType\":\"Agent\",\"name\":\"New Client\",\"mbox\":\"mailto:hello@learninglocker.net\"}",
	"api" : {
		"basic_secret" : "aaa",
		"basic_key" : "bbb"
	}
}
```
