---
---

# Dashboards HTTP Interface

Details of dashboards.

It is accessible through the [connection API](/http-connection) and [restify api](/http-models).

### Schema

Name | Description
--- | ---
_id | The id of this dashboard.
createdAt | When this dashboard was created.
updatedAt | When this dashboard was last updated.
title | String. Title of the dashboard.
widgets | An array of the widgets on this dashboard. See [widgets](#widgets).
organisation | Id of the [organisation](/http-organisations#schema) this dashboard belongs to.
owner | Id of the [user](/http-users#schema) who created this dashboard
visibility | NOWHERE, ANYWHERE, VALID_DOMAINS. The scope of where this dashboard is externally visible.
validDomains | If visibility is VALID_DOMAINS, A string of domains which can view this dashboard.
isPublic | If false then this dashboard is only available to the owner and users with [org/all/dashboard/view scope](/http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission. This is unrelated to visibility.

### Widgets

An array of widgets. The properties for each widget are:

Name | Description
--- | ---
title | The name of the widget.
visualisation | The id of the [visualisation](/http-visualisations#schema) that this widget is displaying.
x | The x position of this widget.
y | The y position of this widget.
h | The height of this widget.
w | The width of this widget.


