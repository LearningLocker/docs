---
---

# Inserting Statements Guide
To quickly try out inserting statements into your Learning Locker instance you can use Postman. Postman is a tool for creating and sending HTTP requests. You can [download and install Postman via their website](https://www.getpostman.com/).

TODO - Discuss getting client credentials.
TODO - Link to xAPI Docs.
TODO - Screenshot of Postman with request.
TODO - Video

Before you start designing and inserting your own statements in production, you should consider using [tools that already transmit xAPI statements](#). If you can't use any of these existing tools, there are a number of processes and best practices that you can follow to fall into the pit of success when designing and transmitting your own statements.

1. Design Statements
  1. [List the experiences](#list-experiences) you wish to capture for analysis.
  2. [Create a recipe](#create-recipes) (a statement template for an experience) for each experience from the previous step.
  3. [Map the variables](#map-variables) in each recipe to variables in your application.
2. Transmit Statements
  1. [Identify the sources](#identify-sources) that will construct and transmit statements.
  2. [Implement the transmission](#implent-transmission) from the sources to the LRS.

## List Experiences
At this stage you should figure out which experiences are important to track (e.g. logging in, completing a quiz, watching a video, etc) and what data you ideally need to capture for analysis (e.g. quiz score, video duration, etc). When creating this list, you may wish to consider the data required to:

- Answer your research questions.
- Produce your stakeholder reports.
- Adapt and improve the experiences of your users.

## Create Recipes
At this stage you should create some example statements for each of the experiences you listed earlier ensuring that you include all of the data required for each expereince inside the statement. Before you create a recipe, consider reusing one of the [recipes in the Tin Can Registry](https://registry.tincanapi.com/#home/profiles) as this will hopefully save you some time, improve your compatability with existing systems, and ensure that you're using best practices. You may need to adapt these existing recipes to better meet your needs, as you may require additional data or not require some of the data they specify. If you can't find an existing recipe, don't worry, it's easy to create your own, just follow the steps below.

1. Construct the verb. ID that best fits the action taking place in the experience from the registry or create one (yes it should preferable resolve but it doesn't have to). The display should contain one language in the map (preferably the language in use by the user at the time).
2. Construct the object. Select an activity type that best describes the type of activity.
3. Construct the actor. Decide which IFI to use for your users. We recommend using accounts.
4. Construct the context.
5. Construct the result.


- Context contains some minimal debugging info in extensions.
- Context usually contains the application you're using, course, etc.
- Languages (only one).
- Perhaps note that statements are immutable and non-relational.
- Note that a timestamp should be set, otherwise the LRS will generate one that using the time it was stored rather than the time the experience took place.

## Map Variables
Maybe provide an example demonstrating a table with the statement property and a explanation of where the data will be coming from.

## Identify Sources
At this stage, you should identifiy where the statement will be constructed and transmitted for each recipe that you identified earlier. You should consider whether you will be sending statements from the [client-side](https://en.wikipedia.org/wiki/Client-side) or the [server-side](https://en.wikipedia.org/wiki/Server-side) for each recipe as this will effect the transmission implementation.

## Implement Transmission
### Client-Side
Batching. Creds - Launchr.

### Server-Side
Batching. Creds easier.



