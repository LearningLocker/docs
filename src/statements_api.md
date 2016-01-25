---
---

# Statements (Aggregation) API

Method | HTTP request | Description
--- | --- | ---
[where](#where) | GET /where | **Deprecated.** Gets a paginated list of statements that match given filters.
[aggregate](#aggregate) | GET /aggregate | Runs an aggregation of the statements using a pipeline.
[aggregateTime](#aggregatetime) | GET /aggregate/time | **Deprecated.** Runs a time based aggregation of the statements using a match.
[aggregateObject](#aggregateobject) | GET /aggregate/object | **Deprecated.** Runs a object based aggregation of the statements using a match.
[void](#void) | GET http://www.example.com /api/v2/statements/void | Voids statements using a given match.
[insert](#insert) | GET http://www.example.com /api/v2/statements/insert | Inserts new statements from the result of running an aggregation of the existing statements using a pipeline.

*URIs relative to http://www.example.com/api/v1/statements/, unless otherwise noted. Additionally you must supply your Basic Auth details with each request. Your Basic Auth details can be found under "Manage clients" in your LRS's settings.*

**Be aware of [keys with dots](../installation/#quirks) and the [structure of statements in Learning Locker](#structure-of-statements).**

## where
**Deprecated** - use [aggregate](#aggregate) instead.

```
GET http://www.example.com/api/v1/statements/where
```

### Parameters

Name | Type | Description
--- | --- | ---
**filters** | Array of FilterArrays | The filters that the statements must pass.
limit | Integer | The number of statements to be returned (defaults to 100).
page | Integer | The page to be returned (defaults to 1).

*Required parameters are shown in __bold__.*

### Example

    GET http://www.example.com/api/v1/statements/where?limit=10&page=1&filter=[
      ["statement.verb.id", "in", ["verb/1", "verb/2"],
      ["statement.timestamp", "between", "2015-01-01", "2015-01-15"],
      ["statement.actor.mbox", "=", "mailto:ex@mple.com"]
    ]

## aggregate
```
GET http://www.example.com/api/v1/statements/aggregate
```

### Parameters

Name | Type | Description
--- | --- | ---
**pipeline** | [MongoAggregationPipeline](http://docs.mongodb.org/manual/core/aggregation-pipeline/) | The pipeline to pass  statements through.

*Required parameters are shown in __bold__. Note that this endpoint will return voided statements unless specified in your pipeline (see example below).*

### Example

    GET http://www.example.com/api/v1/statements/aggregate?pipeline=[{
      "$match": {
        "statement.timestamp": {
          "$gt":"2015-01-01T00:00",
          "$lt":"2015-01-02T00:00"
        },
        "statement.actor.mbox": "mailto:ex@mple.com",
        "voided": false
      }
    }, {
      "$project": {
        "_id": 0,
        "statement": 1
      }
    }]

## aggregateTime
**Deprecated** - use [aggregate](#aggregate) instead.

```
GET http://www.example.com/api/v1/statements/aggregate/time
```

### Parameters

Name | Type | Description
--- | --- | ---
**match** | [MongoAggregationMatch](http://docs.mongodb.org/manual/reference/operator/aggregation/match/) | The match to pass statements through.

*Required parameters are shown in __bold__. Note that this endpoint will return voided statements unless specified in your pipeline (see example below).*

### Example

    GET http://www.example.com/api/v1/statements/aggregate/time?match={
      "statement.timestamp": {
        "$gt":"2015-01-01T00:00",
        "$lt":"2015-01-02T00:00"
      },
      "statement.actor.mbox": "mailto:ex@mple.com",
      "voided": false
    }


## aggregateObject
**Deprecated** - use [aggregate](#aggregate) instead.

```
GET http://www.example.com/api/v1/statements/aggregate/object
```

### Parameters

Name | Type | Description
--- | --- | ---
**match** | [MongoAggregationMatch](http://docs.mongodb.org/manual/reference/operator/aggregation/match/) | The match to pass statements through.

*Required parameters are shown in __bold__. Note that this endpoint will return voided statements unless specified in your pipeline (see example below).*

### Example

    GET http://www.example.com/api/v1/statements/aggregate/object?match={
      "statement.timestamp": {
        "$gt":"2015-01-01T00:00",
        "$lt":"2015-01-02T00:00"
      },
      "statement.actor.mbox": "mailto:ex@mple.com",
      "voided": false
    }


## void
```
GET http://www.example.com/api/v2/statements/void
```

### Parameters

Name | Type | Description
--- | --- | ---
**match** | [MongoAggregationMatch](http://docs.mongodb.org/manual/reference/operator/aggregation/match/) | The match to pass statements through.

*Required parameters are shown in __bold__. This should be used with __extreme caution__ and we recommend using the [aggregate method](#aggregate) first to check which __statements will be removed__.*

### Example

    GET http://www.example.com/api/v2/statements/void?match={
      "statement.timestamp": {
        "$gt":"2015-01-01T00:00",
        "$lt":"2015-01-02T00:00"
      },
      "statement.actor.mbox": "mailto:ex@mple.com"
    }

## insert
This method attempts to insert whatever data is projected from the given [MongoAggregationPipeline](http://docs.mongodb.org/manual/core/aggregation-pipeline/) as statements.

```
GET http://www.example.com/api/v2/statements/insert
```

### Parameters

Name | Type | Description
--- | --- | ---
**pipeline** | [MongoAggregationPipeline](http://docs.mongodb.org/manual/core/aggregation-pipeline/) | The pipeline to pass statements through.

*Required parameters are shown in __bold__.  Note that this endpoint will match voided statements unless specified in your pipeline (see example below).*

### Example
This example will void all of the statements in an LRS. You could create similar queries to award badges based on a match.

    GET http://www.example.com/api/v2/statements/insert?pipeline=[{
      "$match": {
        "statement.verb.id": {"$ne": "http://adlnet.gov/expapi/verbs/voided"},
        "voided": false
      }
    }, {
      "$project": {
        "_id": 0,
        "actor": {"$literal": {
          "name": "Darth Voider",
          "mbox": "mailto:darth@voider.com"
        }},
        "verb": {
          "id": {"$literal": "http://adlnet.gov/expapi/verbs/voided"},
          "display": {
            "en": {"$literal": "voided"}
          }
        },
        "object": {
          "objectType": {"$literal": "StatementRef"},
          "id": "$statement.id"
        }
      }
    }]

# Structure of Statements

Key | Type | Description
--- | --- | ---
_id | [MongoId](http://php.net/manual/en/class.mongoid.php) | Unique identifer in the database (not the LRS).
lrs_id | [MongoId](http://php.net/manual/en/class.mongoid.php) | The identifier associated with the LRS.
client_id | [MongoId](http://php.net/manual/en/class.mongoid.php) | The identifier associated with the Learning Locker Client that created the statement.
statement | [xAPI Statement](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI.md#stmtprops) | The raw xAPI Statement in JSON.
active | Boolean | Determines if the statement was successfully stored and can be retrieved.
voided | Boolean | Determines if the statement has been voided.
timestamp | [ISODate](https://docs.mongodb.org/manual/core/shell-types/) | A ISODate copy of `statement.timestamp` (better performance).
stored | [ISODate](https://docs.mongodb.org/manual/core/shell-types/) | A ISODate copy of `statement.stored` (better performance).
refs | Array<[xAPI Statement](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI.md#stmtprops)> | An array of raw xAPI statements that are referred to by the current statement.
