---
---

# Contributing
There are many ways that you can contribute to the Learning Locker projects including:

- [Pull Requests](#pull-requests)
- [Issues](#issue-guidelines)
- [Testing](#testing)
- [Documentation](#documentation)
- [Translations](/translation)
- Promotion

## Pull requests
The best way to get started with pull requests is to create a ticket in our tracker then address the issue / enhancement in your pull request. If the pull request is in response to a bug, then no extra detail is required, however, if you are proposing new functionality or a rewrite of existing code, then please include a detailed description with your pull request. We are certainly open to pull requests and want to encourage people to get involved. If possible please create a test, this ensures that the issue you are fixing doesn't reappear and helps to show the expected behaviour.

**Hot fix**
> If the pull request is a hot fix then issue the pull request to the **master** branch.

**Everything else**
> If the pull request is something more substantial then make the pull request to the **develop** branch for testing before it is merged with master.

## Issue Guidelines
If you're creating an issue, it should be either a [bug](#bugs), an [enhancement](#enhancements), or a [question](#questions).

### Bugs
When reporting a bug please state the following information:

1. Version (or branch and commit) of Learning Locker that you are using (see the `VERSION` file)
2. Steps to reproduce the bug
3. Expected behaviour potentially referencing the [xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI.md)
4. Actual behaviour potentially with a screenshot.
5. Database and authentication (i.e. Mongo with basic authentication)
6. OS, browser, and browser version (only for client side bugs)

#### Examples
- [Server-side issue](https://github.com/LearningLocker/learninglocker/issues/315)
- [Client-side issue](https://github.com/LearningLocker/learninglocker/issues/317)

### Enhancements
When reporting an enhancement please state the following information:

1. Motive (why this enhancement is needed)
2. Result (what the enhancement does)

### Questions
When asking a question please make it obvious that it is a question and not a bug or an enhancement.

## Testing
We do now have some testing which can be found in the `app/tests` directory. We'd like more tests so please feel free to add some via a pull request. The tests are ran automatically on every push to the Github repository via Travis.

## Documentation
If you would like to help us document Learning Locker, here are the steps.

-  Fork the [documentation repo](https://github.com/learninglocker/docs)
-  Edit your copy
-  Issue a pull request with any changes
