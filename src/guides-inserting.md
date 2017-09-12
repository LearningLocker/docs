---
---

# Inserting Statements Guide
To quickly try out inserting statements into your Learning Locker instance you can use Postman. Postman is a tool for creating and sending HTTP requests. You can [download and install Postman via their website](https://www.getpostman.com/). Once you've installed Postman, you can watch the video below and check out the [documentation for our xAPI HTTP Interface](../http-xapi-statements).

TODO - Video

Before you start designing and inserting your own statements in production, you should consider using [tools that already transmit xAPI statements](#). If you can't use any of these existing tools, there are a number of processes and best practices that you can follow to fall into the pit of success when designing and transmitting your own statements.

- Design Statements
  1. [List the experiences](#list-experiences) you wish to capture for analysis.
  2. [Create a recipe](#create-recipes) (a statement template for an experience) for each experience from the previous step.
  3. [Map the variables](#map-variables) in each recipe to variables in your application.
- Transmit Statements
  1. [Identify the sources](#identify-sources) that will construct and transmit statements.
  2. [Implement the transmission](#implementing-transmission) from the sources to the LRS.

## List Experiences
At this stage you should figure out which experiences are important to track (e.g. logging in, completing a quiz, watching a video, etc) and what data you ideally need to capture for analysis (e.g. quiz score, video duration, etc). When creating this list, you may wish to consider the data required to:

- Answer your research questions.
- Produce your stakeholder reports.
- Adapt and improve the experiences of your users.

## Create Recipes
At this stage you should create some example statements for each of the experiences you listed earlier ensuring that you include all of the data required for each expereince inside the statement.

Before you create a recipe, consider reusing one of the [recipes in the Tin Can Registry](https://registry.tincanapi.com/#home/profiles) as this will hopefully save you some time, improve your compatability with existing systems, and ensure that you're using best practices. You may need to adapt these existing recipes to better meet your needs, as you may require additional data or not require some of the data they specify.

If you can't find an existing recipe, don't worry, it's easy to create your own and we have some guidelines below.

- Your actors should be identified by an [account](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Data.md#2424-account-object), where the `homePage` is an IRI for the application and the `name` is an identifier for the user. Other identifier types are available, but we recommend using an account.
- Try to select an appropriate [verb from the Tin Can Registry](https://registry.tincanapi.com/#home/verbs) before creating your own.
- Try to select an appropriate [activity type from the Tin Can Registry](https://registry.tincanapi.com/#home/activityTypes) before creating your own.
- Only include one language in your languages maps. Preferably this should use the language of the user.
- You should set a [timestamp](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Data.md#timestamp), otherwise the LRS will generate one that uses the time the statement was stored instead of the time an experience occurred, which is inaccurate for analysis.
- Your verb and object identifiers should preferably resolve to a JSON representation of the verb or object.
- The [statement context](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Data.md#context) should contain some minimal debugging information in the [extensions](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Data.md#miscext). For example, you might define the version of your statement transmission tool and platform.

A statement for "viewing an application" using these guidelines might look a bit like the statement below.

```json
{
  "actor": {
    "name": "Example User",
    "account": {
      "homePage": "http://www.example.org",
      "name": "example_user_id"
    }
  },
  "verb": {
    "id": "http://id.tincanapi.com/verb/viewed",
    "display": {
      "en": "viewed"
    }
  },
  "object": {
    "id": "http://www.example.org",
    "definition": {
      "type": "http://activitystrea.ms/schema/1.0/application",
      "name": {
        "en": "Example Application"
      }
    }
  },
  "context": {
    "platform": "Example Platform",
    "language": "en",
    "extensions": {
      "http://www.example.org/transition_tool_version": "1.0.0"
    },
  },
  "timestamp": "2015-01-01T01:00Z"
}
```

There are [more example statements provided in the xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Data.md#appendix-a-example-statements). For further support and consultation, you can email [hello@ht2labs.com](mailto:hello@ht2labs.com).

## Map Variables
Using the recipes from the previous step, you should map the data required in each of the recipes to variables in your application. You might find it useful to use a table like the one below.

Statement Property | Mapping
--- | ---
`actor.name` | User's full name from our user data model.
`actor.account.homePage` | The URL of the application: "http://www.example.org"
`actor.account.name` | User's identifier from our user data model.
`object.id` | The URL of the application: "http://www.example.org"
... | ...

## Identify Sources
At this stage, you should identifiy where the statement will be constructed and transmitted for each recipe that you identified earlier. You should consider whether you will be sending statements from the [client-side](https://en.wikipedia.org/wiki/Client-side) or the [server-side](https://en.wikipedia.org/wiki/Server-side) for each recipe as this will effect the transmission implementation.

## Implementing Transmission
At this stage, you can start planning and implementing the transmission of statements to your Learning Locker instance via the [xAPI HTTP Interface](../http-xapi-statements). However, there are a number of things listed below that you should consider before you begin.

- [Batching Statements](#batching-statements)
- [Handling Sending Failures](#handling-sending-failures)
- [Sending Securely](#sending-securely)

### Batching Statements
If you're potentially sending a significant number of statements in a short period of time, you should consider sending statements to the LRS in batches to improve response times, reduce HTTP requests, and reduce the elapsed time spent sending statements.

### Handling Sending Failures
If a statement fails to be sent you may want to consider implementing some retry strategies to resend statements that previously failed to be stored (normally because of downtime). We'd recommend that you send these failed statements in [batches](#batching-statements). If you're sending statements from the client-side, we'd recommend that you wait 5-60 seconds between retries and retry 3-5 times. If you're sending statements server-side, you may want to consider storing failed statements somewhere and using a Cron job to send them.

### Sending Securely
If you're sending statements from the server-side this shouldn't be an issue as the LRS credentials are not exposed. However, if you're sending statements from the client-side, you should consider finding a way to protect the LRS credentials so that they're not exposed to users, since they may try to read or write unwanted data from/to the LRS. We'd recommend using the [xAPI launch process](https://github.com/adlnet/xapi-launch) with Learning Locker's Launchr, you can email [hello@ht2labs.com](mailto:hello@ht2labs.com) for more information.
