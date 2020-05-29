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

### Example

```json
{
  "_id" : "59c1219936229d4ce9634601",
  "organisation" : "59c1219936229d4ce9634602",
  "name" : "Example Activity",
}
```
