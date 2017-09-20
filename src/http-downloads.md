---
---

# Downloads HTTP Interface

Holds records of exports.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/download.
- [Models HTTP Interface](../http-models) via http://www.example.org/api/download.

### Schema

Name | Description
--- | ---
_id | The id of this download
name | Name of the download.
organisation | The id of the [organisation](../http-organisations#schema) this download happend from.
owner | The id of the [user](../http-users#schema) who downloaded the export.
isReady | Is the download ready.
time | Date and time of the download.
url | The url of this download.
upload | An object holding details of the file to be downloaded. [See upload](#upload).
isPublic | If false then this download is only available to the owner and users with [org/all/download/view scope](../http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission.

### Upload

Holds details of the file to be uploaded.

Name | Description
--- | ---
createdAt | When the content was created.
updatedAt | When the content was last updated.
key | The location of the content to be downloaded.
repo | The repo to where the content is stored, ie local.
mime | mime type.

### Example Model

```json
{
	"_id" : "59c2371c16bc715f83c3450d",
	"url" : "/api/downloadexport/5915be242c3a240fb40801e4.csv",
	"time" : "2017-05-12T13:52:36.995Z",
	"organisation" : "59c2371c16bc715f83c3450e",
	"name" : "Example Download",
	"upload" : {
		"createdAt" : "2017-05-12T13:52:37.016Z",
		"updatedAt" : "2017-05-12T13:52:37.070Z",
		"mime" : "text/csv",
		"key" : "downloads/1494597156987.csv",
		"repo" : "local"
	},
	"isReady" : true
}
```
