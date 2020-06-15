---
---

# Activities HTTP Interface

An activity represents an activity with many [identifiers](../http-activity-identifiers).

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/activity.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/activity.

### Schema

Name | Description 
--- | ---
_id | The id of the activity.
organisation | The id of the [organisation](../http-organisations#schema) that this activity belongs to.
name | The display name of this activity.
definition | An object holding details of the activity. See [definition](#definition).

### Definition

Name | Description
--- | ---
type | The type of the activity.
interactionType | Possible values are: true-false, choice, fill-in, long-fill-in, matching, performance, sequencing, likert, numeric or other. See [Interaction Types](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Data.md#interaction-types) for full description.

### Example

```json
{
  "_id": "59c1219936229d4ce9634601",
  "organisation": "59c1219936229d4ce9634602",
  "name": "Example Activity",
  "definition": {
    "type": "http://adlnet.gov/expapi/activities/question",
    "interactionType": "choice"
  },
}
```
