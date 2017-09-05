---
---

# xAPI HTTP Interface
Learning Locker's HTTP interface conforms to the xAPI specification. The xAPI defines how to track learning experiences for analysis and serves as a guide to maximise interoperability between services that provide learning experiences.

The table below describes the routes that the HTTP interface provides, all of the URLs are relative to http://www.example.org/data/xAPI where http://www.example.org is the URL of your Learning Locker instance. To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under Settings > Clients.

Route | Description
--- | ---
[GET /about](#get-about) | Retrieves information about the LRS.
[PUT /statements](#put-statements) | Stores a single statement.
[POST /statements](#post-statements) | Stores a single statement or multiple statements.
[GET /statements](#get-statements) | Retrieves statements.
[PUT /activities/state](#put-activitiesstate) | Creates or overwrites a state document.
[POST /activities/state](#post-activitiesstate) | Creates or merges a state document.
[GET /activities/state](#get-activitiesstate) | Retrieves a single state document or multiple state identifiers.
[DELETE /activities/state](#delete-activitiesstate) | Deletes a single state document or multiple state documents.
[GET /activities](#get-activities) | Retrieves a fully described activity.
[PUT /activities/profile](#put-activitiesprofile) | Creates or overwrites a profile document.
[POST /activities/profile](#post-activitiesprofile) | Creates or merges a profile document.
[GET /activities/profile](#get-activitiesprofile) | Retrieves a single profile document or multiple profile identifiers.
[DELETE /activities/profile](#delete-activitiesprofile) | Deletes a single profile document.
[GET /agents](#get-agents) | Retrieves all of the IFIs associated with a given agent.
[PUT /agents/profile](#put-agentsprofile) | Creates or overwrites a profile document.
[POST /agents/profile](#post-agentsprofile) | Creates or merges a profile document.
[GET /agents/profile](#get-agentsprofile) | Retrieves a single profile document or multiple profile identifiers.
[DELETE /agents/profile](#delete-agentsprofile) | Deletes a single profile document.

## GET /about
This route returns a JSON encoded object containing information about the LRS. A request to this route would look something like the request below.

```http
GET http://www.example.org/data/xAPI/about
Authorization: YOUR_BASIC_AUTH
```

A request like the one above, will respond with a 200 response with a response body like the JSON below, which contains an array of the xAPI versions supported by your Learning Locker instance.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
X-Experience-API-Version: 1.0.3

{ "version": ["1.0.1"] }
```

For more information, view the [GET /about route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#28-about-resource).

## PUT /statements
This route allows you to create a single statement with a statement identifier in the URL parameters and the statement itself in the JSON body. A request to this API would look something like the request below.

```http
PUT http://www.example.org/data/xAPI/statements?statementId=dfb7218c-0fc9-4dfc-9524-d497097de027
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json

{
  "id": "dfb7218c-0fc9-4dfc-9524-d497097de027",
  "actor": { "mbox": "mailto:test@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": { "id": "http://www.example.org/activity" },
}
``` 

This route returns a 204 response with no content when the statement is successfully created, like the example response below.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
X-Experience-API-Consistent-Through: 2017-08-31T15:16:29.709Z
```

For more information, view the [PUT /statements route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#211-put-statements).

## POST /statements
This route allows you to create a multiple statements with or without statement identifiers. A request to this API would look something like the request below.

```http
POST http://www.example.org/data/xAPI/statements
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

[{
  "id": "dfb7218c-0fc9-4dfc-9524-d497097de027",
  "actor": { "mbox": "mailto:test1@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": { "id": "http://www.example.org/activity" },
}, {
  "actor": { "mbox": "mailto:test2@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": { "id": "http://www.example.org/activity" },
}]
```

This route returns a 200 response with an array of statement identifiers when the statements are successfully created. A response from this route would look something like the response below.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
X-Experience-API-Version: 1.0.3
X-Experience-API-Consistent-Through: 2017-08-31T15:16:29.709Z

["dfb7218c-0fc9-4dfc-9524-d497097de027", "dfb7218c-0fc9-4dfc-9524-d497097de028"]
```

For more information, view the [POST /statements route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#212-post-statements).

## GET /statements
This route allows you to retrieve a single statement or multiple statements. If the `statementId` or `voidedStatementId` URL parameters are set, it will [retrieve a single statement](#single-statement) with the given identifier, otherwise it will retrieve [many statements](#many-statements). For more information, view the [GET /statements route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#213-get-statements).

### Single Statement
In addition to the `statementId` and `voidedStatementId` URL parameters (one of which must be set to retrieve a single statement), there are two additional optional parameters in the form of `format` and `attachments`. The `format` parameter defaults to "exact" if it's not set, the other options are "ids" (only includes minimal information) and "canonical" (only includes one language per language map). The `attachments` parameter is a boolean that determines if the statement's attachments are returned with the statement.

```http
GET http://www.example.org/data/xAPI/statements?statementId=dfb7218c-0fc9-4dfc-9524-d497097de027&format=exact&attachments=false
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

When getting a single statement successfully, this route will return a 200 response as shown below with the statement as the body of the request. If the single statement cannot be found, then this route will return a 404 response.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
X-Experience-API-Version: 1.0.3
X-Experience-API-Consistent-Through: 2017-08-31T15:16:29.709Z

{
  "id": "dfb7218c-0fc9-4dfc-9524-d497097de027",
  "actor": { "objectType": "Agent", "mbox": "mailto:test@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": { "objectType": "Activity", "id": "http://www.example.org/activity" },
  "version": "1.0.3",
  "authority": {
    "objectType": "Agent",
    "mbox": "mailto:authority@example.org"
  },
  "timestamp": "2017-09-05T12:45:31+00:00",
  "stored": "2017-09-05T12:45:31+00:00"
}
```

### Many Statements
When retrieving multiple statements there are a number of optional URL parameters listed below that can be used to filter statements. All of the URL parameters should be URL encoded (after JSON encoding if JSON encoding is required).

Parameter | Description
--- | ---
agent | JSON encoded object containing an IFI to match an agent or group.
verb | String matching the statement's verb identifier.
activity | String matching the statement's object identifier.
registration | String matching the statement's registration from the context.
related_activities | Applies the activity filter to any activity in the statement when `true`. Defaults to `false`.
related_agents | Applies the activity filter to any agent/group in the statement when `true`. Defaults to `false`.
since | String that returns statements stored after the given timestamp (exclusive).
until | String that returns statements stored before the given timestamp (inclusive).
limit | Number of statements to return. Defaults to `0` which returns the maximum the server will allow.
format | String ("exact"/"ids"/"canonical") determining how much of the statement is returned. Defaults to "exact" to return the full statement.
attachments | Boolean determining if the statements' attachments should be returned. Defaults to `false`.
ascending | Boolean determining if the statements should be returned in ascending stored order. Defaults to `false`.

Below is an example of a request containing each of the URL parameters.

```http
GET http://www.example.org/data/xAPI/statements?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&verb=http%3A%2F%2Fwww.example.org%2Fverb&activity=http%3A%2F%2Fwww.example.org%2Factivity&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c&related_activities=false&related_agents=false&since=2017-09-04T12:45:31+00:00&until=2017-09-06T12:45:31+00:00&limit=1&format=exact&attachments=false&ascending=false
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

This route will return a 200 response as shown below where the JSON body of the response contains a more link and an array of statements that match the URL parameters. The more link can be used to retrieve the next page of statements, if there aren't any more pages of statements the more link will be an empty string.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
X-Experience-API-Version: 1.0.3
X-Experience-API-Consistent-Through: 2017-08-31T15:16:29.709Z

{
  "more": "/data/xAPI/statements?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&verb=http%3A%2F%2Fwww.example.org%2Fverb&activity=http%3A%2F%2Fwww.example.org%2Factivity&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c&related_activities=false&related_agents=false&since=2017-09-04T12:45:31+00:00&until=2017-09-06T12:45:31+00:00&limit=1&format=exact&attachments=false&ascending=false&cursor=59a8289f399c5b1a19efa60e",
  "statements": [{
    "id": "dfb7218c-0fc9-4dfc-9524-d497097de027",
    "actor": { "objectType": "Agent", "mbox": "mailto:test@example.org" },
    "verb": { "id": "http://www.example.org/verb" },
    "object": { "objectType": "Activity", "id": "http://www.example.org/activity" },
    "context": { "registration": "361cd8ef-0f6a-40d2-81f2-b988865f640c" },
    "version": "1.0.3",
    "authority": {
      "objectType": "Agent",
      "mbox": "mailto:authority@example.org"
    },
    "timestamp": "2017-09-05T12:45:31+00:00",
    "stored": "2017-09-05T12:45:31+00:00"
  }]
}
```

## PUT /activities/state
This route allows you to create a single state document if it doesn't exist or overwrite an existing state document if it does exist. The route has 3 required URL parameters, an `activityId` (an IRI representing the activity), an `agent` (a JSON encoded object representing the agent the state belongs to), and a `stateId` (a string representing an identifier for the state). There is also an optional URL parameter for the `registration`. A request to this route would look something like the request below.

```http
PUT http://www.example.org/data/xAPI/activities/state?activityId=http%3A%2F%2Fwww.example.org%2Factivity&agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&stateId=example_state_id&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

{
  "example_key": "example_value"
}
```

This route returns a 204 response with no content when the state document is successfully created/overwritten, like the example response below.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```

For more information, view the [PUT /activities/state route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#single-document-put--post--get--delete).

## POST /activities/state
This route allows you to create a single state document if it doesn't exist or merge an existing state document if it does exist. The route allows the same URL parameters as the [PUT /activities/state route](#put-activitiesstate). The state document is merged when the state document exists, the existing state document is a JSON encoded object, and the posted state document is a JSON encoded object. When the two JSON encoded documents are merged, only the top-level properties are merged. The example requests below demonstrate merging state documents. For more information, view the [POST /activities/state route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#single-document-put--post--get--delete).

### POST Initial State
To POST an initial state, the request should be something like the request below.

```http
POST http://www.example.org/data/xAPI/activities/state?activityId=http%3A%2F%2Fwww.example.org%2Factivity&agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&stateId=example_state_id&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

{
  "key_to_keep": "value_to_keep",
  "key_to_change": "value_before_change",
}
```

The response to the request above would be something similar to the response below.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```

### POST Merge State
To POST a state for merging, the request should be something like the request below.

```http
POST http://www.example.org/data/xAPI/activities/state?activityId=http%3A%2F%2Fwww.example.org%2Factivity&agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&stateId=example_state_id&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

{
  "key_to_change": "value_after_change",
  "key_to_add": "value_to_add"
}
```

The response to the request above would be something similar to the response below.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```

### GET Merged State
To GET the merged state, the request should be something like the request below.

```http
GET http://www.example.org/data/xAPI/activities/state?activityId=http%3A%2F%2Fwww.example.org%2Factivity&agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&stateId=example_state_id&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

{
  "key_to_keep": "value_to_keep",
  "key_to_change": "value_after_change",
  "key_to_add": "value_to_add"
}
```

## GET /activities/state
This route allows you to retrieve a single state document or multiple state identifiers. If the `stateId` URL parameter is set, it will [retrieve a single state document](#retrieve-single-state-document) with the state identifier, otherwise it will [retrieve many state identifiers](#retrieve-many-state-identifiers). For more information, view the [GET /activities/state route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#single-document-put--post--get--delete).

### Retrieve Single State Document
The route allows the same URL parameters as the [PUT /activities/state route](#put-activitiesstate). A request to this route should be similar to the request below.

```http
GET http://www.example.org/data/xAPI/activities/state?activityId=http%3A%2F%2Fwww.example.org%2Factivity&agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&stateId=example_state_id&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below. If the state document cannot be found, a 404 response will be returned istead of a 200.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

{
  "example_key": "example_value"
}
```

### Retrieve Many State Identifiers
The route allows the same URL parameters as the [PUT /activities/state route](#put-activitiesstate) except for the `stateId` parameter and with the addition of the optional `since` parameter. The `since` URL parameter is an ISO timestamp that ensures only state identifiers stored since the timestamp (exclusive) are returned. A request to this route should be similar to the request below.

```http
GET http://www.example.org/data/xAPI/activities/state?activityId=http%3A%2F%2Fwww.example.org%2Factivity&agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c&since=2017-09-04T12:45:31+00:00
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below, where the JSON encoded response body contains an array of state identifiers that match the URL parameters.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

["example_state_id"]
```

## DELETE /activities/state
This route allows you to delete a single state document or multiple state documents. If the `stateId` URL parameter is set, it will [delete a single state document](#delete-single-state-document) with the state identifier, otherwise it will [delete many state documents](#delete-many-state-documents). For more information, view the [DELETE /activities/state route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#single-document-put--post--get--delete).

### Delete Single State Document
The route allows the same URL parameters as the [PUT /activities/state route](#put-activitiesstate). A request to this route should be similar to the request below.

```http
DELETE http://www.example.org/data/xAPI/activities/state?activityId=http%3A%2F%2Fwww.example.org%2Factivity&agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&stateId=example_state_id&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below. If the state document cannot be found, a 404 response will be returned istead of a 204.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```

### Delete Many State Documents
The route allows the same URL parameters as the [PUT /activities/state route](#put-activitiesstate) except for the `stateId` parameter. A request to this route should be similar to the request below.

```http
DELETE http://www.example.org/data/xAPI/activities/state?activityId=http%3A%2F%2Fwww.example.org%2Factivity&agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&registration=361cd8ef-0f6a-40d2-81f2-b988865f640c
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```
