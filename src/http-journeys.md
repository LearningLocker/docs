---
---

# Journeys HTTP Interface

A visualisation of an actor/person's progress through a journey.

Can be accessed through the [Connection HTTP Interface](../http-connection) and [Models HTTP Interface](../http-models).

### Schema

Name | Type | Description
--- | --- | --- | ---
_id | Mongo ID | The id of this journey _(autogenerated)_
organisation| [Organisation](../http-organisations#schema) Mongo ID | The id of the organisation this journey belongs to _(autogenerated)_
owner | [User](../http-users#schema) Mongo ID | The id of the user who created this journey _(autogenerated)_
createdAt |  Timestamp | When this journey was created _(autogenerated)_
updatedAt |  Timestamp | When this journey was last updated _(autogenerated)_
description | String | The name of the journey
isActive| Boolean | If this journey is active
sources| Array [[Store](../http-stores#schema) Mongo IDs] | An array of stores that this journey applies to
waypoints | Array [[Waypoints](#waypoints)] | An array of waypoints for this journey. [See waypoints](#waypoints)
outcomes | Array [[Outcomes](#outcomes)] | An array of outcomes for this journey
isSequential | Boolean | If this journey is sequential
isRepeatable | Boolean | If this journey is repeatable
trackBy | String | Only `"actor"` currently supported, `"persona"` tracking coming soon
recalculateStatus | JSON {[Recalculate Status](#recalculate-status)} |  Progress in calculating this journey
isPublic | Boolean | If false then this visualisation is only available to the owner and users with [org/all/journey/view scope](../http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission

### Waypoints

An array of points with properties: 

Name | Type | Description
--- | --- | ---
_id | Mongo ID | the id of this waypoint _(autogenerated)_
description | String | Name of this waypoint 
isActive | Boolean | If this waypoint is active. Unactive waypoints will not be processed by the hourney handler
conditions | String | A stringified JSON [mongo query](https://docs.mongodb.com/manual/tutorial/query-documents/) of when this waypoint has been reached.
count | Number | The number of times that the condition must be met
order | Number | The order of this waypoint in the journey

### Outcomes

An array of outcomes with properties:

Name | Type | Description
--- | --- | ---
description | String | The name of this outcome.
isActive | Boolean | If this outcome is active.
type | String | Only `'callback'` currently supported, `'statement'` outcomes coming soon
callback | String (URL) |  URL to POST completion data on a journey being completed

#### Callback example

```
{

}
```


### Recalculate Status

Name | Type | Description
--- | --- | ---
inProgress | Boolean | Is the journey currently being recalculated
totalCount | Number | Total number of statements to process
remainingCount | Number | Total amount of statements left to process



## Example POST data

```
{
  "createdAt": "2017-01-01T00:00:00Z",
  "updatedAt": "2017-01-02T02:00:00Z",
  "description": "5 comments and 1 completion of a course",
  "isActive": true,
  "sources": ["111aaa1111a111111aa11111", "111aaa1111a111111aa11112"]
  "waypoints": [
    {
      "description": "5 comments"
      "isActive": true
      "conditions": "{\"statement.verb.id\": \"http://adlnet.gov/expapi/verbs/commented\"}"
      "count": 5
      "order": 1
    },
    {
      "description": "1 course completion"
      "isActive": true
      "conditions": "{\"statement.verb.id\": \"http://adlnet.gov/expapi/verbs/completed\", \"statement.object.definition.type\": \"http://adlnet.gov/expapi/activities/course\"}"
      "count": 1
      "order": 2
    },
  ],
  "outcomes": [
    {
      "description": "POST to my endpoint",
      "isActive": true,
      "type": "callback",
      "callback": "http://example.org/myPOSTcallbackURL/"
    }
  ]
  "isSequential": true,
  "isRepeatable": false,
  "trackBy": "actor",
  "isPublic": true,
}
```