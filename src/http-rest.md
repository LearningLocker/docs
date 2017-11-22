---
redirect_from: 
   - "/http-models/"
---

# REST API HTTP Interface
The table below describes the routes that the HTTP interface provides. This HTTP interface is available for all models in Learning Locker.

```
GET http://www.example.org/api/v2/MODEL_NAME
```

For example, to get a count of stores via this API, you'd use the following route.

```
GET http://www.example.org/api/v2/lrs
```

To access this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**.

Method | Description
--- | ---
[GET /count](#get-count) | Gets a count of the models.
[GET /](#get) | Gets a subset of the models.
[POST /](#post) | Creates a model.
[GET /:id](#get-id) | Gets a single model.
[PUT /:id](#put-or-post-id) | Creates or overwrites a model.
[POST /:id](#put-or-post-id) | Creates or overwrites a model.
[PATCH /:id](#patch-id) | Patches a model.
[DELETE /:id](#delete-id) | Deletes a model.

## Models
The table below lists the models supported by this interface, you can view the model schemas by clicking the model names.

Name | API Model Name | Description
--- | --- | ---
[Client](../http-clients#schema) | `client` | Credentials that access HTTP Interfaces.
[Dashboard](../http-dashboards#schema) | `dashboard` | Customisable grid of visualisations.
[Download](../http-downloads#schema) | `download` | Record of downloaded exports.
[Export](../http-exports#schema) | `export` | Template for exporting statements.
[Journey](../http-journeys#schema) | `journey` | Journeys visualisation.
[Journey Progress](../http-journey-progress#schema) | `journeyprogress` | Journey progress.
[Organisation](../http-organisations#schema) | `organisation` | Container of clients and stores that a subset of users can access.
[Persona](../http-personas#schema) | `persona` | Group of xAPI agents relating to a single person.
[Query](../http-queries#schema) | `query` | Saved filter for statements.
[Role](../http-roles#schema) | `role` | Group of permissions for accessing organisation data via users.
[Store](../http-stores#schema) | `store` | Container for xAPI data (statements, documents, and attachments).
[User](../http-users#schema) | `user` | Login details for accessing the UI.
[Visualisation](../http-visualisations#schema) | `visualisation` | Graphical view of statements.

## Routes
### GET /count
This route returns a count of the models. A request to this route would look something like the request below.

```http
GET http://www.example.org/api/v2/lrs/count
Authorization: YOUR_BASIC_AUTH
```

A request like the one above, will respond with a 200 response like the one below containing a count of the models in the body.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

123
```

For more information about the acceptable URL query parameters, view the [Restify documentation](https://florianholzapfel.github.io/express-restify-mongoose/#querying).

### GET /
This route returns an array of models. A request to this route would look something like the request below.

```http
GET http://www.example.org/api/v2/lrs
Authorization: YOUR_BASIC_AUTH
```

A request like the one above, will respond with a 200 response like the one below containing the models as JSON in the body. Different models will respond with a different schema, you can view the schemas by clicking the model names in the [model table above](#models).

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

[{
  createdAt: "2017-08-08T14:35:18.400Z",
  organisation: "111aaa1111a111111aa11111",
  statementCount: 987,
  title: "Example Store",
  updatedAt: "2017-08-08T14:35:33.721Z",
  _id: "111aaa1111a111111aa11112"
}]
```

For more information about the acceptable URL query parameters, view the [Restify documentation](https://florianholzapfel.github.io/express-restify-mongoose/#querying).

### POST /
This route creates a model. A request to this route would look something like the request below. Different models will require and respond with a different schema, you can view the schemas by clicking the model names in the [model table above](#models).

```http
POST http://www.example.org/api/v2/lrs
Authorization: YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  title: "Example Store",
}
```

A request like the one above, will respond with a 201 response like the one below containing the created model in the JSON body.

```http
HTTP/1.1 201 CREATED
Content-Type: application/json; charset=utf-8

{
  createdAt: "2017-08-08T14:35:18.400Z",
  organisation: "111aaa1111a111111aa11111",
  statementCount: 0,
  title: "Example Store",
  updatedAt: "2017-08-08T14:35:33.721Z",
  _id: "111aaa1111a111111aa11112"
}
```

### GET /:id
This route returns a single model that has the specified identifier from the URL. A request to this route would look something like the request below.

```http
GET http://www.example.org/api/v2/lrs/111aaa1111a111111aa11112
Authorization: YOUR_BASIC_AUTH
```

A request like the one above, will respond with a 200 response like the one below containing the model as JSON in the body. Different models will respond with a different schema, you can view the schemas by clicking the model names in the [model table above](#models). Note that the request will return a 404 response if the model doesn't exist.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  createdAt: "2017-08-08T14:35:18.400Z",
  organisation: "111aaa1111a111111aa11111",
  statementCount: 987,
  title: "Example Store",
  updatedAt: "2017-08-08T14:35:33.721Z",
  _id: "111aaa1111a111111aa11112"
}
```

For more information about the acceptable URL query parameters, view the [Restify documentation](https://florianholzapfel.github.io/express-restify-mongoose/#querying).

### PUT or POST /:id
This route creates or updates a single model that has the specified identifier from the URL. A request to this route would look something like the request below. Different models will require and respond with a different schema, you can view the schemas by clicking the model names in the [model table above](#models).

```http
PUT http://www.example.org/api/v2/lrs/111aaa1111a111111aa11112
Authorization: YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  createdAt: "2017-08-08T14:35:18.400Z",
  organisation: "111aaa1111a111111aa11111",
  statementCount: 987,
  title: "Updated Title",
  updatedAt: "2017-08-08T14:35:33.721Z",
  _id: "111aaa1111a111111aa11112"
}
```

A request like the one above, will respond with a 200 response like the one below containing the model as JSON in the body.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  createdAt: "2017-08-08T14:35:18.400Z",
  organisation: "111aaa1111a111111aa11111",
  statementCount: 987,
  title: "Updated Title",
  updatedAt: "2017-08-08T14:35:33.721Z",
  _id: "111aaa1111a111111aa11112"
}
```

### PATCH /:id
This route patches a single model that has the specified identifier from the URL. A request to this route would look something like the request below. Different models will require and respond with a different schema, you can view the schemas by clicking the model names in the [model table above](#models).

```http
PATCH http://www.example.org/api/v2/lrs/111aaa1111a111111aa11112
Authorization: YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  title: "Patched Title",
}
```

A request like the one above, will respond with a 200 response like the one below containing the model as JSON in the body.

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  createdAt: "2017-08-08T14:35:18.400Z",
  organisation: "111aaa1111a111111aa11111",
  statementCount: 987,
  title: "Patched Title",
  updatedAt: "2017-08-08T14:35:33.721Z",
  _id: "111aaa1111a111111aa11112"
}
```

### DELETE /:id
This route deletes a single model that has the specified identifier from the URL. A request to this route would look something like the request below.

```http
DELETE http://www.example.org/api/v2/lrs/111aaa1111a111111aa11112
Authorization: YOUR_BASIC_AUTH
```

A request like the one above, will respond with a 204 response like the one below.

```http
HTTP/1.1 204 NO CONTENT
```
