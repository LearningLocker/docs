xAPI Statements
===============

- [Basic Auth](#basicauth)
- [Structure](#structure)
- [Indexes](#indexes)
- [Quirks](#quirks)

<a name="basicauth"></a>
## Basic Auth

The primary way to submit and retrieve statements from a Learning Locker LRS is via http Basic Authentication. Upon creation each LRS generates a unique key / secret which pair as the username / password. You can reset these values at any time in the LRS setting page. 

> It is important to make sure you employ SSL on production sites using basic auth and never share your key / secret

<a name="structure"></a>
## Structure

Learning Locker stores xAPI statements as MongoDB documents. The actual collection is named statements. To access the statement collection use the following command in your Mongo client terminal.

    db.statements.find().pretty()

Each statement document contains the following top level keys: _id, lrs, statement.

**_id**

This is the unique MongoDB _id that is automattically asigned to each incoming statement.

**lrs**

Holds details of the LRS the statement in question belongs to. There are two keys here: _id and name. In this case _id refers to the LRS document _id.

**statement**

This contains the actual statement as submitted to the LRS.

**timestamp**

This is the statement timestamp converted into MongoDate for use in Mongo's aggregation function.

### Example

    {
      "_id": ObjectId("8u87y98r9e809i0ir"),
      "lrs": {
        "_id": "8u7y6t5r4e67",
        "name": "A sample LRS"
      },
      "statement": {
        "actor": {
          "mbox": "someone@somewhere.com",
          "name": "Billy Smith"
        },
        "verb": {
          "id": "http://adlnet.gov/expapi/verbs/answered",
          "display": {
            "en-US" : "answered"
          }
        },
        "object":{
          "id":"http://example.adlnet.gov/xapi/example/simpleCBT",
          "definition":{
              "name":{
                  "en-US":"simple CBT course"
              },
              "description":{
                  "en-US":"A fictitious example CBT course."
              }
          }
        },
        "id": "9a38f6f0-f74c-40c9-a6a7-243eba85eff2",
        "stored": "2014-05-21T11:51:19.742400+00:00"
      },
      "timestamp": ISODate()
    }

<a name="indexes"></a>
## Indexes

With MongoDB you can, and should, set indexes in collections you will be querying a lot, in this case, the statements collection. You can read more about MongoDB indexes at the following links:

*  [Indexes](http://docs.mongodb.org/manual/indexes/)
*  [Indexing tutorials](http://docs.mongodb.org/manual/administration/indexes/)

For v1.0 of Learning Locker we have set the following indexes on a statements document:

*  lrs._id
*  lrs._id & statement.object.id
*  lrs._id & statement.verb.id
*  lrs._id & statement.actor.mbox

> It should be noted that this is only a first pass at indexing statements. This needs full testing and revision to make sure we can optimise querying. So, if you have any suggestions then [please get involved](http://docs.learninglocker.net/contribute) and help out. Thanks.

<a name="quirks"></a>
## Quirks

#### Full stops in keys

MongoDB doesn't allow full stops (.) in keys. Therefore, we replace all full stops with &46; when saving statements. This does mean, to display the full statement on the site and before sending via the API we need to replace &46; throughout with the full stop using a simple function:

    //scan array and replace &46; with . (This is a result of . being reserved in Mongo)
    //convert array to json as this is faster for multi-dimensional arrays (?) @todo check this out.
    function replaceHtmlEntity( $array ){`
        return json_decode(str_replace('&46;','.', json_encode($array)));
    }
