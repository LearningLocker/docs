---
---

# Dashboards HTTP Interface

Details of dashboards.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/dashboard.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/dashboard.

### Schema

Name | Description
--- | ---
_id | The id of this dashboard.
createdAt | When this dashboard was created.
updatedAt | When this dashboard was last updated.
title | String. Title of the dashboard.
widgets | An array of the widgets on this dashboard. See [widgets](#widgets).
organisation | Id of the [organisation](../http-organisations#schema) this dashboard belongs to.
owner | Id of the [user](../http-users#schema) who created this dashboard
visibility | NOWHERE, ANYWHERE, VALID_DOMAINS. The scope of where this dashboard is externally visible.
validDomains | If visibility is VALID_DOMAINS, a string of domains which can view this dashboard.
isPublic | If false then this dashboard is only available to the owner and users with [org/all/dashboard/view scope](../http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission. This is unrelated to visibility.

### Widgets

An array of widgets. The properties for each widget are:

Name | Description
--- | ---
title | The name of the widget.
visualisation | The id of the [visualisation](../http-visualisations#schema) that this widget is displaying.
x | The x position of this widget.
y | The y position of this widget.
h | The height of this widget.
w | The width of this widget.

### Example Model

```json
{
	"_id" : "59c2371c16bc715f83c3450c",
	"createdAt" : "2017-04-28T09:03:57.332Z",
	"updatedAt" : "2017-05-18T12:55:24.430Z",
	"owner" : "59c2371c16bc715f83c34509",
	"title" : "Example Dashboard",
	"organisation" : "59c2371c16bc715f83c34507",
	"visibility" : "NOWHERE",
	"widgets" : [
		{
			"title" : "Example Widget",
			"_id" : "59c2371c16bc715f83c3450a",
			"h" : 4,
			"w" : 4,
			"y" : 0,
			"x" : 0,
			"visualisation" : "59c2371c16bc715f83c3450b"
		}
	],
	"filter" : "{}",
	"public" : false,
	"isPublic" : true
}
```
