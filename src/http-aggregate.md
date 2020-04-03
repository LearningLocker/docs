---
---

# Aggregate HTTP Interface

The Learning Locker Aggregate HTTP interface utilises the [Mongo aggregation API](https://docs.mongodb.com/manual/aggregation/) and is only available for allowed collections. 
The Aggregate HTTP Interface is more advanced than the xAPI HTTP interface and allows you to access MongoDB's powerful Aggregation API for more custom filtration of documents.

## Allowed Collections

This interface can be used to aggregate on multiple **allowed only** collections. To check whether a collection is allowed for aggregation or not, we use a regular expression. You can specify your own rule using `AGGREGATE_API_ALLOWED_COLLECTIONS` environment variable with `^rollup` default value that means that by default you can aggregate on collections that prefixed with "rollup" word.

## Request Setup

When using this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header.
Your Basic Auth details can be found under **Settings** > **Clients**. The interface requires a `collection` body parameter. `collection` is a string that represents collection name used to execute aggregation on. The optional URL parameters are described in the table below.

Name | Description | Default Value
--- | ---
pipeline | JSON encoded array containing a pipeline of stages for documents to pass through before being output from the interface. | `[]`<br/><br/>(in this case, you'll get records from the desired collection without any transformations)
skip | Number that specifies a number of records that should be skipped from the beginning. This parameter will be transformed into `$skip` aggregation stage and executed at the very end. | `0`
limit | Number that specifies a number of records that will be cut from the final results. This parameter will be transformed into `$limit` aggregation stage and executed at the very end. | `10000`
maxTimeMS | Number that specifies the time limit for the query in Mongo. | `0`<br/><br/>(if nothing else was set to `MAX_TIME_MS` environment variable)
batchSize | Specifies the number of documents to return in each batch of the response from the MongoDB instance. Defaults to `100` | `100`

A simple request to this interface using all of the available parameters looks like the request below. 

```http
POST http://www.example.org/api/aggregate
Authorization: Basic YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
    "collection": "rollup_collection",
    "pipeline": "[]",
    "skip": 0,
    "limit": 1,
    "maxTimeMs": 100,
    "batchSize": 100
}

```
A response to this valid request will return a 200 response like the response below, where the JSON encoded body contains several keys.

```http
{
    "result": [],
    "startedAt": "2020-04-03 14:17:30.924+03:00",
    "completedAt": "2020-04-03 14:17:30.943+03:00"
}
```

## Pipeline Stages
So far we've only seen the `limit` and `project` stages, however, there are many other [stages available in Mongo](https://docs.mongodb.com/manual/reference/operator/aggregation-pipeline/). The common stages are listed in the table below.

Name | Description
--- | ---
[project](#project-stage) | Reshapes the records from the previous stage of the pipeline for the next stage.
[match](#match-stage) | Filters the records from the previous stage of the pipeline for the next stage.
[limit](#limit-stage) | Limits the number of records from the previous stage of the pipeline for the next stage.
[skip](#skip-stage) | Skips a number of records from the previous stage of the pipeline for the next stage.
[group](#group-stage) | Groups records by a specified identifier from the previous stage of the pipeline for the next stage.
[sort](#sort-stage) | Sorts the records from the previous stage of the pipeline for the next stage.

