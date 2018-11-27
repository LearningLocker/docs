---
---

# Frequently Asked Questions

#### Why can't I use custom extensions in queries?
When Learning Locker stores extensions, the dots in the keys are replaced with `&46;` because Mongo does not allow dots in keys. You can find more information in the [Connection HTTP Interface documentation](../http-connection#filtering-with-extension-keys) and the [Aggregation HTTP Interface documentation](../http-aggregation#projecting-with-extension-keys).

#### Why are my queries running slowly?
It's likely that you are querying without utilising [Mongo indexes](https://docs.mongodb.com/manual/indexes/). You can improve the performance of your queries by utilising Mongo indexes. More information is available in the [Connection HTTP Interface documentation](../http-connection#filtering-with-improved-performance) and the [Aggregation HTTP Interface documentation](../http-aggregation#matching-with-improved-performance).

#### Why am I getting an unauthorised error using the xAPI?
It's likely that you've either misconfigured your "Client" in Learning Locker or you're using an incorrect "Authorization" header. To correctly configure your Client and use the correct Authorization header, we recommend that you firstly follow [our documentation for creating a "Store" in Learning Locker](https://ht2ltd.zendesk.com/hc/en-us/articles/115000893009-Managing-your-Learning-Record-Stores#creating-a-new-store). Creating a Store will automatically create a new Client that is enabled with the correct scopes and associated to the Store you created. Therefore, once you've created a Store, go to `Settings > Clients` and find the new Client. The new Client will have a "Basic auth" token which you can use as the value for your "Authorization" header in any HTTP requests to the xAPI (be sure to prepend "Basic " to the start of the token).
