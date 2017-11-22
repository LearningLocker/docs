---
---

# Architecture Overview
Learning Locker is divided into two Github repositories, one for [the Learning Locker application](#learning-locker-application) and one for [the xAPI service](#xapi-service).

In Learning Locker the Browser Interface, HTTP Interface, and xAPI Service use their own HTTP ports, hence we'd recommend that you use a server such as [NGINX](https://www.nginx.com/) to route to the correct port upon receiving HTTP requests. If you utilise the [installation command provided in the installation documentation](../guides-installing), it will attempt to install and setup NGINX for you. The installation command will also use [PM2](https://github.com/Unitech/pm2) to manage your processes and restart them if they exit to ensure uptime.

## Learning Locker Application
The Learning Locker application repository is made up of three parts (in the same Github repository), [the browser interface (UI)](#browser-interface-ui), [the HTTP interface (API)](#http-interface-api), and [the workers](#workers). The three parts are ran as their own process to share resources (since JavaScript is single-threaded) and ensure a degree of redundancy.

### Browser Interface (UI)
The browser interface is written in JavaScript (ES6 using Webpack and Babel), utilising React to construct views and Redux to manage state. The browser interface utilises the HTTP interface to retrieve and change models in Learning Locker. Note that all models automatically save within 3 seconds after they're changed. For more information and help with the browser interface, you can go to the [Help Centre for Learning Locker](https://ht2ltd.zendesk.com/hc/en-us/categories/115000129989-Learning-Locker).

### HTTP Interface (API)
The HTTP interface is also written in JavaScript (ES6 using Webpack and Babel) and uses Express, Restify, Mongo, and Mongoose. Express is used to provide HTTP routes and Restify is used on top of Express to provide [RESTful routes for each of the models in Learning Locker](../http-rest). Mongoose is used on top of Mongo to manage models in the Mongo database used by Learning Locker. 

### Workers
The workers are also written in JavaScript (ES6 using Webpack and Babel), they utilise Redis and optionally SQS via queue drivers. The workers make use of queues to process long running jobs. Multiple instances of the workers can be used in a cluster to process the queues in parallel across many machines and processors.

Currently there are workers for managing the [query builder cache](https://ht2ltd.zendesk.com/hc/en-us/articles/115000925249-Query-Builder-Overview), [extracting personas from statements](../http-personas), [exporting statements via CSV](https://ht2ltd.zendesk.com/hc/en-us/articles/115000931369-Exporting-statements-to-CSV), [importing personas via CSV](https://ht2ltd.zendesk.com/hc/en-us/articles/115001223771-Adding-Additional-Data-to-People-via-CSV), and (in [Enterprise](https://www.ht2labs.com/learning-locker)) [recalculating journeys](https://ht2ltd.zendesk.com/hc/en-us/articles/115000857025-Journeys-Overview).

## xAPI Service
The xAPI service is made up of four services in separate Github repositories, the services are for [statements](#statements), [activity profiles](#activity-profiles), [agent profiles](#agent-profiles), and [state](#state). The xAPI service makes it easy to run the entire [xAPI HTTP Interface](../xapi-http) whilst allowing maintainers to work on small encapsulated pieces.

The service is written in TypeScript and provides an Express, Mongo, Redis, and AWS S3 connection to the four services as required.

If you require more information there are some useful links provided below.
- [xAPI Specification of the HTTP Resources](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#20-resources).
- [Documentation of the xAPI HTTP interface](../http-xapi).
- [Github repository for the xAPI Service](http://github.com/LearningLocker/xapi-service).

### Statements
This service provides a [xAPI compliant Statements HTTP interface](../http-xapi-statements) written in TypeScript to use Express, Mongo, and Redis. It also uses local file storage or AWS S3 storage to store attachments.

The [Activity HTTP Resource](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#25-activities-resource) is also provided as part of this service because Learning Locker has to merge activity definitions from inserted statements to provide this resource. You can find out more about this resource in the [Activities HTTP interface documentation](../http-xapi-activities#get-activities).

If you require more information there are some useful links provided below.
- [xAPI Specification of the Statements Resource](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#stmtres).
- [Documentation of the xAPI Statements HTTP interface](../http-xapi-statements).
- [Github repository for the Statements Service](http://github.com/LearningLocker/xapi-statements).

### Activity Profiles
This service provides a [xAPI compliant Activity Profiles HTTP interface](../http-xapi-activities) written in TypeScript to use Express and Mongo. It also uses local file storage or AWS S3 storage to store documents.

If you require more information there are some useful links provided below.
- [xAPI Specification of the Activity Profiles Resource](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#actprofres).
- [Documentation of the xAPI Activity Profiles HTTP interface](../http-xapi-activities).
- [Github repository for the Activity Profiles Service](http://github.com/LearningLocker/xapi-activities).

### Agent Profiles
This service provides a [xAPI compliant Agent Profiles HTTP interface](../http-xapi-agents) written in TypeScript to use Express and Mongo. It also uses local file storage or AWS S3 storage to store documents.

The [Agent HTTP Resource](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#24-agents-resource) is also provided as part of this service to retrieve all of the agents that are used by a single person. A person can be created by inserting statements via the [xAPI Statements HTTP interface](../http-xapi-statements) or using the [Persona HTTP interface](../http-personas). Multiple agents can be associated with a person using the [Persona HTTP interface](../http-personas) too.

If you require more information there are some useful links provided below.
- [xAPI Specification of the Agent Profiles Resource](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#26-agent-profile-resource).
- [Documentation of the xAPI Agent Profiles HTTP interface](../http-xapi-agents).
- [Github repository for the Agent Profiles Service](http://github.com/LearningLocker/xapi-agents).

### State
This service provides a [xAPI compliant State HTTP interface](../http-xapi-states) written in TypeScript to use Express and Mongo. It also uses local file storage or AWS S3 storage to store documents.

If you require more information there are some useful links provided below.
- [xAPI Specification of the State Resource](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI-Communication.md#23-state-resource).
- [Documentation of the xAPI State HTTP interface](../http-xapi-states).
- [Github repository for the State Service](http://github.com/LearningLocker/xapi-state).
