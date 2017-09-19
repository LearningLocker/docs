---
---

# Visualisations HTTP Interface

Visualisation configuration.

Can be accessed through the [Connection HTTP Interface](../http-connection) and [Models HTTP Interface](../http-models).

### Schema

Name | Description
--- | ---
_id | The id of this visualisation.
description | The name of this visualisation.
createdAt | When this visualisation was created.
updatedAt | When this visualisation was last updated.
type | The type of this visualisation.
axesgroup | What to group the visualisation data points as.
axesxLabel | The x axes label.
axesyLabel | The y axes label.
axesxValue | A stringified json encode object of the x axes value options.
axesyValue | A stringified json encode object of the y axes value options.
axesvalue | A stringified json encode object of the value for this visualisation.
axesyOperator | The y axes operator, eg uniqueCount.
axesxOperator | The x axes operator, eg uniqueCount.
axesOperator | The visualisation operator, eg uniqueCount.
axesquery | Query for this visualisation.
axesxQuery | Query for the x axes.
axesyQuery | Query for the y axes.
stacked | If this visualisation is stacked.
chart | The type of visualisation.
filter | An array of stringified [mongo filters](https://docs.mongodb.com/manual/reference/operator/aggregation/filter/).
journey | The [journey's](../http-journeys#schema) id if this visualisation is a journey.
organisation | The [organisation](../http-organisations#schema) this visualisation belongs to.
owner | The id of the [user](../http-users#schema) who created this visualisation.
previewPeriod | The time range which is shown in this visualisation.
isPublic | If false then this visualisation is only available to the owner and users with [org/all/visualisation/view scope](../http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission.





