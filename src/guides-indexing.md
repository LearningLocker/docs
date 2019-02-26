---
---

# Indexing
If some of your queries are taking a while to run, you can take advantage of database indexes to improve performance. You can create indexes in your database via [the Mongo shell](https://docs.mongodb.com/manual/mongo/). You can run the code below in your Mongo shell to create our recommended indexes. More information is available about [using indexes via Mongo's documentation](https://docs.mongodb.com/manual/indexes/). If utilising indexes doesn't have the required performance improvement, you can instead utilise [BI tools](../guides-retrieving).

```js
// Statements
db.statements.createIndex({ "statement.id": 1 }, { background: true });
db.statements.createIndex({ stored: -1 }, { background: true });

db.statements.createIndex({ organisation: 1, lrs_id: 1, "statement.object.id": 1, "statement.object.objectType": 1 }, { background: true });
db.statements.createIndex({ organisation: 1, lrs_id: 1, "voided": 1, "statement.verb.id": 1, "statement.object.objectType": 1 }, { background: true });
db.statements.createIndex({ organisation: 1, lrs_id: 1, "voided": 1, "statement.verb.id": 1, "statement.object.id": 1 }, { background: true });
db.statements.createIndex({ organisation: 1, lrs_id: 1, "voided": 1, "statement.actor.mbox": 1 }, { background: true });
db.statements.createIndex({ organisation: 1, lrs_id: 1, "voided": 1, "statement.actor.account.name": 1, "statement.actor.account.homePage": 1 }, { background: true });
db.statements.createIndex({ organisation: 1, lrs_id: 1, "voided": 1, "timestamp": -1, _id: -1 }, { background: true });
db.statements.createIndex({ organisation: 1, lrs_id: 1, "voided": 1, "stored": -1, _id: -1 }, { background: true });

db.statements.createIndex({ organisation: 1, lrs_id: 1, hash: 1 }, {unique: true, background: true});

db.statements.createIndex({ organisation: 1, lrs_id: 1, activities: 1, timestamp: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, agents: 1, timestamp: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, registrations: 1, timestamp: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, relatedActivities: 1, timestamp: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, relatedAgents: 1, timestamp: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, verbs: 1, timestamp: -1}, {background: true});

db.statements.createIndex({ organisation: 1, lrs_id: 1, activities: 1, stored: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, agents: 1, stored: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, registrations: 1, stored: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, relatedActivities: 1, stored: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, relatedAgents: 1, stored: -1}, {background: true});
db.statements.createIndex({ organisation: 1, lrs_id: 1, verbs: 1, stored: -1}, {background: true});

db.statements.createIndex({ organisation: 1, "statement.object.id": 1 }, { background: true });
db.statements.createIndex({ organisation: 1, "statement.verb.id": 1, "statement.object.id": 1 }, { background: true });
db.statements.createIndex({ organisation: 1, "timestamp": -1, _id: 1 }, { background: true });
db.statements.createIndex({ organisation: 1, "stored": -1, _id: 1 }, { background: true });
db.statements.createIndex({ organisation: 1, "voided": 1 }, { background: true });

db.statements.createIndex({ organisation: 1, personaIdentifier: 1 }, { background: true });
db.statements.createIndex({ organisation: 1, "person._id": 1, timestamp: -1 }, { background: true });
db.statements.createIndex({ "person._id": 1}, { background: true});

// Personas 
db.personas.createIndex({organisation: 1}, {background: true});
db.personaIdentifiers.createIndex({organisation: 1, persona: 1}, {background: true});
db.personaIdentifiers.createIndex({ organisation: 1, "ifi.key": 1, "ifi.value.homePage": 1, "ifi.value.name": 1}, {background: true})
db.personaIdentifiers.createIndex({ organisation: 1, "ifi.key": 1, "ifi.value": 1}, {background: true, unique: true});
db.personaAttributes.createIndex({organisation: 1, personaId: 1, key: 1}, {background: true});
db.personaAttributes.createIndex({personaId: 1, key: 1}, {background: true});

// State API
db.states.createIndex({ "organisation" : 1, "lrs" : 1, "activityId" : 1, "agent.account.homePage" : 1, "agent.account.name" : 1, "stateId" : 1, "registration" : 1}, {background: true});
db.states.createIndex({ "organisation" : 1, "lrs" : 1, "activityId" : 1, "agent.mbox" : 1, "stateId" : 1}, {background: true});
db.states.createIndex({ "organisation" : 1, "lrs" : 1, "activityId" : 1, "stateId" : 1}, {background: true});

// Others
db.client.createIndex({ "api.basic_key": 1, "api.basic_secret": 1}, {unique: true, background: true});
db.fullActivities.createIndex({organisation:1, lrs_id: 1, activityId:1}, {unique: true, background:true});

```
