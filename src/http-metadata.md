---
---

# Statement Metadata API HTTP Interface
The table below describes the methods that the Statement Metadata HTTP interface provides.

```
POST http://www.example.org/api/v2/statementmetadata/:id
```

To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**.

The JSON body of these methods is a key-value pair such as the following. Note that when using metadata keys, you need to replace any dots with `&46;` because Mongo does not allow dots in keys. Some examples of where we currently add metadata can be found on [question statements](../guides-assessment-statements) coming from Adapt.
```
{
  "https://learninglocker&46;net/true-false-response": "Yes"
}
```

Method | Description
--- | ---
[POST /:id](#post-id) | Creates or overwrites a model.
[PATCH /:id](#patch-id) | Patches a model.

## Routes

### POST /:id
This route creates or updates the metadata field on a statement that has the specified statement identifier from the URL. A request to this route would look something like the request below.

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


### PATCH /:id
This route patches the metadata field on a statement that has the specified statement identifier from the URL. A request to this route would look something like the request below.

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
