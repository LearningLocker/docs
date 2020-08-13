---
---

# Statement Forwarding HTTP Interface

Details of a statement forwarding configuration.

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/statementforwarding.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/statementforwarding.

### Schema

Name | Description
--- | ---
_id | The unique id of the document.
createdAt | When the document was created.
updatedAt | When the document was updated.
description | The name of this statement forwarder.
lrs_id | The id of the [store](../http-stores#schema) that Learning Locker will forward statements for.
active | If this statement forwarder is currently active.
configuration | The configuration for this statement forwarder [See configuration](#configuration).
owner | Id of the [user](../http-users#schema) who created this statement forwarder.
query | A JSON Mongo query string - only statements which match this query will be forwarded. <br><br>e.g. `'{"statement.verb.id":"http://adlnet.gov/expapi/verbs/completed"}'`
isPublic | If false then this statement forwarder is only available to the owner and users with [org/all/statementForwarding/view scope](../http-roles/#organisation-scopes), otherwise it's available to everyone in the organisation with permission.

### Configuration

The configuration for the statement forwarding request.

Name | Description
--- | ---
protocol | http, https. The protocol to forward statements to.
url | The url to forward statement to.
authType | no auth, token, basic auth. The auth method to use.
secret | If authType is token, this is the token which will be sent with the request.
basicUsername | If authType is basic auth, this is the basic auth username.
basicPassword | If authType is basic auth, this is the basic auth password.
maxRetries | The number of times the statement forwarder will retry before giving up.
headers | A json array encoded as a string which contains additional headers to send with the request.

### Example Model

```json
{
  "_id" : "59c8d14b0d82b3864a450604",
  "createdAt" : "2017-09-25T09:50:03.880Z",
  "updatedAt" : "2017-11-06T14:07:27.212Z",
  "owner" : "59198183d8ea540933227030",
  "query" : "{}",
  "organisation" : "59c209c4ad95fd50960c0362",
  "isPublic" : false,
  "configuration" : {
      "authType" : "no auth",
      "protocol" : "https",
      "url" : "example.org/endpoint",
      "maxRetries" : 10,
      "headers" : "{\"Test-Header-Key\":\"Test-Header-Value\"}",
      "secret" : "Dave"
  },
  "__v" : 0,
  "active" : true,
  "description" : "Statement forwarder"
}
```

### *[Enterprise]*: Forwarding to AWS Kinesis
_Note: Only available in Enterprise editions of Learning Locker_

To create a statement forward configured for AWS Kinesis Firehose, configure the record with this modified data structure:

```js
  "configuration" : {
    "protocol" : "Kinesis",
    "authType" : "no auth"
  },
  "kinesisOptions" : {
    "streamName" : "KinesisFireHoseName", // The immutable name of the Kinesis Firehose configured in AWS
    "awsClientKey" : "xxxxxxxxxxxx", // AWS client access key with appropriate permission
    "awsClientSecret" : "xxxxxxxxxxxx", // AWS client secret key
    "awsRegion" : "us-east-1" // AWS Kinesis Firehose region
  },
```

#### Permissions
In order for Learning Locker to succesfully write to the Kinesis Firehose, please ensure that the IAM user (attributed to the key/secret) has the minimum permissions in its policy:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "firehose:PutRecord",
            ],
            "Resource": [
                "arn:aws:firehose:region:account-id:deliverystream/KinesisFireHoseName"
            ]
        }
    ]
}
```
