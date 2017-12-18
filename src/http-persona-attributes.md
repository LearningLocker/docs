---
---

# Persona Attributes HTTP Interface

Represents an attribute of a [persona](../http-persona).

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via `http://www.example.org/api/connection/personaattribute`.
- [REST HTTP Interface](../http-rest) via `http://www.example.org/api/v2/personaattribute`.

### Schema

Name | Description
--- | ---
_id | The id of this attribute.
organisation | The id of the [organisation](../http-organisations) this attribute belongs to.
personaId | The id of the [persona](../http-persona) this attribute belongs to.
key | The name of the attribute.
value | The value of the attribute.

### Example

```json
{
  "_id" : "59c1219936229d4ce9634601",
  "organisation" : "59c1219936229d4ce9634602",
  "personaId": "59c1219936229d4ce9634603",
  "key": "hair-colour",
  "value": "brown"
}
```
