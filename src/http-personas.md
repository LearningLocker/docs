---
---

# Personas HTTP Interface

A persona, generated from xapi statements. 

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/persona.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/persona.

### Schema

Name | Description 
--- | ---
_id | The id of the persona.
name | The display name of this persona.
createdAt | When this persona was last created.
updatedAt | When this persona was last updated.
organisation | The id of the [organisation](../http-organisations#schema) that this persona belongs to.
personaIdenfiers | An array of ids for [personaIdentifiers](#persona-identifiers).

### Example Persona

```json
{
	"_id" : "59c1219936229d4ce9634601",
	"createdAt" : "2017-09-19T13:54:33.596Z",
	"updatedAt" : "2017-09-19T13:54:33.610Z",
	"organisation" : "59c1219936229d4ce9634602",
	"name" : "Example Persona",
	"personaIdentifiers" : [
		"59c1219936229d4ce9634603"
	]
}
```

### Persona identifiers
Persona Identifiers are also accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/personaidentifier.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/personaidentifier.

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


### Example Persona Identifier

```json
{
	"_id" : "59c1219936229d4ce9634603",
	"organisation" : "59c1219936229d4ce9634602",
	"uniqueIdentifier" : {
		"key" : "statement.actor.account",
		"value" : {
			"homePage" : "http://example.org/users",
			"name" : "Example Agent"
		}
	},
	"updatedAt" : "2017-09-19T13:54:30.944Z",
	"__v" : 1,
	"createdAt" : "2017-09-19T13:54:30.702Z",
	"identifiers" : [
		{
			"value" : "Example Agent",
			"key" : "statement.actor.name"
		},
		{
			"value" : "http://example.org/users",
			"key" : "statement.actor.account.homePage"
		},
		{
			"value" : "Example Agent",
			"key" : "statement.actor.account.name"
		}
	],
	"persona" : "59c1219936229d4ce9634601",
	"personaScores" : [ ]
}
```

