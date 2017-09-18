---
---

# Users HTTP Interface

A user of learning locker.

Can be accessed through the [Connection HTTP Interface](/http-connection) and [Models HTTP Interface](/http-models).

### Schema

Name | Description
--- | ---
_id | The id of this user.
name | Name of the user.
email | The email of the user.
organisations | A list of [organisation](/http-organisations#schema) ids that this user belongs to.
organisationSettings | A list of [organisation settings](#organisation-settings) for this user
imageUrl | A url of an image for this user. 
googleId | The user's google id.
ownerOrganisation | The id of the users owning [organisation](/http-organisations#schema)
ownerOrganisationSettings | Duplication of [organisation settings](/http-organisations#schema).
settings | An object of specific users settings. [see settings](#settings)
scopes | Global [scopes](/http-roles#scopes) for this user.
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
scopes | List of [scopes](/http-roles#scopes) that this user has permissions for in this [organisation](organisations#schema).
roles | List of [role](/http-roles#schema) ids that this user has permissions for in the [organisation](organisations#schema).
filter | A [statement](/http-statements#schema) filter which restricts which statements this user has access too.

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
