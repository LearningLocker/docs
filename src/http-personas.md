---
---

# Personas HTTP Interface

A persona, generated from xapi statements. 

Can be accessed through the [Connection HTTP Interface](../http-connection) and [Models HTTP Interface](../http-models).

### Schema

Name | Description 
--- | ---
_id | The id of the persona.
name | The display name of this persona.
createdAt | When this persona was last created.
updatedAt | When this persona was last updated.
organisation | The id of the [organisation](../http-organisations#schema) that this persona belongs to.
personaIdenfiers | An array of ids for [personaIdentifiers](#persona-identifiers).

### Persona identifiers

Persona identifiers has properties: 

Name | Description
--- | ---
_id | The id of this persona identifier.
createdAt | When this persona was last created.
updatedAt | When this persona was last updated.
organisation | The id of the [organisation](../http-organisations) that this persona identifier belongs to.
uniqueIdentifier | The unique identifier. [See identifier](#identifier)
identifiers | A list of identifiers. [See identifier](#identifier)
persona | The id of the [persona](../http-persona) this identifier persona identifier belongs to.

### identifier

has properties:

Name | Description
--- | ---
key | The key of the identifier.
value | The value of the identifier.

### Example Model

```json
{
	"_id" : "59c1219936229d4ce96346d5",
	"createdAt" : "2017-09-19T13:54:33.596Z",
	"updatedAt" : "2017-09-19T13:54:33.610Z",
	"organisation" : "59c1148ab12f044cd22cb329",
	"name" : "Xander Bogaerts",
	"personaIdentifiers" : [
		"59c1219909a77ab6202983e3"
	]
}
```
