---
---

# xAPI Overview
The Experience API (xAPI) is a specification that defines how to store and retrieve learning experiences across various sources for analysis. Recording learning experiences in this way improves the ability to comprehend and compare learning experiences and their outcomes.

## Data Models
The xAPI provides four data models for recording elements of a learning experience, these are:

- [**Statements**](../http-xapi-statements) which are an immutable record of an agent's interaction with an activity. A set of statements can be used to track a complete learning experience. [Voiding](https://vimeo.com/168961267) can be used to invalidate previous statements, henceforth removing them from normal retrieval methods.
- [**Activity Profiles**](../http-xapi-activities) that record additional mutable information about an activity that you wouldn't want to record on every statement.
- [**Agent Profiles**](../http-xapi-agents) that record additional mutable information about an agent that you wouldn't want to record on every statement.
- [**State**](../http-xapi-states) which records mutable information about an agent in relation to an activity, such as how far they've progressed through a activity.

## Using the xAPI
To begin using the xAPI in Learning Locker, you can checkout our guides for [integrating with Learning Locker](../guides-integrating), [inserting statements](../guides-inserting), and [retrieving statements](../guides-retrieving). For more detailed documentation of the xAPI conformant HTTP interfaces that Learning Locker provides, you can checkout the [xAPI HTTP interface documentation](../http-xapi).
