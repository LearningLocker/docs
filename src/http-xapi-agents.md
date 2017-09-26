---
---

# xAPI Agents HTTP Interface
The table below describes the routes that the HTTP interface provides, all of the URLs are relative to http://www.example.org/data/xAPI where http://www.example.org is the URL of your Learning Locker instance. To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**. Go to the [xAPI HTTP interface documentation](../http-xapi) to see the rest of the xAPI routes.

Route | Description
--- | ---
[GET /agents](../http-xapi-agents#get-agents) | Retrieves all of the agents used by a person.
[PUT /agents/profile](../http-xapi-agents#put-agentsprofile) | Creates or overwrites a profile document.
[POST /agents/profile](../http-xapi-agents#post-agentsprofile) | Creates or merges a profile document.
[GET /agents/profile](../http-xapi-agents#get-agentsprofile) | Retrieves a single profile document or multiple profile identifiers.
[DELETE /agents/profile](../http-xapi-agents#delete-agentsprofile) | Deletes a single profile document.

<iframe src="https://player.vimeo.com/video/168960743" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

## GET /agents
This route allows you to retrieve all of the agents that are used by a single person, given one of the agents that they use via the required `agent` URL parameter. The request below demonstrates how this is done. A person can be created by inserting statements or using the [Persona HTTP interface](../http-personas). Multiple agents can be associated with a person by using the [Persona HTTP interface](../http-personas) too. For more information, view the [GET /agents route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#24-agents-resource).

```http
GET http://www.example.org/data/xAPI/agents?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response will always be a 200 for valid requests, similar to the response below. 

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

{
  "objectType": "Person",
  "account": [],
  "mbox": ["mailto:test@example.org"],
  "mbox_sha1sum": [],
  "openid": []
}
```

## PUT /agents/profile
This route allows you to create a single profile document if it doesn't exist or overwrite an existing profile document if it does exist. The route has 2 required URL parameters, an `agent` (a JSON encoded object representing the agent that the profile belongs to) and a `profileId` (a string representing an identifier for the profile). For more information, view the [PUT /agents/profile route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#agentprofres).

### PUT Initial Profile
To PUT an initial profile, the request should be something like the request below. Notice that there is an `If-None-Match` header in the request below, this is to ensure that a profile document doesn't already exist before the profile document is created. Without the `If-None-Match` header there would be a precondition failure thrown and the response would be a 412 for the request below.

```http
PUT http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
If-None-Match: "*"

{
  "key_to_remove": "value_to_remove",
  "key_to_change": "value_before_changed"
}
```

This route returns a 204 response with no content when the profile document is successfully created, like the example response below. The route will return 412 for a precondition failure if the profile document does already exist and the profile document will not be changed. 

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```

### GET Initial PUT Agent ETag
To retrieve the ETag for the initial profile, you need to retrieve the profile via the [GET /agents/profile route](#get-agentsprofile). The request below demonstrates how to do this.

```http
GET http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below. Notice that it contains the `ETag` header.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
ETag: "7C0791125FAB08C7EB75CC8044CFDCEA56F506958DEEE763E6608608EE76C9EE"
Last-Modified: 2017-08-31T15:16:29.709Z

{
  "key_to_remove": "value_to_remove",
  "key_to_change": "value_before_changed"
}
```

### PUT Overwrite Profile
To PUT a profile for overwriting, the request should be something like the request below. Notice that the [ETag from the previous request](#get-initial-put-agent-etag) has been used in the `If-Match` header below. Without the `If-Match` header containing the correct ETag there would be a precondition failure thrown and the response would be a 412 for the request below. The `If-Match` header ensures that concurrent updates only change the existing profile document you expected to change.

```http
PUT http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
If-Match: "7C0791125FAB08C7EB75CC8044CFDCEA56F506958DEEE763E6608608EE76C9EE"

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

### GET Overwritten Profile
To GET the overwritten profile, the request should be something like the request below.

```http
GET http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
ETag: "BBB79685FA17A8450E7307710C8A79FD9C1059A0106E9F9811AF6FD18D0F0EED"
Last-Modified: 2017-08-31T15:17:29.709Z

{
  "key_to_change": "value_after_change",
  "key_to_add": "value_to_add"
}
```

## POST /agents/profile
This route allows you to create a single profile document if it doesn't exist or merge an existing profile document if it does exist. The route allows the same URL parameters as the [PUT /agents/profile route](#put-agentsprofile). The profile document is merged when the profile document exists, the existing profile document is a JSON encoded object, and the posted profile document is a JSON encoded object. When the two JSON encoded documents are merged, only the top-level properties are merged. The example requests below demonstrate merging profile documents. For more information, view the [POST /agents/profile route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#agentprofres).

### POST Initial Profile
To POST an initial profile, the request should be something like the request below. Notice that there is an `If-None-Match` header in the request below, this is to ensure that a profile document doesn't already exist before the profile document is created. Without the `If-None-Match` header there would be a precondition failure thrown and the response would be a 412 for the request below.

```http
POST http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
If-None-Match: "*"

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

### GET Initial POST Agent ETag
To retrieve the ETag for the initial profile, you need to retrieve the profile via the [GET /agents/profile route](#get-agentsprofile). The request below demonstrates how to do this.

```http
GET http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below. Notice that it contains the `ETag` header.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
ETag: "7C0791125FAB08C7EB75CC8044CFDCEA56F506958DEEE763E6608608EE76C9EE"
Last-Modified: 2017-08-31T15:16:29.709Z

{
  "key_to_keep": "value_to_keep",
  "key_to_change": "value_before_change",
}
```

### POST Merge Profile
To POST a profile for merging, the request should be something like the request below. Notice that the [ETag from the previous request](#get-initial-post-agent-etag) has been used in the `If-Match` header below. Without the `If-Match` header containing the correct ETag there would be a precondition failure thrown and the response would be a 412 for the request below. The `If-Match` header ensures that concurrent updates only change the existing profile document you expected to change.

```http
POST http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
If-Match: "7C0791125FAB08C7EB75CC8044CFDCEA56F506958DEEE763E6608608EE76C9EE"

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

### GET Merged Profile
To GET the merged profile, the request should be something like the request below.

```http
GET http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
ETag: "BBB79685FA17A8450E7307710C8A79FD9C1059A0106E9F9811AF6FD18D0F0EED"
Last-Modified: 2017-08-31T15:17:29.709Z

{
  "key_to_keep": "value_to_keep",
  "key_to_change": "value_after_change",
  "key_to_add": "value_to_add"
}
```

## GET /agents/profile
This route allows you to retrieve a single profile document or multiple profile identifiers. If the `profileId` URL parameter is set, it will [retrieve a single profile document](#retrieve-single-agent-document) with the profile identifier, otherwise it will [retrieve many profile identifiers](#retrieve-many-agent-identifiers). For more information, view the [GET /agents/profile route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#agentprofres).

### Retrieve Single Agent Document
The route allows the same URL parameters as the [PUT /agents/profile route](#put-agentsprofile). A request to this route should be similar to the request below.

```http
GET http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below. If the profile document cannot be found, a 404 response will be returned instead of a 200.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
ETag: "7C0791125FAB08C7EB75CC8044CFDCEA56F506958DEEE763E6608608EE76C9EE"
Last-Modified: 2017-08-31T15:16:29.709Z

{
  "example_key": "example_value"
}
```

### Retrieve Many Agent Identifiers
The route allows the same URL parameters as the [PUT /agents/profile route](#put-agentsprofile) except for the `profileId` parameter and with the addition of the optional `since` parameter. The `since` URL parameter is an ISO timestamp that ensures only profile identifiers stored since the timestamp (exclusive) are returned. A request to this route should be similar to the request below.

```http
GET http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&since=2017-09-04T12:45:31+00:00
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below, where the JSON encoded response body contains an array of profile identifiers that match the URL parameters.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

["example_profile_id"]
```

## DELETE /agents/profile
This route allows you to delete a single profile document and allows the same URL parameters as the [PUT /agents/profile route](#put-agentsprofile). For more information, view the [DELETE /agents/profile route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#agentprofres).

### GET Agent Profile ETag
To retrieve the ETag for the agent profile, you need to retrieve the profile via the [GET /agents/profile route](#get-agentsprofile). The request below demonstrates how to do this.

```http
GET http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response to the request above would be something similar to the response below.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
ETag: "BBB79685FA17A8450E7307710C8A79FD9C1059A0106E9F9811AF6FD18D0F0EED"
Last-Modified: 2017-08-31T15:17:29.709Z

{
  "example_key": "example_value"
}
```

### Delete Agent Profile
Notice that the [ETag from the previous request](#get-agent-profile-etag) has been used in the `If-Match` header below. Without the `If-Match` header containing the correct ETag there would be a precondition failure thrown and the response would be a 412 for the request below. The `If-Match` header ensures that concurrent deletes only delete the existing profile document you expected to delete.

```http
DELETE http://www.example.org/data/xAPI/agents/profile?agent=%7B%22mbox%22%3A%20%22mailto%3Atest%40example.org%22%7D&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
If-Match: "BBB79685FA17A8450E7307710C8A79FD9C1059A0106E9F9811AF6FD18D0F0EED"
```

The response to the request above would be something similar to the response below. If the profile document cannot be found, a 404 response will be returned instead of a 204.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```
