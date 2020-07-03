---
redirect_from: 
  - "/postman/"
---

# Connection HTTP Interface

The Learning Locker Connection API is a HTTP interface that [utilises cursors to provide paginated models](#pagination-example). The API is inspired by [GraphQL's connections](https://facebook.github.io/relay/graphql/connections.htm). The API is available for all models in Learning Locker, for example, to receive paginated statements via this API, you'd use the following URL.

```
http://www.example.org/api/connection/statement
```

You must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under **Settings** > **Clients**. The API also accepts the following *optional* URL parameters for filtering the models returned.

- [sort](#sort-parameter) (required -  we recommend sorting by `_id` if nothing else)
- [search](#search-parameter) (available only for User connection and for GET requests of User REST API)
- [filter](#filter-parameter) (not available for User connection)
- [project](#project-parameter)
- [hint](#hint-parameter)
- [first](#first-parameter)
- [after](#after-parameter)

## URL Parameters
All of the URL parameters should be URL encoded (after JSON encoding if JSON encoding is required). For example, if you were using the [example sort parameter](#sort-parameter), your request would look something like the request below.

```http
GET http://www.example.org/api/connection/statement?sort=%7b%22timestamp%22%3a-1%2c%22statement.id%22%3a1%7d
Authorization: Basic YOUR_BASIC_AUTH
```

### Sort Parameter
The sort parameter is a JSON encoded object. The keys of the object represent the names of the properties you wish to sort. The values of the object represent the order in which you want to sort the properties. To sort in ascending order, use the number 1; to sort in descending order, use the number -1.

For example, to sort statements in descending order of their timestamp and ascending order of their Mongo ObjectId, you can use the following sort parameter.

```json
{
  "timestamp": -1,
  "_id": 1
}
```

In the above example, we've included the `_id` because it should be unique and the sort parameter should always contain a unique property in order for pagination to work correctly with cursors. The order of the keys in the object determines which property is sorted first, so always include a unique property at the end such as the `_id` property.

#### Sorting With Extension Keys
Note that when using extension keys, you need to replace any dots with `&46;` because Mongo does not allow dots in keys. For example, when you have an extension key like `http://www.example.com/extension` you can sort by it using `http://www&46;example&46;com/extension` instead, so a sort parameter using this extension key might look something like the sort parameter below.

```json
{
  "statement.context.extensions.http://www&46;example&46;com/extension": 1
}
```

#### Sorting With Improved Performance
You may find that changing the sort parameter can vary the time it takes a query to run, especially when you have a large number of models. You can take advantage of database indexes to improve performance, more information is available about [using indexes via Mongo's documentation](https://docs.mongodb.com/manual/indexes/). If utilising indexes doesn't have the required performance improvement, you can instead utilise [BI tools](../guides-retrieving).

### Search Parameter
The search parameter is a simple string and **available only for User connection**. This parameter is gonna search for the match over `name` and `email` fields of User schema. So if the value for this parameter is `exampleSearchString`, as shown in the request below, it will be transformed into filter as shown below.

```http
GET http://www.example.org/api/connection/user?search=exampleSearchString
Authorization: Basic YOUR_BASIC_AUTH
```

```json
{
  "$or": [
    { "name": { "$regex": "exampleSearchString", "$options": "i" } },
    { "email": { "$regex": "exampleSearchString", "$options": "i" } }
  ]
}
```

### Filter Parameter
The filter parameter is a JSON encoded object. The keys of the object represent the names of the properties or operators. The values of the object represent the value you wish to filter by.

For example, to filter statements by actor or verb, you can use the following filter parameter.

```json
{
  "$or": [{
    "statement.actor.account.name": "123",
    "statement.actor.account.homePage": "http://www.example.org/user"
  }, {
    "statement.verb.id": "http://www.example.org/verb"
  }]
}
```

In the example above, [`$or`](https://docs.mongodb.com/manual/reference/operator/query/or/#op._S_or) is a operator, all operators start with a dollar (`$`). You can find a [list of the available operators in the Mongo documentation](https://docs.mongodb.com/manual/reference/operator/query/). The most common operators are the comparison operators ([`$eq`](https://docs.mongodb.com/manual/reference/operator/query/eq/#op._S_eq), [`$gt`](https://docs.mongodb.com/manual/reference/operator/query/gt/#op._S_gt), [`$gte`](https://docs.mongodb.com/manual/reference/operator/query/gte/#op._S_gte), [`$in`](https://docs.mongodb.com/manual/reference/operator/query/in/#op._S_in), [`$lt`](https://docs.mongodb.com/manual/reference/operator/query/lt/#op._S_lt), [`$lte`](https://docs.mongodb.com/manual/reference/operator/query/lte/#op._S_lte), [`$ne`](https://docs.mongodb.com/manual/reference/operator/query/ne/#op._S_ne), and [`$nin`](https://docs.mongodb.com/manual/reference/operator/query/nin/#op._S_nin)) and the logical operators ([`$and`](https://docs.mongodb.com/manual/reference/operator/query/and/#op._S_and), [`$not`](https://docs.mongodb.com/manual/reference/operator/query/not/#op._S_not), [`$nor`](https://docs.mongodb.com/manual/reference/operator/query/nor/#op._S_nor), and [`$or`](https://docs.mongodb.com/manual/reference/operator/query/or/#op._S_or)).

#### Filtering With Extension Keys
Note that when using extension keys, you need to replace any dots with `&46;` because Mongo does not allow dots in keys. For example, when you have an extension key like `http://www.example.com/extension` you can filter it using `http://www&46;example&46;com/extension` instead, so a filter parameter using this extension key might look something like the filter parameter below.

```json
{
  "statement.context.extensions.http://www&46;example&46;com/extension": {
    "$ne": "example_value"
  }
}
```

#### Filtering With Improved Performance
You may find that changing the filter parameter can vary the time it takes a query to run, especially when you have a large number of models. You can take advantage of database indexes to improve performance, more information is available about [using indexes via Mongo's documentation](https://docs.mongodb.com/manual/indexes/). If utilising indexes doesn't have the required performance improvement, you can instead utilise [BI tools](../guides-retrieving).

### Project Parameter
The project parameter is a JSON encoded object. The keys of the object usually represent the names you want to give to the projected properties. The values of the object usually determine whether the property is included/excluded or the name of the property to project from the model.

For example, to project the actor's account name as a user's identifier, the verb without a display, and the object's identifier you can use the following project parameter.

```json
{
  "userId": "$statement.actor.account.name",
  "statement.verb": {
    "display": 0
  },
  "statement.object.id": 1
}
```

In the example above, the value `0` is used to exclude the verb's display property. Similarly, the value `1` is used to include the object's identifier. You can find out more about [projections via the Mongo documentation](https://docs.mongodb.com/manual/reference/operator/aggregation/project/).

#### Projecting With Extension Keys
Note that when using extension keys, you need to replace any dots with `&46;` because Mongo does not allow dots in keys. For example, when you have an extension key like `http://www.example.com/extension` you can project it using `http://www&46;example&46;com/extension` instead, so a project parameter using this extension key might look something like the project parameter below.

```json
{
  "statement.context.extensions.http://www&46;example&46;com/extension": 1
}
```

### Hint Parameter
The hint parameter is a JSON encoded object that represents a Mongo index and is similar to the [sort parameter](#sort-parameter). A hint overrides Mongo's default index selection and query optimisation process.

For example, to use an index you've created in Mongo for verb identifiers in ascending order, you can use the following hint parameter.

```json
{
  "statement.verb.id": 1
}
```

For more information about hints, you can checkout [Mongo's hint documentation](https://docs.mongodb.com/manual/reference/method/cursor.hint/index.html).

### First Parameter
The first parameter is a number that represents the number of models to be returned after the [after cursor parameter](#after-parameter) or from the very first model in Mongo.

### After Parameter
The after parameter is a string that represents a cursor used for getting models after a specified point in the Mongo collection.

## Pagination Example
To demonstrate pagination with this API, you can insert two statements using a request like the one below.

```http
POST http://www.example.org/data/xAPI/statements
Authorization: Basic YOUR_BASIC_AUTH
X-Experience-API-Version: 1.0.3
Content-Type: application/json

[{
  "actor": { "mbox": "mailto:test1@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": { "id": "http://www.example.org/activity" },
}, {
  "actor": { "mbox": "mailto:test2@example.org" },
  "verb": { "id": "http://www.example.org/verb" },
  "object": { "id": "http://www.example.org/activity" },
}]
```

The request above should return you a statement identifier for each of the statements in an array.

### Retrieving Page One
Once you've inserted two statements, you can make a request for the first statement, using a request like the one below.

```http
GET http://www.example.org/api/connection/statement?first=1
Authorization: Basic YOUR_BASIC_AUTH
```

The request above should return you a connection, consisting of edges (which contain the models) and page info (which contains the cursors). For example, the above request would return something like the response below.

```json
{
  "edges": {
    "cursor": "Zmlyc3RTdGF0ZW1lbnQ=",
    "node": {
      "_id": "59ad59a40334c1bd23322c3a",
      "statement": {
        "id": "0f748889-8d6c-4423-9919-189a14484d2f",
        "actor": { "objectType": "Agent", "mbox": "mailto:test1@example.org" },
        "verb": { "id": "http://www.example.org/verb" },
        "object": { "objectType": "Activity", "id": "http://www.example.org/activity" },
        "version": "1.0.3",
        "authority": {
          "objectType": "Agent",
          "mbox": "mailto:authority@example.org"
        }
      }
    }
  },
  "pageInfo": {
    "endCursor": "Zmlyc3RTdGF0ZW1lbnQ=",
    "hasNextPage": true,
    "hasPreviousPage": true,
    "startCursor": "Zmlyc3RTdGF0ZW1lbnQ="
  }
}
```

### Retrieving Subsequent Pages
Once you've received a page, you can use the cursors in the `pageInfo` from the previous response to retrieve the next page. For example, we can use a request like the one below to retrieve the second of the inserted statements from earlier in this example.

```http
GET http://www.example.org/api/connection/statement?first=1&after=Zmlyc3RTdGF0ZW1lbnQ=
Authorization: Basic YOUR_BASIC_AUTH
```

The request above should return you another connection, again this will consist of edges (which contain the models) and page info (which contains the cursors). For example, the request for page two would return something like the response below.

```json
{
  "edges": {
    "cursor": "c2Vjb25kU3RhdGVtZW50",
    "node": {
      "_id": "59ad5b9480fe0205abbd0aec",
      "statement": {
        "id": "3c44a187-ad17-41c1-bc73-fed40fdbb200",
        "actor": { "objectType": "Agent", "mbox": "mailto:test2@example.org" },
        "verb": { "id": "http://www.example.org/verb" },
        "object": { "objectType": "Activity", "id": "http://www.example.org/activity" },
        "version": "1.0.3",
        "authority": {
          "objectType": "Agent",
          "mbox": "mailto:authority@example.org"
        }
      }
    }
  },
  "pageInfo": {
    "endCursor": "c2Vjb25kU3RhdGVtZW50",
    "hasNextPage": true,
    "hasPreviousPage": true,
    "startCursor": "c2Vjb25kU3RhdGVtZW50"
  }
}
```
