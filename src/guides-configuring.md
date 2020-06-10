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
_MONGODB_TEST_PATH_ | A different Mongo URL to use when running tests | `mongodb://localhost:27017/llv2_tests` | -
MONGO_SOCKET_TIMEOUT_MS | How long does the socket stay open when there is no activity | `300000` | `300000`
MONGO_CONNECTION_POOLSIZE | https://blog.mlab.com/2013/11/deep-dive-into-connection-pooling/ | `20` | `20`
**REDIS_HOST** | The host of the Redis instance | `127.0.0.1` | `127.0.0.1`
**REDIS_PORT** | The port of the Redis instance | `example` | `6379`
REDIS_DB | The database number of the Redis instance | `0` | -
REDIS_PREFIX | A prefix to append to all keys within the Redis database | `learninglocker` | -
ALLOW_AGGREGATION_DISK_USE | Can Mongo use its disks for aggregating | `true` | `true`
AGGREGATE_API_ALLOWED_COLLECTIONS | Rule to check whether is collection allowed for Aggregate API or not | `^rollup` | `^rollup`
AGGREGATION_CACHE_SECONDS | How many seconds are aggregation results cached  | `300` | `300`
AGGREGATION_REFRESH_AT_SECONDS | Refresh aggregations when this close to expiry | `120` | `120`
MAX_TIME_MS | [Max time aggregations can run for in milliseconds](https://docs.mongodb.com/manual/reference/operator/meta/maxTimeMS/) | `300` | `0` (no limit)
MAX_SCAN | [Maximum number of documents an aggregation can scan](https://docs.mongodb.com/manual/reference/operator/meta/maxScan/) | `10000` | `0` (no limit)
DISABLE_PERSONA_SCORING | Turn off fuzzy scoring on persona matching. This will make persona workers much faster at scale. | `false` | `false`
**LOG_MIN_LEVEL** | Minimum logging level (error\|warning\|info\|debug\|silly) | `debug` | `info`
LOG_DIR | Relative dir to store API access logs | `logs` | `logs`
_TEST_LOG_MIN_LEVEL_ | Logging level for tests | `silly` | -
COLOR_LOGS | Should logs be output using ANSI color | `true` | -
**WINSTON_CLOUDWATCH_ENABLED** | Should logs be sent to AWS Cloudwatch?<br><br>[AWS credentials must be configured for Cloudwatch access](http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-identity-based-access-control-cwl.html) | `true` | `false`
WINSTON_CLOUDWATCH_LOG_GROUP_NAME | The Cloudwatch Logs group name | `llv2` | `llv2`
WINSTON_CLOUDWATCH_LOG_STREAM_NAME | The Cloudwatch Logs stream name | `application` | The server's hostname
WINSTON_CLOUDWATCH_ACCESS_KEY_ID | AWS Access Key with suitable privileges | `12345678901` | -
WINSTON_CLOUDWATCH_SECRET_ACCESS_KEY | AWS Secret Access Key | `12345678901` | -
WINSTON_CLOUDWATCH_REGION | The region the logs will be sent to | `us-west-1` | -
**SMTP_HOST** | The SMTP mailbox host | `smtp.mailserver.com` | -
**SMTP_PORT** | The SMTP port | `1234` | -
**SMTP_SECURED** | Use SSL for SMTP? | `true` | -
**SMTP_USER** | The SMTP username | `username` | -
**SMTP_PASS** | The SMTP password | `password` | -
**QUEUE_PROVIDER** | Which queue provider should be used?<br><br>Options are `REDIS` or `SQS`<br><br>When using Redis, queues are held in the Redis database<br><br>When using SQS, queues are held and managed by the AWS Simple Queue Service | `SQS` | -
QUEUE_NAMESPACE | A queue prefix for SQS | `example` | -
AWS_SQS_ACCESS_KEY_ID | An AWS Access Key ID with privileges to read/write to SQS queue jobs | `12567890` | -
AWS_SQS_SECRET_ACCESS_KEY | An AWS Secret Access Key for SQS | `example` | -
AWS_SQS_DEFAULT_REGION | The AWS region for SQS | `us-west-1` | -
GOOGLE_ENABLED | Enable OAuth via Google (Requires setup in the Google Developer Console) | `true` | `false`
GOOGLE_CLIENT_ID | Google OAuth Client ID | `12456789` | -
GOOGLE_CLIENT_SECRET | Google OAuth Client Secret | `12356789` | -
**FS_REPO** | Define the storage method (`local` for local storage or `amazon` for AWS S3 storage) | `local` | -
FS_SUBFOLDER | A subfolder for all uploads to live within | `storage` | `storage`
FS_LOCAL_ENDPOINT | An absolute path to storage | `/custom/storage/dir` | Current working directory
FS_AWS_S3_ACCESS_KEY_ID | If using the Amazon repo, an AWS Access Key with permissions to read and write to the specified S3 bucket | `12356789` | -
FS_AWS_S3_SECRET_ACCESS_KEY | AWS Secret Access Key | `12356789` | -
FS_AWS_S3_REGION | AWS Secret Access Key | `us-west-1` | -
FS_AWS_S3_BUCKET | The S3 bucket name | `12356789` | -
NEW_RELIC_LICENSE_KEY | A New Relic license key for monitoring the UI and API | `qwertyuiopsdfghjkl` | -
NEWRELIC_API_NAME | Name for the API in New Relic | `12356789` | -
NEWRELIC_UI_NAME | Name for the UI in New Relic | `12356789` | -
CLAMSCAN_BINARY | Location of Clamscan binary if requiring anti-virus scans on uploaded files (e.g. images) | `/usr/bin/clamscan` | -
**MAX_TRIP_COUNT** | Load control counter for Journey outcomes (Enterprise Only) | `15` | -

## xAPI Service

Please note that some of these variables are slightly different to their Application equivalents. Future updates will bring these inline with each other, with the eventual goal of allowing for a single `.env` file.

**Variables in bold are required or strongly recommended**

_Variables in italics are required for debugging or development only_


Name | Description | Example | Default
--- | --- | --- | ---
**EXPRESS_PORT** | The port that the UI is attached to | `8081` | `8081`
_MODELS_REPO_ | Development setting to pick database type (`mongo` or `memory`). Memory only to be used for testing | `mongo` | `mongo`
**MONGO_URL** | The [full Mongo connection string](https://docs.mongodb.com/manual/reference/connection-string/). This can include multiple hosts for replicas, and extra configuration values passed through query strings. | `mongodb://localhost:27017/learninglocker_v2`
**REDIS_URL** | The full URL of the Redis instance including port, database number and authentication if required | `redis://127.0.0.1:6379/0` | `redis://127.0.0.1:6379/0`
REDIS_PREFIX | A prefix to append to all keys within the Redis database | `learninglocker` | -
REDIS_PREFIX | A prefix to append to all keys within the Redis database | `learninglocker` | 'LEARNINGLOCKER'
**STORAGE_REPO** | Define the storage method (`local` for local storage or `s3` for AWS S3 storage) | `local` | -
FS_LOCAL_STORAGE_DIR | An absolute path to storage | `/custom/storage/dir` | Current working directory
FS_S3_ACCESS_KEY_ID | If using the Amazon repo, an AWS Access Key with permissions to read and write to the specified S3 bucket | `12356789` | -
FS_S3_SECRET_ACCESS_KEY | AWS Secret Access Key | `12356789` | -
FS_S3_REGION | AWS Secret Access Key | `us-west-1` | -
WINSTON_CONSOLE_LEVEL | Minimum logging level (error\|warning\|info\|debug\|silly) | `info` | `info`
**WINSTON_CLOUDWATCH_ENABLED** | Should logs be sent to AWS Cloudwatch?<br><br>[AWS credentials must be configured for Cloudwatch access](http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-identity-based-access-control-cwl.html) | `true` | `false`
WINSTON_CLOUDWATCH_LOG_GROUP_NAME | The Cloudwatch Logs group name | `llv2` | `llv2`
WINSTON_CLOUDWATCH_LOG_STREAM_NAME | The Cloudwatch Logs stream name | `application` | The server's hostname
WINSTON_CLOUDWATCH_ACCESS_KEY_ID | AWS Access Key with suitable privileges | `12345678901` | -
WINSTON_CLOUDWATCH_SECRET_ACCESS_KEY | AWS Secret Access Key | `12345678901` | -
WINSTON_CLOUDWATCH_REGION | The region the logs will be sent to | `us-west-1` | -
