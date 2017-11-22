---
---

# Organisations HTTP Interface

Organisations are a logical grouping of statements.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/organisation.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/organisation.

### Schema

Name | Description
--- | ---
_id | The unique id of document.
createdAt | When this document was created.
updatedAt | When the document was last updated.
name | The name of the organisation.
parent | The _id of the parent organisation.
owner | The id of the [user](../http-users#schema) which created this organisation.
settings | [JSON settings for this organisation](#settings).

### Settings

Name | Description
---|---
PASSWORD_CUSTOM_MESSAGE | The password message to display.
PASSWORD_CUSTOM_REGEX | The regular expression which the password should match.
PASSWORD_USE_CUSTOM_REGEX | Whether to use the custom regular expression.
PASSWORD_REQUIRE_NUMBER | Whether the password requires numbers.
PASSWORD_REQUIRE_ALPHA | Whether the password requires characters.
PASSWORD_MIN_LENGTH | The minimum password length.
PASSWORD_HISTORY_TOTAL | How many previous passwords the user is not allowed to use
PASSWORD_HISTORY_CHECK | Whether to check password history
LOCKOUT_SECONDS | How long to lock out a user after LOCK_ATTEMPTS failed login attempts.
LOCKOUT_ATTEMPTS | How many login tries a user as allowed before triggering the LOCKOUT_SECONDS timeout.
LOCKOUT_ENABLED | Whether the LOCKOUT functionality is enabled.

### Example Model

```json
{
	"_id" : "59c2371c16bc715f83c34501",
	"createdAt" : "2017-04-27T15:45:34.298Z",
	"updatedAt" : "2017-04-27T15:45:38.138Z",
	"parent" : "59c2371c16bc715f83c34502",
	"owner" : "59c2371c16bc715f83c34503",
	"settings" : {
		"PASSWORD_CUSTOM_MESSAGE" : null,
		"PASSWORD_CUSTOM_REGEX" : null,
		"PASSWORD_USE_CUSTOM_REGEX" : false,
		"PASSWORD_REQUIRE_NUMBER" : false,
		"PASSWORD_REQUIRE_ALPHA" : true,
		"PASSWORD_MIN_LENGTH" : 8,
		"PASSWORD_HISTORY_TOTAL" : 3,
		"PASSWORD_HISTORY_CHECK" : true,
		"LOCKOUT_SECONDS" : 1800,
		"LOCKOUT_ATTEMPS" : 5,
		"LOCKOUT_ENABLED" : true
	},
	"name" : "Example Organisation"
}
```
