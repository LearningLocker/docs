---
---

# Connection API

The Learning Locker Connection API is a HTTP interface that utilses Mongo cursors to provide paginated models.

The API is available for all models in Learning Locker and for example, to receive paginated statements via this API, you'd use the URL:

```
http://www.example.com/api/connection/statements
```

You must additionally supply your Basic Auth details with each request in the `Authorization` header. Your Basic Auth details can be found under Settings > Clients.

The API also accepts the following URL parameters for filtering the models returned.

- [sort](#sort-parameter)
- [filter](#filter-parameter)
- [project](#project-parameter)
- [hint](#hint-parameter)
- [first](#first-parameter)
- [last](#last-parameter)
- [before](#before-parameter)
- [after](#after-parameter)

#### Sort Parameter
The sort parameter is a JSON encoded object. The keys of the object represent the names of the properties you wish to sort. The values of the object represent the order in which you want to sort the properties. To sort in ascending order, use the number 1; to sort in descending order, use the number -1.

For example, to sort statements in descending order of their timestamp and ascending order of their id, you can use the following sort parameter.

```json
{
  "timestamp": -1,
  "statement.id": 1
}
```

#### Filter Parameter
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

In the example above, [`$or`](https://docs.mongodb.com/manual/reference/operator/query/or/#op._S_or) is a operator, all operators start with a dollar (`$`). You can find a [list of the available operators in the Mongo documentation](https://docs.mongodb.com/manual/reference/operator/query/). The most common operators are the comparision operators ([`$eq`](https://docs.mongodb.com/manual/reference/operator/query/eq/#op._S_eq), [`$gt`](https://docs.mongodb.com/manual/reference/operator/query/gt/#op._S_gt), [`$gte`](https://docs.mongodb.com/manual/reference/operator/query/gte/#op._S_gte), [`$in`](https://docs.mongodb.com/manual/reference/operator/query/in/#op._S_in), [`$lt`](https://docs.mongodb.com/manual/reference/operator/query/lt/#op._S_lt), [`$lte`](https://docs.mongodb.com/manual/reference/operator/query/lte/#op._S_lte), [`$ne`](https://docs.mongodb.com/manual/reference/operator/query/ne/#op._S_ne), and [`$nin`](https://docs.mongodb.com/manual/reference/operator/query/nin/#op._S_nin)) and the logical operators ([`$and`](https://docs.mongodb.com/manual/reference/operator/query/and/#op._S_and), [`$not`](https://docs.mongodb.com/manual/reference/operator/query/not/#op._S_not), [`$nor`](https://docs.mongodb.com/manual/reference/operator/query/nor/#op._S_nor), and [`$or`](https://docs.mongodb.com/manual/reference/operator/query/or/#op._S_or)).

#### Project Parameter
The project parameter is a JSON encoded object. The keys of the object usually represent the names you want to give to the projected properties. The values of the object usually determine whether the property is included/excluded or the name of the property to project from the model.

For example, to project the actor's account name as a user's identifier, the verb without a display, and the object's identifier you can use the following project parameter.

```json
{
  "userId": "$statement.actor.account.name",
  "verb": {
    "display": 0
  },
  "statement.object.id": 1
}
```

In the example above, the value `0` is used to exclude the verb's display property. Similarly, the value `1` is used to include the object's identifier. You can find out more about [projections via the Mongo documentation](https://docs.mongodb.com/manual/reference/operator/aggregation/project/).

#### Hint Parameter
The hint parameter is a JSON encoded object that represents a Mongo index and is similar to the [sort parameter](#sort-parameter). A hint overrides Mongo's default index selection and query optimisation process.

For example, to use an index you've created in Mongo for verb identifiers in ascending order, you can use the following hint parameter.

```json
{
  "statement.verb.id": 1
}
```

For more information about hints, you can checkout [Mongo's hint documentation](https://docs.mongodb.com/manual/reference/method/cursor.hint/index.html).

#### First Parameter
The first parameter is a number that represents the number of models to be returned after the [after cursor parameter](#after-parameter) or from the very first model in Mongo.

#### Last Parameter
The last parameter is a number that represents the number of models to be returned before the [before cursor parameter](#before-parameter) or from the very last model in Mongo.

#### Before Parameter
The before parameter is a string that represents a cursor used for getting models before a specified point in the Mongo collection.

#### After Parameter
The after parameter is a string that represents a cursor used for getting models after a specified point in the Mongo collection.
