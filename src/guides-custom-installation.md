# Custom installation

## Requirements

In order to install Learning Locker version 2, you will require a machine that has these minimum requirements:

* Node v6+
* Yarn
* GCC toolchain
* Connectivity to a Mongo instance
* Connectivity to a Redis instance
* Web server _e.g. Nginx or Apache_ (optional)

## Setup

The Learning Locker application is divided into two logically sepearate codebases, each of which can be configured to talk to the same Mongo and Redis instances. 

Each codebase requires that it is downloaded, built and configured before it can be run. This guide will aim to guide you through manually installing and running a full Learning Locker v2 stack.

More distribution specific information can be found inside the [install script source code](https://github.com/LearningLocker/deploy/).

### Package Management

We recommend the installation of [yarn](https://yarnpkg.com/en/) for package management.

## Installing and Building the Learning Locker UI, API and Worker

### Clone and install

Clone [the Learning Locker application](https://github.com/LearningLocker/learninglocker) into a new working directory on your server.

```
git clone git@github.com:LearningLocker/learninglocker.git
```

Enter the directory and install the requiements:

```
yarn install
```

### Build

You are now ready to build the code. You have different option here depending on how you wish to deploy the services. The codebase has 5 distinct services that can be built:

* UI Server
* UI Client
* API Server
* Worker
* CLI

If you wish to run the UI, API and Worker on the same machine and run CLI commands, you will probably want to build all the services as one:

```
yarn build-all
```

However you can find other build commands available in the [`package.json`](https://github.com/LearningLocker/learninglocker/blob/develop/package.json#L19) should you wish to only install (and run) a particular service.

## Installing the xAPI service

### Clone and install

Clone [the xAPI Service](https://github.com/LearningLocker/learninglocker) into a new working directory on your server.

```
git clone git@github.com:LearningLocker/xapi-service.git
```

Enter the directory and install the requiements:

```
yarn install
```

### Build

```
npm run build
```

## Running the services via PM2

[PM2](http://pm2.keymetrics.io/docs/usage/quick-start/) is an excellent tool that can be used to manage the Node processes. It also handles log management/rotation and can automatically restart failed services. Learning Locker comes prepackaged with some [pm2 configuration scripts](https://github.com/LearningLocker/learninglocker/tree/develop/pm2).

To install PM2, run the following command:

```
npm install -g pm2
```

## Running the services manually

#### Running the UI

```
node ui/dist/server
```

### Running the API

```
node api/dist/server
```


#### Running the worker

```
node worker/dist/server
```


### Running the xAPI service

_In your xAPI service directory_

```
node dist/server.js
```

