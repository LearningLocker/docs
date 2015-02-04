---
---

# Reports API

Method | HTTP request | Description
--- | --- | ---
[index](#index) | GET / | Gets all of the reports for the LRS.
[store](#store) | POST / | Creates a new report for the LRS.
[show](#show) | GET /*id* | Gets the report with the given *id*.
[update](#update) | PUT /*id* | Updates the report with the given *id*.
[run](#run) | GET /*id*/run | **Deprecated**. Gets a paginated list of statements from the report with the given *id*.
[graph](#graph) | GET /*id*/graph | **Deprecated**. Gets the graph data of statements from the report with the given *id*.


*URIs relative to http://www.example.com/api/v1/reports/, unless otherwise noted. Additionally you must supply your Basic Auth details with each request. Your Basic Auth details can be found under "xAPI Statements" in your LRS's settings.*

## index
```
GET http://www.example.com/api/v1/reports
```

### Parameters
None.

### Request Body
None.

### Example

    GET http://www.example.com/api/v1/reports

## store
```
POST http://www.example.com/api/v1/reports
```

### Parameters
None.

### Request Body
A Report.

### Example

    POST http://www.example.com/api/v1/reports
    {
      "name": "Example"
      "description": "Some amazing report."
      "query": {
        "statement.actor.mbox": ["mailto:ex@mple.com"]
      },
      since: "2015-01-07",
      until: "2015-01-24"
    }


## show
```
GET http://www.example.com/api/v1/reports/*id*
```

### Parameters
None.

### Request Body
None.

### Example

    GET http://www.example.com/api/v1/reports/1


## update
```
PUT http://www.example.com/api/v1/reports/*id*
```

### Parameters
None.

### Request Body
A Report.

### Example

    PUT http://www.example.com/api/v1/reports/1
    {
      "name": "Example"
      "description": "Some amazing report."
      "query": {
        "statement.actor.mbox": ["mailto:ex@mple.com"]
      },
      since: "2015-01-07",
      until: "2015-01-24"
    }


## destroy
```
DELETE http://www.example.com/api/v1/reports/*id*
```

### Parameters
None.

### Request Body
None.

### Example

    DELETE http://www.example.com/api/v1/reports/1


## run
**Deprecated**. Instead you can [GET the report](#show), then [aggregate](http://docs.learninglocker.net/statements_api/#aggregate).
```
GET http://www.example.com/api/v1/reports/*id*/run
```

### Parameters

Name | Type | Description
--- | --- | ---
limit | Integer | The number of statements to be returned (defaults to 20).
page | Integer | The page to be returned (defaults to 1).

*Required parameters are shown in __bold__.*

### Request Body
None.

### Example

    GET http://www.example.com/api/v1/reports/1/run


## graph
**Deprecated**. Instead you can [GET the report](#show), then [aggregate](http://docs.learninglocker.net/statements_api/#aggregate).
```
GET http://www.example.com/api/v1/reports/*id*/graph
```

### Parameters
None.

### Request Body
None.

### Example

    GET http://www.example.com/api/v1/reports/1/graph
