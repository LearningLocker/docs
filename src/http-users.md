---
---

# Users HTTP Interface

A user of learning locker.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/user.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/user.

### Schema

Name | Description
--- | ---
_id | The id of this user.
name | Name of the user.
email | The email of the user.
organisations | A list of [organisation](../http-organisations#schema) ids that this user belongs to.
organisationSettings | A list of [organisation settings](#organisation-settings) for this user
imageUrl | A url of an image for this user. 
googleId | The user's google id.
ownerOrganisation | The id of the users owning [organisation](../http-organisations#schema)
ownerOrganisationSettings | Duplication of [organisation settings](../http-organisations#schema).
settings | An object of specific users settings. [see settings](#settings)
scopes | Global [scopes](../http-roles#scopes) for this user.
verified | Whether this user has been verified.
resetTokens | A list of reset tokens. [See reset token](#reset-token).
passwordHistory | A list of users previously used password hashes.
authLastAttempt | When the user last attempted to authenticate.
authFailedAttempts | Number of failed authentication attempts.
authLockoutExpiry | When the user can attempt to authenticate again.

### Organisation Settings

A list of organisation settings:

Name | Description
--- | ---
organisation | The id of the [organisation](organisations#schema) of these settings.
scopes | List of [scopes](../http-roles#scopes) that this user has permissions for in this [organisation](organisations#schema).
roles | List of [role](../http-roles#schema) ids that this user has permissions for in the [organisation](organisations#schema).
filter | A [statement](../http-statements#schema) filter which restricts which statements this user has access too.

### Settings

Name | Description
--- | ---
CONFIRM_BEFORE_DELETE | If true, will prompt user before delete actions.

### Reset Token

A token which is used to reset a user's password.

Name | Description
--- | ---
token | The token.
expires | When this token expires.

### Example Model

```json
{
	"_id" : "59c2371c16bc715f83c34501",
	"createdAt" : "2017-09-19T12:07:25.536Z",
	"updatedAt" : "2017-09-19T15:06:54.027Z",
	"email" : "example@example.org",
	"password" : "aaa",
	"authLockoutExpiry" : null,
	"authFailedAttempts" : 0,
	"authLastAttempt" : "2017-09-19T15:06:54.020Z",
	"passwordHistory" : [
		{
			"date" : "2017-09-19T12:07:25.505Z",
			"hash" : "aaa",
			"_id" : "59c2371c16bc715f83c34502"
		},
		{
			"date" : "2017-09-19T12:47:34.093Z",
			"hash" : "bbb",
			"_id" : "59c2371c16bc715f83c34503"
		}
	],
	"resetTokens" : [ ],
	"verified" : true,
	"scopes" : [
		"site_admin"
	],
	"settings" : {
		"CONFIRM_BEFORE_DELETE" : true
	},
	"ownerOrganisationSettings" : {
		"PASSWORD_CUSTOM_MESSAGE" : null,
		"PASSWORD_CUSTOM_REGEX" : null,
		"PASSWORD_USE_CUSTOM_REGEX" : false,
		"PASSWORD_REQUIRE_NUMBER" : true,
		"PASSWORD_REQUIRE_ALPHA" : true,
		"PASSWORD_MIN_LENGTH" : 8,
		"PASSWORD_HISTORY_TOTAL" : 3,
		"PASSWORD_HISTORY_CHECK" : true,
		"LOCKOUT_SECONDS" : 1800,
		"LOCKOUT_ATTEMPS" : 5,
		"LOCKOUT_ENABLED" : true
	},
	"organisationSettings" : [
		{
			"organisation" : "59c2371c16bc715f83c34504",
			"_id" : "59c2371c16bc715f83c34505",
			"filter" : "{}",
			"roles" : [ ],
			"scopes" : [
				"all"
			]
		}
	],
	"organisations" : [
		"59c2371c16bc715f83c34504",
		"59c2371c16bc715f83c34506",
		"59c2371c16bc715f83c34507"
	],
	"ownerOrganisation" : "59c2371c16bc715f83c34504"
}
```
