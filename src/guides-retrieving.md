---
---

# Retrieving Statements Guide
Learning Locker provides many options for retrieve statements (listed below) to satisfy various needs from just viewing a quick list of statements to direct database access for business intelligence (BI) tools.

Option | Description
--- | ---
[Source page](https://ht2ltd.zendesk.com/hc/en-us/sections/115000232469-Filtering-Exploring-Statements) | The source page quickly provides a list of the most recent statements sent to an organisation in Learning Locker. It also allows you to filter statements using the Query Builder.
[Visualisations](https://ht2ltd.zendesk.com/hc/en-us/sections/115000222689-Visualisations) | Visualisations provide a quick visual summary of statements via bar graphs, line graphs, scatter graphs, etc. These are great for quickly exploring potential correlations and trends.
[Exports](https://ht2ltd.zendesk.com/hc/en-us/sections/115000232489-Exporting-Statements) | If you want data from your statements in a spreadsheet, you can use export parts of your statements to a CSV file using the Export Panel.
[xAPI](../http-xapi) | The xAPI HTTP interface provides an xAPI conformant API for retrieving statements in your applications.
[Aggregation API](../http-aggregation) | The Aggregation HTTP Interface is more advanced than the xAPI HTTP interface and allows you to access Mongo's powerful Aggregation API for more custom filtering of statements.
[Connection API](../http-connection) | The Connection HTTP Interface is a slightly more restricted version of the Aggregation API that utilises cursors to provide paginated statements for improved performance.
Direct DB access | If you want to utilise BI Tools or improve performance further, you can simply access Learning Locker's Mongo database directly.
