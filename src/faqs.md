---
---

# Frequently Asked Questions

#### Why can't I use custom extensions in queries
When Leanring Locker stores extensions, the dots in the keys are replaced with `&46;` because Mongo does not allow dots in keys. You can find more information in the [Connection HTTP Interface documentation](../http-connection#filtering-with-extension-keys) and the [Aggregation HTTP Interface documentation](../http-aggregation#projecting-with-extension-keys).

#### Why are my queries running slowly
It's likely that you are querying without utilising [Mongo indexes](https://docs.mongodb.com/manual/indexes/). You can improve the performance of your queries by utilising Mongo indexes. More information is available in the [Connection HTTP Interface documentation](../http-connection#filtering-with-improved-performance) and the [Aggregation HTTP Interface documentation](../http-aggregation#matching-with-improved-performance).
