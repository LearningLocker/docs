---
---

# Organisations HTTP Interface

Organisations are a logical grouping of statements.

Can be accessed through the [Connection HTTP Interface](/http-connection) and [Models HTTP Interface](/http-models).

### Schema

Name | Description
--- | ---
_id | The unique id of document.
createdAt | When this document was created.
updatedAt | When the document was last updated.
name | The name of the organisation.
parent | The _id of the parent organisation.
owner | The id of the [user](/http-users#schema) which created this organisation.
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




