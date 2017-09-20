---
---

# Configuring Learning Locker

Both the UI/API/Worker and xAPI Service require a `.env` file which will contain all the configuration variables required the application to run.

Where applicable, both of these files will need to have the same values (e.g. in order to connect to the same database).

Both repositories contain .env.example templates which can be copied as new `.env` files. If the application has been installed using the install script then this step will be performed for you.

## Learning Locker Application

**Variables in bold are required or strongly recommended**

_Variables in italics are required for debugging or development only_


Name | Description | Example | Default
--- | --- | --- | ---
**NODE_ENV** | Under what mode is Node running. This should be left as `production` in most circumstances | `production` | -
**SITE_URL** | The host this application is running under, including protocol | `https://mylrs.com` | `127.0.0.1`
**UI_PORT** | The port that the UI is attached to | `3000` | -
**API_PORT** | The port that the API is attached to | `8080` | -
_TEST_API_PORT_ | A port to expose the application on when running tests | `808080` | -
**APP_SECRET** | Unique string used for hashing. Recommended length of 256 bits | `pleasechangetounique256bitstring` | -
**MONGODB_PATH** | The [full Mongo connection string](https://docs.mongodb.com/manual/reference/connection-string/). This can include multiple hosts for replicas, and extra configuration values passed through query strings. | `mongodb://localhost:27017/learninglocker_v2`
MONGODB_TEST_PATH | A different Mongo URL to use when running tests | `mongodb://localhost:27017/llv2_tests` | -
MONGO_SOCKET_TIMEOUT_MS | How long does the socket stay open when there is no activity | `300000` | `300000`
MONGO_CONNECTION_POOLSIZE | https://blog.mlab.com/2013/11/deep-dive-into-connection-pooling/ | `20` | `20`
**REDIS_HOST** | The host of the Redis instance | `127.0.0.1` | `127.0.0.1`
**REDIS_PORT** | The port of the Redis instance | `example` | `6379`
REDIS_DB | The database number of the Redis instance | `0` | -
REDIS_PREFIX | A prefix to append to all keys within the Redis database | `learninglocker` | -
ALLOW_AGGREGATION_DISK_USE | Can Mongo use its disks for aggregating | `true` | `true`
AGGREGATION_CACHE_SECONDS | How many seconds are aggregation results cached  | `300` | `300`
AGGREGATION_REFRESH_AT_SECONDS | Refresh aggregations when this close to expiry | `120` | `120`
MAX_TIME_MS | [Max time aggregations can run for in milliseconds](https://docs.mongodb.com/manual/reference/operator/meta/maxTimeMS/) | `300` | `0` (no limit)
MAX_SCAN | Maximum number of documents an aggregation can scan][(https://docs.mongodb.com/manual/reference/operator/meta/maxScan/) | `10000` | `0` (no limit)
**LOG_MIN_LEVEL** | Minimum logging level (error|warning|info|debug|silly) | `debug` | `info`
LOG_DIR | Relative dir to store API access logs | `logs` | `logs`
_TEST_LOG_MIN_LEVEL_ | Logging level for tests | `silly` | -
COLOR_LOGS | Should logs be output using ANSI color | `true` | -
**WINSTON_CLOUDWATCH_ENABLED** | Should logs be sent to AWS Cloudwatch?<br><br>[AWS credentials must be configured for Cloudwatch access](http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-identity-based-access-control-cwl.html) | `true` | `false`
WINSTON_CLOUDWATCH_LOG_GROUP_NAME | The Cloudwatch Logs group name | `llv2` | `llv2`
WINSTON_CLOUDWATCH_LOG_STREAM_NAME | The Cloudwatch Logs stream name | `application` | The server's hostname
WINSTON_CLOUDWATCH_ACCESS_KEY_ID | AWS Access Key with suitable priviliges | `12345678901` | -
WINSTON_CLOUDWATCH_SECRET_ACCESS_KEY | AWS Secret Access Key | `12345678901` | -
WINSTON_CLOUDWATCH_REGION** | The region the logs will be sent to | `us-west-1` | -
**SMTP_HOST** | The SMTP mailbox host | `smtp.mailserver.com` | -
**SMTP_PORT** | The SMTP port | `1234` | -
**SMTP_SECURED** | Use SSL for SMTP? | `true` | -
**SMTP_USER** | The SMTP username | `username` | -
**SMTP_PASS** | The SMTP password | `password` | -
**QUEUE_PROVIDER** | Which queue provider should be used?<br><br>Options are `REDIS` or `SQS`<br><br>When using Redis, queues are held in the Redis database<br><br>When using SQS, queues are held and managed by the AWS Simple Queue Service | `SQS` | -
QUEUE_NAMESPACE | A queue prefix for SQS | `example` | -
AWS_SQS_ACCESS_KEY_ID | desc | `example` | -


_Work in progress_