---
---

# Journeys HTTP Interface

A visualisation of an actor/person's progress through a journey.

Can be accessed through the [Connection HTTP Interface](/http-connection) and [Models HTTP Interface](/http-models).

### Schema

Name | Description
--- | ---
_id | The id of this journey.
description | The name of the journey.
createdAt | When this journey was created.
updatedAt | When this journey was last updated.
isActive | If this journey is active.
organisation | The id of the [organisation](/http-organisations#schema) this journey belongs to.
sources | An array of [stores](/http-stores#schema) that this journey applies to.
waypoints | An array of waypoints for this journey. [See waypoints](#waypoints)
outcomes | An array of outcomes for this journey. [See outcomes](#outcomes)
isSequential | If this journey is sequential.
isRepeatable | If this journey is repeatable.
owner | The id of the [user](/http-users#schema) who created this journey.
trackBy | either 'actor', 'person'.
recalculateStatus | Progress in calculating this journey. [See recalculate status](#recalculate-status).
isPublic | If false then this visualisation is only available to the owner and users with [org/all/journey/view scope](/http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission.

### Waypoints

An array of points with properties: 

Name | Description
--- | ---
_id | the id of this waypoint.
description | Name of this waypoint.
isActive | If this waypoint is active.
conditions | A stringified JSON [mongo query](https://docs.mongodb.com/manual/tutorial/query-documents/) of when this waypoint has been reached.
count | The number of times that the condition must be met.
order | The order of this waypoint.

### Outcomes

An array of outcomes with properties:

Name | Description
--- | ---
description | The name of this outcome.
isActive | If this outcome is active.
type | either 'callback', 'statement'.
callback | Url to call on completion of the journey.

### Recalculate Status

Name | Description
--- | ---
inProgress | This journey is being recalculated.
totalCount | Total number of statements to process.
remainingCount | Number of statements left to go.



