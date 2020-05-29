---
---

# Activity Identifiers HTTP Interface

Represents a unique identifier for an activity. These identifiers are linked to the [activity](../http-activities) that the identifier belongs to.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/activityidentifier.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/activityidentifier.

### Schema

Name | Description
--- | ---
_id | The id of this identifier.
organisation | The id of the [organisation](../http-organisations) this identifier belongs to.
activityId | The id of the [activity](../http-activities) this identifier belongs to.
activityUrl | The url of this activity

### Example

```json
{
  "_id" : "59c1219936229d4ce9634601",
  "organisation" : "59c1219936229d4ce9634602",
  "activityId": "59c1219936229d4ce9634603",
  "activityUrl": "https://example.org/assessment-123",
}
```
