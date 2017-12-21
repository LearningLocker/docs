---
---

# Persona Identifiers HTTP Interface

Represents a unique identifier for a person. Statements that use these identifiers are linked to the [persona](../http-personas) that the identifier belongs to.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/personaidentifier.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/personaidentifier.
- [Upsert HTTP Interface](#upsert-http-interface) via http://www.example.org/api/v2/personaidentifier/upsert.

### Schema

Name | Description
--- | ---
_id | The id of this identifier.
organisation | The id of the [organisation](../http-organisations) this identifier belongs to.
persona | The id of the [persona](../http-persona) this identifier belongs to.
ifi | A representation of the [inverse functional identifier](#inverse-functional-identifier).

### Example

```json
{
  "_id" : "59c1219936229d4ce9634601",
  "organisation" : "59c1219936229d4ce9634602",
  "persona": "59c1219936229d4ce9634603",
  "ifi": {
    "key": "account",
    "value": {
      "homePage": "http://www.example.org",
      "name": "example-user"
    }
  }
}
```

# Inverse Functional Identifier
According to the xAPI specification, an Inverse Functional Identifier (IFI) is "a value of an Agent or Identified Group that is guaranteed to only ever refer to that Agent or Identified Group".

### Schema

Name | Description
--- | ---
key | The type of IFI ([account](#account-ifi), [mbox](#mbox-ifi), [mbox_sha1sum](#mbox-sha1sum-ifi), or [openid](#openid-ifi)).
value | The value of the IFI.

### Account IFI

```json
{
  "key": "account",
  "value": {
    "homePage": "http://www.example.org",
    "name": "example-user"
  }
}
```

### Mbox IFI

```json
{
  "key": "mbox",
  "value": "mailto:user@example.org"
}
```

### Mbox Sha1Sum IFI

```json
{
  "key": "mbox_sha1sum",
  "value": "cc1e39b02974c5d21e792d7febcaa6018bb6c574"
}
```

### OpenID IFI

```json
{
  "key": "openid",
  "value": "http://www.example.org/example-user"
}
```

# Upsert HTTP Interface
This interface creates or updates a persona identifier depending on whether the IFI already exists.

- If the `persona` property is not set, a persona will be created if the identifier's IFI doesn't exist.
- If the `persona` property is set, the persona must already exist. Otherwise, a 404 response code will be returned.

A request to the upsert route would look something like this:

```http
POST http://www.example.org/api/v2/personaidentifier/upsert
Authorization: YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  "ifi": {
    "key": "account",
    "value": {
      "homePage": "http://www.example.org",
      "name": "example-user"
    }
  }
}
```

The interface will respond with a 200 response code, with detail the created/updated identifier.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "_id" : "59c1219936229d4ce9634601",
  "organisation" : "59c1219936229d4ce9634602",
  "persona": "59c1219936229d4ce9634603",
  "ifi": {
    "key": "account",
    "value": {
      "homePage": "http://www.example.org",
      "name": "example-user"
    }
  }
}
```
