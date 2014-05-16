/*
Title: Reporting API
Placing: 7
*/

API Docs
========

- [Bugs](#bugs)
- [Installing on AWS](#aws)

## About

The page details the custom Learning Locker API. This should not be confused with the xAPI as detailed by the [xAPI spec](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI.md).

The purpose of this custom API is to provider developers building reporting type tools with a few additional views of the data within an LRS.

## GET - api/v1/query/analytics

Parameters | Type | Description
----|------|----
filters | Object  | Object of key:value objects, where the key denotes the context path and the value is the value to filter with. Values can be string or array.

**Example**

    {
     "context.contextActivities.grouping.type" : "course",
     "object.definition.type" : "http://activitystrea.ms/schema/1.0/badge",
     "context.contextActivities.grouping.tags" : [
            ['foo', 'bar'], 
            'hello',
            'world'
      ],
     "result.score.raw": [ '<>', 0.6, 0.8]
    }


This example would look to return data where the grouping is a '_course_', the object definition type is '_badge_' and grouping tags are equal to '_foo_' **or** '_bar_' **and** '_hello_' **and** '_world_'. And where the raw result score is between _0.6_ and _0.8_.

### Other parameters

Parameter name | Type | Default
----|------|----
type | String  | time 

##### Description

Type of grouping applied to result.

**time:** return an array of dates with a count for how many filtered statements occurred in a defined interval  (day, week, month, year)

**user:** return an array of actors with a count for how many filtered statements occurred for each activity: return an array of activities with a count for how many filtered statements occurred for each 

**verb:** return an array of verbs with a count for how many filtered statements occurred for each

***

Parameter name | Type | Default
----|------|----
interval | String  | day 

##### Description

User for time grouping only and only applicable when type = time.
* Day
* Week
* Month
* Year

***

Parameter name | Type | Default
----|------|----
since | String  | optional 

##### Description

Format: y,m,d

since: ,2014-03-02

***

Parameter name | Type | Default
----|------|----
until | String  | optional 

##### Description

Format: y,m,d

until: 2014-03-02

To get results for a single day include both since and until. E.g. 
since=2014-03-01&until=2014-03-02 - this will return all results for a 24 hour period from 2014-03-01
