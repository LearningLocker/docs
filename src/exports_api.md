---
---

# Exports API

Method | HTTP request | Description
--- | --- | ---
[index](#index) | GET / | Gets all of the exports for the LRS.
[store](#store) | POST / | Creates a new export for the LRS.
[show](#show) | GET /*id* | Gets the export with the given *id*.
[update](#update) | PUT /*id* | Updates the export with the given *id*.
[destroy](#destroy) | DELETE /*id* | Deletes the export with the given *id*.
[showJSON](#showjson) | GET /*id*/show | Gets the statements as JSON from the export with the given *id*.
[showCSV](#showcsv) | GET /*id*/show/csv | Gets the statements as CSV from the export with the given *id*.


*URIs relative to http://www.example.com/api/v1/exports/, unless otherwise noted. Additionally you must supply your Basic Auth details with each request. Your Basic Auth details can be found under "xAPI Statements" in your LRS's settings. Example requests have been provided on our [Postman page](/postman).*

## index
```
GET http://www.example.com/api/v1/exports
```

### Parameters
None.

### Request Body
None.

### Example

    GET http://www.example.com/api/v1/exports

## store
```
POST http://www.example.com/api/v1/exports
```

### Parameters
None.

### Request Body
An Export.

### Example

    POST http://www.example.com/api/v1/exports
    {
      "name": "Example"
      "description": "Some amazing export."
      "report": "000aa000a00a00a00a000000"
      "fields": [
        {"from": "statement.id", "to": "id"}
      ]
    }


## show
```
GET http://www.example.com/api/v1/exports/*id*
```

### Parameters
None.

### Request Body
None.

### Example

    GET http://www.example.com/api/v1/exports/1


## update
```
PUT http://www.example.com/api/v1/exports/*id*
```

### Parameters
None.

### Request Body
An Export.

### Example

    PUT http://www.example.com/api/v1/exports/1
    {
      "name": "Example"
      "description": "Some amazing export."
      "report": "000aa000a00a00a00a000000"
      "fields": [
        {"from": "statement.id", "to": "id"}
      ]
    }


## destroy
```
DELETE http://www.example.com/api/v1/exports/*id*
```

### Parameters
None.

### Request Body
None.

### Example

    DELETE http://www.example.com/api/v1/exports/1


## showJSON
```
GET http://www.example.com/api/v1/exports/*id*/show
```

### Parameters
None.

### Request Body
None.

### Example

    GET http://www.example.com/api/v1/exports/1/show


## showCSV
```
GET http://www.example.com/api/v1/exports/*id*/show/csv
```

### Parameters
None.

### Request Body
None.

### Example

    GET http://www.example.com/api/v1/exports/1/show/csv
