---
---

# Aggregation HTTP Interface

The Learning Locker Aggregation HTTP interface utilises the [Mongo aggregation API](https://docs.mongodb.com/manual/aggregation/) and is only available for statements. You must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under Settings > Clients. The interface requires a `pipeline` URL parameter, which is a JSON encoded array containing a pipeline of stages for statements to pass through before being output from the interface. The optional URL parameters are described in the table below.

Name | Description
--- | ---
cache | Boolean that determines if the result should be cached for reuse next time the pipeline is used.
maxTimeMS | Number that specifies the time limit for the query in Mongo.
maxScan | Number that specifies the maximum number of models to scan in Mongo.

A simple request to this interface using all of the available URL parameters looks like the request below. In the request below, the pipeline contains two stages, one to limit the route to returning a max of 1 statement and another to only project the `statement` from the statement's model.

```http
GET http://www.example.org/api/statements/aggregate?cache=false&maxTimeMS=5000&maxScan=10000&pipeline=%5B%7B%22%24limit%22%3A%201%7D%2C%20%7B%22%24project%22%3A%20%7B%20%22statement%22%3A%201%2C%20%22_id%22%3A%200%20%7D%7D%5D
Authorization: Basic YOUR_BASIC_AUTH
```

A response to this valid request will return a 200 response like the response below, where the JSON encoded body contains an array of objects.

```http
HTTP/1.1 204 NO CONTENT
Content-Type: application/json; charset=utf-8

[{
  "statement": {
    "id": "dfb7218c-0fc9-4dfc-9524-d497097de027",
    "actor": { "objectType": "Agent", "mbox": "mailto:test@example.org" },
    "verb": { "id": "http://www.example.org/verb" },
    "object": { "objectType": "Activity", "id": "http://www.example.org/activity" },
    "version": "1.0.3",
    "authority": { "objectType": "Agent", "mbox": "mailto:authority@example.org" },
    "timestamp": "2017-09-05T12:45:31+00:00",
    "stored": "2017-09-05T12:45:31+00:00"
  }
}]
```