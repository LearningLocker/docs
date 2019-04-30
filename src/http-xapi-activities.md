---
---

# xAPI Activities HTTP Interface
The table below describes the routes that the HTTP interface provides, all of the URLs are relative to http://www.example.org/data/xAPI where http://www.example.org is the URL of your Learning Locker instance. To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**. Go to the [xAPI HTTP interface documentation](../http-xapi) to see the rest of the xAPI routes.

Route | Description
--- | ---
[GET /activities](../http-xapi-activities#get-activities) | Retrieves a fully described activity.
[PUT /activities/profile](../http-xapi-activities#put-activitiesprofile) | Creates or overwrites a profile document.
[POST /activities/profile](../http-xapi-activities#post-activitiesprofile) | Creates or merges a profile document.
[GET /activities/profile](../http-xapi-activities#get-activitiesprofile) | Retrieves a single profile document or multiple profile identifiers.
[DELETE /activities/profile](../http-xapi-activities#delete-activitiesprofile) | Deletes a single profile document.

<iframe src="https://player.vimeo.com/video/168961913" width="80%" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style="padding-left: 15%;"></iframe>

## GET /activities
This route allows you to retrieve the full definition of an activity, meaning that the LRS will return all of the languages displays and extensions that have been sent in statements, along with the most up to date `moreInfo` and `type` property values. This route requires an `activityId` URL parameter (an IRI representing the activity). To try this route out, first [insert two statements with different activity definitions](#insert-different-activity-definitions) and then use the route to [retrieve the full activity definition](#retrieve-full-activity-definition). For more information, view the [GET /activities route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#25-activities-resource).

### Insert Different Activity Definitions
To insert two statements with different activity definitions, use the [POST /statements route](../http-xapi-statements#post-statements) like the request below, which will return a 200 response if the statements are successfully stored.

```http
POST http://www.example.org/data/xAPI/statements
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

[{
  "actor": { "mbox": "mailto:test@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": {
    "id": "http://www.example.org/activity",
    "definition": {
      "name": {
        "en-GB": "GB Activity Name"
      },
      "description": {
        "en-GB": "GB Activity Description"
      },
      "extensions": {
        "http://www.example.com/extension/1": "extension_value_1"
      },
      "moreInfo": "http://www.example.org/activity/moreinfo1",
      "type": "http://www.example.org/activity/type1"
    }
  }
}, {
  "actor": { "mbox": "mailto:test@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": {
    "id": "http://www.example.org/activity",
    "definition": {
      "name": {
        "en-US": "US Activity Name"
      },
      "description": {
        "en-US": "US Activity Description"
      },
      "extensions": {
        "http://www.example.com/extension/2": "extension_value_2"
      },
      "moreInfo": "http://www.example.org/activity/moreinfo2",
      "type": "http://www.example.org/activity/type2"
    }
  }
}]
```

### Retrieve Full Activity Definition
To retrieve the full activity definition, you can use a request similar to the request below.

```http
GET http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
```

The response will always be a 200 for valid requests, similar to the response below. Notice that the `name`, `description`, and `extensions` objects have been merged inside the `definition` object. Also notice that the `moreInfo` and `type` properties are set to the most recent values.

```http
HTTP/1.1 200 OK
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

{
  "id": "http://www.example.org/activity",
  "definition": {
    "name": {
      "en-GB": "GB Activity Name",
      "en-US": "US Activity Name"
    },
    "description": {
      "en-GB": "GB Activity Description",
      "en-US": "US Activity Description"
    },
    "extensions": {
      "http://www.example.com/extension/1": "extension_value_1",
      "http://www.example.com/extension/2": "extension_value_2"
    },
    "moreInfo": "http://www.example.org/activity/moreinfo2",
    "type": "http://www.example.org/activity/type2"
  }
}
```


## PUT /activities/profile
This route allows you to create a single profile document if it doesn't exist or overwrite an existing profile document if it does exist. The route has 2 required URL parameters, an `activityId` (an IRI representing the activity) and a `profileId` (a string representing an identifier for the profile). For more information, view the [PUT /activities/profile route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#27-activity-profile-resource).

### PUT Initial Profile
To PUT an initial profile, the request should be something like the request below. Notice that there is an `If-None-Match` header in the request below, this is to ensure that a profile document doesn't already exist before the profile document is created. Without the `If-None-Match` header there would be a precondition failure thrown and the response would be a 412 for the request below.

```http
PUT http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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

### GET Initial PUT Activity ETag
To retrieve the ETag for the initial profile, you need to retrieve the profile via the [GET /activities/profile route](#get-activitiesprofile). The request below demonstrates how to do this.

```http
GET http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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
To PUT a profile for overwriting, the request should be something like the request below. Notice that the [ETag from the previous request](#get-initial-put-activity-etag) has been used in the `If-Match` header below. Without the `If-Match` header containing the correct ETag there would be a precondition failure thrown and the response would be a 412 for the request below. The `If-Match` header ensures that concurrent updates only change the existing profile document you expected to change.

```http
PUT http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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
GET http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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

## POST /activities/profile
This route allows you to create a single profile document if it doesn't exist or merge an existing profile document if it does exist. The route allows the same URL parameters as the [PUT /activities/profile route](#put-activitiesprofile). The profile document is merged when the profile document exists, the existing profile document is a JSON encoded object, and the posted profile document is a JSON encoded object. When the two JSON encoded documents are merged, only the top-level properties are merged. The example requests below demonstrate merging profile documents. For more information, view the [POST /activities/profile route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#27-activity-profile-resource).

### POST Initial Profile
To POST an initial profile, the request should be something like the request below. Notice that there is an `If-None-Match` header in the request below, this is to ensure that a profile document doesn't already exist before the profile document is created. Without the `If-None-Match` header there would be a precondition failure thrown and the response would be a 412 for the request below.

```http
POST http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8
If-None-Match: "*"

{
  "key_to_keep": "value_to_keep",
  "key_to_change": "value_before_change"
}
```

The response to the request above would be something similar to the response below.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```

### GET Initial POST Activity ETag
To retrieve the ETag for the initial profile, you need to retrieve the profile via the [GET /activities/profile route](#get-activitiesprofile). The request below demonstrates how to do this.

```http
GET http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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
  "key_to_change": "value_before_change"
}
```

### POST Merge Profile
To POST a profile for merging, the request should be something like the request below. Notice that the [ETag from the previous request](#get-initial-post-activity-etag) has been used in the `If-Match` header below. Without the `If-Match` header containing the correct ETag there would be a precondition failure thrown and the response would be a 412 for the request below. The `If-Match` header ensures that concurrent updates only change the existing profile document you expected to change.

```http
POST http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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
GET http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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

## GET /activities/profile
This route allows you to retrieve a single profile document or multiple profile identifiers. If the `profileId` URL parameter is set, it will [retrieve a single profile document](#retrieve-single-activity-document) with the profile identifier, otherwise it will [retrieve many profile identifiers](#retrieve-many-activity-identifiers). For more information, view the [GET /activities/profile route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#27-activity-profile-resource).

### Retrieve Single Activity Document
The route allows the same URL parameters as the [PUT /activities/profile route](#put-activitiesprofile). A request to this route should be similar to the request below.

```http
GET http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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

### Retrieve Many Activity Identifiers
The route allows the same URL parameters as the [PUT /activities/profile route](#put-activitiesprofile) except for the `profileId` parameter and with the addition of the optional `since` parameter. The `since` URL parameter is an ISO timestamp that ensures only profile identifiers stored since the timestamp (exclusive) are returned. A request to this route should be similar to the request below.

```http
GET http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&since=2017-09-04T12:45:31+00:00
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

## DELETE /activities/profile
This route allows you to delete a single profile document and allows the same URL parameters as the [PUT /activities/profile route](#put-activitiesprofile). For more information, view the [DELETE /activities/profile route in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#27-activity-profile-resource).

### GET Activity Profile ETag
To retrieve the ETag for the activity profile, you need to retrieve the profile via the [GET /activities/profile route](#get-activitiesprofile). The request below demonstrates how to do this.

```http
GET http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
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

### Delete Activity Profile
Notice that the [ETag from the previous request](#get-activity-profile-etag) has been used in the `If-Match` header below. Without the `If-Match` header containing the correct ETag there would be a precondition failure thrown and the response would be a 412 for the request below. The `If-Match` header ensures that concurrent deletes only delete the existing profile document you expected to delete.

```http
DELETE http://www.example.org/data/xAPI/activities/profile?activityId=http%3A%2F%2Fwww.example.org%2Factivity&profileId=example_profile_id
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
If-Match: "BBB79685FA17A8450E7307710C8A79FD9C1059A0106E9F9811AF6FD18D0F0EED"
```

The response to the request above would be something similar to the response below. If the profile document cannot be found, a 404 response will be returned instead of a 204.

```http
HTTP/1.1 204 NO CONTENT
X-Experience-API-Version: 1.0.3
```
