# Statement Deletion HTTP Interfaces

By default, Learning Locker gives you the ability to delete statements via the API (this can be disabled via the `ENABLE_STATEMENT_DELETION` flag). Statements may be deleted individually, using the record's `_id` or via a batch delete method.

## Authorization

When using this interface, you must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**. The deletion APIs require that the "Delete statements" (`'statements/delete'`) scope is enabled on the client. If a client also has a store (`lrs_id`) attached, this will be used to further filter down deletions only to this store.


## Single Statement Deletion

This leverages the existing REST API for statements.

```
DELETE http://www.example.org/api/v2/statement/111aaa1111a111111aa11112
Authorization: Basic YOUR_BASIC_AUTH
```

A request like the one above, will respond with a 204 response like the one below.

```
HTTP/1.1 204 NO CONTENT
```

## Batch Statement Deletion

This endpoint allows you to send in a deletion job to be processed. As the filter may apply to a large amount of data, the batch delete job is split out into deleting up to 1000 records at a time, with each successive deletion triggering another deletion, until no more data matches that filter.

### Initialising a batch deletion

Sending a POST with a JSON body holding the required deletion filter to the following endpoint will remove all data matching that filter from the respective organisation (or store) that the client is attached to.

_e.g. Deletes all completions in an organiation/store_

```
POST http://www.example.org/api/v2/batchdelete/initialise
Authorization: Basic YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  "filter": {
    "statement.verb.id": "http://adlnet.gov/expapi/verbs/completed"
  }
}
```

### Viewing batch deletions
Use the REST endpoint to GET all batch deletions

```
GET http://www.example.org/api/v2/batchdelete
Authorization: Basic YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8
```

### Terminating batch deletions
Stop a batch deletion from executing any more deletions.

_Note that is a deletion has started already, it may delete up to 1000 records before the termination command is respected. This is due to how we batch the deletions into blocks of 1000._

```
GET http://www.example.org/api/v2/batchdelete/terminate/111aaa1111a111111aa11112
Authorization: Basic YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8
```

### Deletion time window
Because deletion can be a intensive job for the database, it is possible to configure Learning Locker to only trigger and process batch deletion during a specified window everyday. This can be configured to enable deletions during periods of known low activity (e.g. night time).

To configure this, update the document in the `siteSettings` collection with the required UTC hour, minute and duration:

```mongo
db.siteSettings.updateOne(
  {
    "_id" : ObjectId("111111111111111111111111")
  },
  {
    $set: {
      batchDeleteWindowStartUTCHour: 00,
      batchDeleteWindowUTCMinutes: 00,
      batchDeleteWindowDurationSeconds: 18000
    }
  }
)
```

The configuration above would allow deletions to be triggered from midnight to 5am (UTC) everyday.