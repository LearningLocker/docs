---
---

# Query (Analytics) API

The purpose of this custom API is to provide developers building reporting type tools with a few additional views of the data within an LRS.

Method | HTTP request | Description
--- | --- | ---
[analytics](#analytics) | GET /analytics | Gets an aggregated query of the statements.

*URIs relative to http://www.example.com/api/v1/query/, unless otherwise noted. Additionally you must supply your Basic Auth details with each request. Your Basic Auth details can be found under "xAPI Statements" in your LRS's settings.*

## analytics
```
GET http://www.example.com/api/v1/query/analytics
```

### Parameters

Name | Type | Description
--- | --- | ---
**filter** | [QueryFilter](#queryfilter) | The filters that the statements must pass.
type | [QueryType](#querytype) | Type of grouping applied (defaults to "time").
interval | [QueryInterval](#queryinterval) | Time grouping, only applicable when `type` = time (defaults to "day").
since | [QueryDate](#querydate) | Date to begin returning statements.
until | [QueryDate](#querydate) | Date to stop returning statements.

*Required parameters are shown in __bold__.*

### Example

    GET http://www.example.com/api/v1/query/analytics?type=time&interval=day&since=2015-01-01&until=2015-01-02&filter={
      "context.contextActivities.grouping.type": "course",
      "object.definition.type": "http://activitystrea.ms/schema/1.0/badge",
      "context.contextActivities.grouping.tags": [
        ["foo", "bar"], 
        "hello",
        "world"
      ],
      "result.score.raw": ["<>", 0.6, 0.8]
    }

This example would look to return data where the grouping is a ‘course’, the object definition type is ‘badge’ and grouping tags are equal to ‘foo’ or ‘bar’ and ‘hello’ and ‘world’. And where the raw result score is between 0.6 and 0.8.

## Parameter Types
### Query Filter
Object, where the `key` is a `path` and the `value` is the `filter`. A `filter` can be either:

- Array of 3 items where the first is "<>". This will return objects where the `path` is between the value of the 2nd item and 3rd item (where the 3rd item is the greatest).
- Array of values. This will return objects where the `path` is equal to any of the items in the Array.
- String.
- Number.
- Boolean.
- Object.

### QueryType
String containing either:

- "time": return an array of dates with a count for how many filtered statements occurred in a defined interval  (day, week, month, year)
- "user": return an array of actors with a count for how many filtered statements occurred for each activity: return an array of activities with a count for how many filtered statements occurred for each 
- "verb": return an array of verbs with a count for how many filtered statements occurred for each

### QueryInterval
String containing either:

- "day"
- "week"
- "month"
- "year"

### QueryDate
String of the form YYYY-MM-DD.
