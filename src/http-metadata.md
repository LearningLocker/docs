---
---

# Statement Metadata API HTTP Interface
The [routes table](#routes) below describes the methods that the Statement Metadata HTTP interface provides. Both routes require that you specify an `_id` from the statement record, in order to determine to which statement the metadata should be added. This can be found be found by performing a [GET request on the statement model](#get-statement-_id).

```
POST http://www.example.org/api/v2/statementmetadata/:id
```

To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**.

The JSON body of these methods is a key-value pair such as the following. Some examples of where we currently add metadata can be found on [question statements](../guides-assessment-statements) coming from Adapt.
```
{
  "https://learninglocker.net/true-false-response": "Yes"
}
```

## Schema

Name | Description
--- | --- | ---
_id | The unique id of the [Statement](./http-statements#schema/)
metadata | An object containing key-value pairs, where the key is an IRI representing the metadata field with requirements defined by the [xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Data.md#31-iri-requirements) and the value can be of any type.

## Routes

Method | Description
--- | ---
[PATCH /:id](#patch-id) | Patches a model.
[POST /:id](#post-id) | Creates or overwrites a model.

### PATCH /:id
This route patches the metadata field on a statement that has the specified statement _id from the URL. A request to this route would look something like the request below.

```http
PATCH http://www.example.org/api/v2/statementmetadata/111aaa1111a111111aa11112
Authorization: Basic YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  "example_key": "example_value"
}
```

A request like the one above, will respond with a 200 response like the one below containing the model as JSON in the body.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "_id": "111aaa1111a111111aa11111",
  "metadata": {
    "example_key": "example_value"
  }
}
```

### POST /:id
This route creates or updates the metadata field on a statement that has the specified statement identifier from the URL. 
> `Please note:` It is preferable to use [PATCH](#patch-id) where possible to prevent overwriting metadata set by Learning Locker that is required for certain parts of the UI to work.

A request to this route would look something like the request below.

```http
POST http://www.example.org/api/v2/statementmetadata/111aaa1111a111111aa11112
Authorization: Basic YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  "example_key": "example_value"
}
```

A request like the one above, will respond with a 200 response like the one below containing the model as JSON in the body.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "_id": "111aaa1111a111111aa11111",
  "metadata": {
    "example_key": "example_value"
  }
}
```

## GET statement _id

<!-- We might want to add an example request of how someone could retrieve the statement's _id property after inserting their statement. So perhaps an example of a POST request inserting a statement without an ID and then a GET request using the ID to retrieve the _id. -->
To get the statement _id for the route above, we can perform a GET request on statements via the [REST API](../http-rest/#get-). 

If you haven't already inserted your statements, they can be added via the [xAPI Statements HTTP Interface](../http-xapi-statements/), for example:

```http
POST http://www.example.org/data/xAPI/statements
Authorization: YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json; charset=utf-8

{
  "actor": { "mbox": "mailto:test1@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": { "id": "http://www.example.org/activity" }
}
```

This route returns a 200 response with an array of statement identifiers when the statements are successfully created. A response from this route would look something like the response below.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
X-Experience-API-Version: 1.0.3
X-Experience-API-Consistent-Through: 2017-08-31T15:16:29.709Z

["dfb7218c-0fc9-4dfc-9524-d497097de027"]
```

Then, we can use this statement identifier from the response to query the statement model ([detailed documentation can be found on the HTTP REST page](../http-rest/#get-)), in order to retrieve the `_id` which is used in the statement metadata routes. We can use [URL query parameters](https://florianholzapfel.github.io/express-restify-mongoose/#querying) to get the statement with the specified statement identifier, then select to return the statement identifier and the `_id` is returned by default.

```http
GET http://www.example.org/api/v2/statement?query={"statement.id":"dfb7218c-0fc9-4dfc-9524-d497097de027"}&select={"statement.id":1}
Authorization: Basic YOUR_BASIC_AUTH
```

A request like the one above, will respond with a 200 response like the one below containing the statement model as JSON in the body with only the fields defined in the SELECT parameter. 

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

[
  {
    "_id": "5f32b029f31b0ad6c241f7bb",
    "statement": {
        "id": "dfb7218c-0fc9-4dfc-9524-d497097de027",
    },
  }
]
```

This `_id` is then used to add statement metadata via the [POST](#post) and [PATCH](#patch) routes.