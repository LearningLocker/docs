---
---

# xAPI HTTP Interface
Learning Locker's HTTP interface conforms to the xAPI specification. The xAPI defines how to track learning experiences for analysis and serves as a guide to maximise interoperability between services that provide learning experiences.

The table below describes the routes that the HTTP interface provides, all of the URLs are relative to http://www.example.org/data/xAPI where http://www.example.org is the URL of your Learning Locker instance. To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under Settings > Clients.

Route | Description
--- | ---
[GET /about](#get-about) | Retrieves information about the LRS.
[PUT /statements](../http-xapi-statements#put-statements) | Stores a single statement.
[POST /statements](../http-xapi-statements#post-statements) | Stores a single statement or multiple statements.
[GET /statements](../http-xapi-statements#get-statements) | Retrieves statements.
[PUT /activities/state](../http-xapi-states#put-activitiesstate) | Creates or overwrites a state document.
[POST /activities/state](../http-xapi-states#post-activitiesstate) | Creates or merges a state document.
[GET /activities/state](../http-xapi-states#get-activitiesstate) | Retrieves a single state document or multiple state identifiers.
[DELETE /activities/state](../http-xapi-states#delete-activitiesstate) | Deletes a single state document or multiple state documents.
[GET /activities](../http-xapi-activities#get-activities) | Retrieves a fully described activity.
[PUT /activities/profile](../http-xapi-activities#put-activitiesprofile) | Creates or overwrites a profile document.
[POST /activities/profile](../http-xapi-activities#post-activitiesprofile) | Creates or merges a profile document.
[GET /activities/profile](../http-xapi-activities#get-activitiesprofile) | Retrieves a single profile document or multiple profile identifiers.
[DELETE /activities/profile](../http-xapi-activities#delete-activitiesprofile) | Deletes a single profile document.
[GET /agents](../http-xapi-agents#get-agents) | Retrieves all of the agents used by a person.
[PUT /agents/profile](../http-xapi-agents#put-agentsprofile) | Creates or overwrites a profile document.
[POST /agents/profile](../http-xapi-agents#post-agentsprofile) | Creates or merges a profile document.
[GET /agents/profile](../http-xapi-agents#get-agentsprofile) | Retrieves a single profile document or multiple profile identifiers.
[DELETE /agents/profile](../http-xapi-agents#delete-agentsprofile) | Deletes a single profile document.

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