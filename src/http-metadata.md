---
---

# Statement Metadata API HTTP Interface
The table below describes the methods that the Statement Metadata HTTP interface provides.

```
POST http://www.example.org/api/v2/statementmetadata/:id
```

To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**.

Method | Description
--- | ---
[POST /:id](#post-id) | Creates or overwrites a model.
[PATCH /:id](#patch-id) | Patches a model.

## Routes

### POST /:id
This route creates or updates a single model that has the specified identifier from the URL. A request to this route would look something like the request below. Different models will require and respond with a different schema, you can view the schemas by clicking the model names in the [model table above](#models).

```http
POST http://www.example.org/api/v2/statementmetadata/111aaa1111a111111aa11112
Authorization: Basic YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  "createdAt": "2017-08-08T14:35:18.400Z",
  "organisation": "111aaa1111a111111aa11111",
  "statementCount": 987,
  "title": "Updated Title",
  "updatedAt": "2017-08-08T14:35:33.721Z",
  "_id": "111aaa1111a111111aa11112"
}
```

A request like the one above, will respond with a 200 response like the one below containing the model as JSON in the body.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "createdAt": "2017-08-08T14:35:18.400Z",
  "organisation": "111aaa1111a111111aa11111",
  "statementCount": 987,
  "title": "Updated Title",
  "__v": 0,
  "updatedAt": "2017-08-08T14:35:33.721Z",
  "_id": "111aaa1111a111111aa11112"
}
```

### PATCH /:id
This route patches a single model that has the specified identifier from the URL. A request to this route would look something like the request below. Different models will require and respond with a different schema, you can view the schemas by clicking the model names in the [model table above](#models).

```http
PATCH http://www.example.org/api/v2/statementmetadata/111aaa1111a111111aa11112
Authorization: Basic YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  "title": "Patched Title"
}
```

A request like the one above, will respond with a 200 response like the one below containing the model as JSON in the body.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "createdAt": "2017-08-08T14:35:18.400Z",
  "organisation": "111aaa1111a111111aa11111",
  "statementCount": 987,
  "title": "Patched Title",
  "__v": 0,
  "updatedAt": "2017-08-08T14:35:33.721Z",
  "_id": "111aaa1111a111111aa11112"
}
```
