---
---

# Dashboards HTTP Interface

Details of dashboards.

It is accessable through the [connection API](/http-connection) and [restify api](/http-models). Accepted properties:

Name | Decription
--- | ---
_id | The id of this dashboard.
createdAt | When this dashboard was created.
updatedAt | When this dashboard was last updated.
title | String. Title of the dashboard.
widgets | An array of the widgets on this dashboard. See [widgets](#widgets).
organisation | Id of the organisation this dashboard belongs to.
owner | Id of the user who created this dashboard
visibility | NOWHERE, ANYWHERE, VALID_DOMAINS. The scope of where this dashboard is externaly visable.
validDomains | If visability is VALID_DOMAINS, A string of domains which can view this dashboard.
isPublic | If false then this dashboard is only available to the owner, otherwise its available to everyone in the organisation with permission. This is unrelated to visibility.

# Widgets

An array of widgets. The properties for each widget are:

Name | Decription
--- | ---
title | The name of the widget.
visualisation | The id of the visualisation that this widget is displaying.
x | The x position of this widget.
y | The y position of thi widget.
h | The hight of this widget.
w | The width of this widget.


