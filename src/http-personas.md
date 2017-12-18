---
---

# Personas HTTP Interface

A persona represents a person with many [identifiers](../http-persona-identifiers) and [attributes](../http-persona-attributes) across systems.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/persona.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/persona.

### Schema

Name | Description 
--- | ---
_id | The id of the persona.
organisation | The id of the [organisation](../http-organisations#schema) that this persona belongs to.
name | The display name of this persona.

### Example

```json
{
  "_id" : "59c1219936229d4ce9634601",
  "organisation" : "59c1219936229d4ce9634602",
  "name" : "Example Persona",
}
```
