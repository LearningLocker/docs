---
---

# xAPI State HTTP Interface
The table below describes the routes that the HTTP interface provides, all of the URLs are relative to http://www.example.org/data/xAPI where http://www.example.org is the URL of your Learning Locker instance. To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**. Go to the [xAPI HTTP interface documentation](../http-xapi) to see the rest of the xAPI routes.

Route | Description
--- | ---
[PUT /activities/state](../http-xapi-states#put-activitiesstate) | Creates or overwrites a state document.
[POST /activities/state](../http-xapi-states#post-activitiesstate) | Creates or merges a state document.
[GET /activities/state](../http-xapi-states#get-activitiesstate) | Retrieves a single state document or multiple state identifiers.
[DELETE /activities/state](../http-xapi-states#delete-activitiesstate) | Deletes a single state document or multiple state documents.

<iframe src="https://player.vimeo.com/video/168960742" width="80%" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="padding-left: 15%;"></iframe>

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

The response to the request above would be something similar to the response below. If the state document cannot be found, a 404 response will be returned instead of a 200.

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

The response to the request above would be something similar to the response below. If the state document cannot be found, a 404 response will be returned instead of a 204.

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
