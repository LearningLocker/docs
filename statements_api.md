---
---

# Statements API

Method | HTTP request | Description
--- | --- | ---
[where](#where) | GET /where | Gets a paginated list of statements that match given filters.
[aggregate](#aggregate) | GET /aggregate | Runs an aggregation of the statements using a pipeline.
[aggregateTime](#aggregatetime) | GET /aggregate/time | Runs a time based aggregation of the statements using a match.
[aggregateObject](#aggregateobject) | GET /aggregate/object | Runs a object based aggregation of the statements using a match.

*URIs relative to http://www.example.com/api/v1/statements/, unless otherwise noted. Additionally you must supply your Basic Auth details with each request. Your Basic Auth details can be found under "xAPI Statements" in your LRS's settings.*

## where
```
GET http://www.example.com/api/v1/statements/where
```

### Parameters
Name | Type | Description
--- | --- | ---
**filters** | Array<FilterArray> | The filters that the statements must pass.
limit | Integer | The number of statements to be returned (defaults to 100).
page | Integer | The page to be returned (defaults to 1).
*Required parameters are shown in __bold__.*

### Example
```
GET http://www.example.com/api/v1/statements/where?limit=10&page=1&filters=[
  ["statement.verb.id", "in", ["verb/1", "verb/2"],
  ["statement.timestamp", "between", "2015-01-01", "2015-01-15"],
  ["statement.actor.mbox", "mailto:ex@mple.com"]
]
```

## aggregate
```
GET http://www.example.com/api/v1/statements/aggregate
```

### Parameters
Name | Type | Description
--- | --- | ---
**pipeline** | [MongoAggregationPipeline](http://docs.mongodb.org/manual/core/aggregation-pipeline/) | The pipeline to pass statements through.
*Required parameters are shown in __bold__.*

### Example
```
GET http://www.example.com/api/v1/statements/aggregate?pipeline=[{
  "$match": {
    "statement.timestamp": {
      "$gt":"2015-01-01",
      "$lt":"2015-01-01"
    },
    "statement.actor.mbox": "mailto:ex@mple.com"
  }
}, {
  "project": {
    "_id": 0,
    "statement": 1
  }
}]
```

## aggregateTime
```
GET http://www.example.com/api/v1/statements/aggregate/time
```

### Parameters
Name | Type | Description
--- | --- | ---
**match** | [MongoAggregationMatch](http://docs.mongodb.org/manual/reference/operator/aggregation/match/) | The match to pass statements through.
*Required parameters are shown in __bold__.*

### Example
```
GET http://www.example.com/api/v1/statements/aggregate/time?match={
  "statement.timestamp": {
    "$gt":"2015-01-01",
    "$lt":"2015-01-01"
  },
  "statement.actor.mbox": "mailto:ex@mple.com"
}
```

## aggregateObject
```
GET http://www.example.com/api/v1/statements/aggregate/object
```

### Parameters
Name | Type | Description
--- | --- | ---
**match** | [MongoAggregationMatch](http://docs.mongodb.org/manual/reference/operator/aggregation/match/) | The match to pass statements through.
*Required parameters are shown in __bold__.*

### Example
```
GET http://www.example.com/api/v1/statements/aggregate/object?match={
  "statement.timestamp": {
    "$gt":"2015-01-01",
    "$lt":"2015-01-01"
  },
  "statement.actor.mbox": "mailto:ex@mple.com"
}
```

