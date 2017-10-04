---
---

# Command Line Interface

Learning Locker comes with a range of CLI commands that can be used to execute common administrative tasks.

> `Note:` In order to use the CLI commands, you must ensure that the CLI server is built. The default install script will have performed this action as part of the `yarn build-all` command, but it can manually be built using `yarn build-cli-server`

> `Note:` These commands should be run from the Learning Locker working directory. By default, with the install script, this is `/usr/local/learninglocker/current`

## `createSiteAdmin`

Create a site admin user

### Command:
```sh
node cli/dist/server createSiteAdmin [email] [organisation] [password]
```

Create a new user and organisation for the site. This user will have the Super User privilege (only assignable via this command) and will also automatically be made an admin of the new organisation.

Additional organisation admins can be made within the platform but other super users need to be made via subsequent calls to this command.


### Arguments:
#### `email`
The email of the user - this is what they will use to login

#### `organisation`
The name of the new organisation. If the organisation already exists, the new user will be added to it.

#### `password`
The user's password

### Example
```
node cli/dist/server createSiteAdmin "user@example.com" "Example" "password123"
```
___

## `clearAggregationCache`
Clear the cache of any aggregation data

### Command
```sh
node cli/dist/server clearAggregationCache
```

Will clear down any cached aggregation results. This can be useful if you require an up-to-date result for a particular visualisation or query.

### Arguments

#### `-o --org <organisation_id>` (optional)
An organisation's Mongo ObjectId.

Filter to only clear down the cache for a particular organisation.

### Example

Clear all caches:
```
node cli/dist/server clearAggregationCache
```

Clear a particular organisation's cache:
```
node cli/dist/server clearAggregationCache 572cac001bb110583ed76177
```

___

## `batchJobs` 
Batch run the worker across existing statements

### Command
```sh
node cli/dist/server batchJobs
```

Will force statements back through the respective worker queue if they have not already been handled. This is useful if you have migrated statements into the LRS (e.g. if migrating from v1), or if your workers were not enabled at the time your statements were inserted into the LRS.

Note this can be an intensive task and may be best done on a separate box.

Currently you can batch process the Query Builder Cache generation (used to populate the items for the query builder) and also the persona generation.

When a worker job is completed, the appropriate worker queue name will be populated into the `completedQueues` array on each statement document in the database. If you wish to reprocess a set of statements, then clearing the `completedQueues` will allow you to reprocess them.


### Arguments

#### `-j --job [job]` (optional)
Which worker job to run. `querybuildercache`* and `personas`. 

_* Default job_

#### `-o --org [organisation_id]` (optional)
An organisation's Mongo ObjectId.

Filter to operate on only statements in this organisation.

#### `-l, --lrs [lrs]` (optional)
An LRS's (store) Mongo ObjectId.

Filter to operate on only statements in this store.

#### `-b, --batchSize [batchSize]` (optional)
How many statements to include in each batch. For query builder cache generation, good performance is seen with 1000 per batch. For persona processing we've seen good results with this set to 100.


#### `-f, --from [date]` (optional)
ISO8601 formatted date to query the stored date from.


#### `-t, --to [date]` (optional)
ISO8601 formatted date to query the stored date to.


### Example

Process persona data on all statements (100 per batch) personas in a particular store:
```
node cli/dist/server batchJobs -j personas -b 100 -lrs 572cac001bb110583ed76177
```
