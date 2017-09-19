---
---

# Downloads HTTP Interface

Holds records of exports.

Can be accessed through the [Connection HTTP Interface](../http-connection) and [Models HTTP Interface](../http-models).

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


