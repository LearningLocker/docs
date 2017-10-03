# Custom installation

## Requirements

In order to install Learning Locker version 2, you will require a machine that has these minimum requirements:

* [Git](https://git-scm.com/)
* [GCC toolchain](https://en.wikipedia.org/wiki/GNU_toolchain)
* [Node](https://nodejs.org/en/) (v6+)
* [Yarn](https://yarnpkg.com/en/)
* Connectivity to a [Mongo](https://www.mongodb.com/) instance (v3.0+)
* Connectivity to a [Redis](https://redis.io/) instance (v2.8+)
* Web server _e.g. [Nginx](https://www.nginx.com/resources/wiki/) or [Apache](https://httpd.apache.org/)_ (optional)
* Process management system _e.g. [PM2](http://pm2.keymetrics.io/docs/usage/quick-start/) or [Supervisor](http://supervisord.org/)_

### GCC and Git

A good minimum set of requirements for Git and the GCC toolchaiin can be installed with the following commands:

### Fedora based systems
```
yum update
yum -y install curl git python make automake gcc gcc-c++ kernel-devel xorg-x11-server-Xvfb git-core
```

### Ubuntu/Debian based systems
```
apt-get update && apt-get upgrade
apt-get -y -qq install curl git python build-essential xvfb apt-transport-https
```

### Node and Yarn installation

There are multiple ways to install Node and Yarn (a package management system for Node). We would recommend the excellent NVM (Node Version Manager) which can be installed by following instructions here: https://github.com/creationix/nvm

We are currently targetting builds on Node 6.* (the current LTS) release. Future versions will also support Node 8.

Instructions to install Yarn can be found here: https://yarnpkg.com/en/docs/install

### Process Management

[PM2](http://pm2.keymetrics.io/docs/usage/quick-start/) is an excellent tool that can be used to manage the Node processes. It also handles log management/rotation and can automatically restart failed services. Learning Locker comes prepackaged with some [pm2 configuration scripts](https://github.com/LearningLocker/learninglocker/tree/develop/pm2).

To [install PM2](http://pm2.keymetrics.io/docs/usage/quick-start/#installation), run the following command:

```
npm install -g pm2
```

We also recommend installing the `pm2-logrotate` module, which can handle rotating and compressing your logs.

```
pm2 install pm2-logrotate
pm2 set pm2-logrotate:compress true
```

## User best practice

It is always preferable that you do not run your Node processes as the `root` user. For this reason we would always suggest creating a new system user under which installation, builds and services can be run.

## Setup

The Learning Locker application is divided into two logically seperate codebases, each of which can be configured to talk to the same Mongo and Redis instances. 

Each codebase requires that it is downloaded, built and configured before it can be run. This guide will aim to guide you through manually installing and running a full Learning Locker v2 stack.

More distribution specific information can be found inside the [install script source code](https://github.com/LearningLocker/deploy/).

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

* UI Server - `yarn build-ui-server`
* UI Client - `yarn build-ui-client`
* API Server - `yarn build-api-server`
* Worker - `yarn build-worker-server`
* CLI - `yarn build-cli-server`

If you wish to run the UI, API and Worker on the same machine and run CLI commands, you will probably want to build all the services in one simple command:

```
yarn build-all
```

## Installing the xAPI service

### Clone and install

Clone [the xAPI Service](https://github.com/LearningLocker/learninglocker) into a new working directory on your server.

```
git clone git@github.com:LearningLocker/xapi-service.git
```

Enter the directory and install the requiements:

```
npm install
```
_Note: we do not currently use `yarn` to install the xAPI Service_

### Build

```
npm run build
```

## Running the services via PM2

If PM2 has been installed, you will be able to run the services using the preconfigured pm2 files in each codebase:

### Learning Locker UI, API, Worker

To start all 3 services, navigate to the LL working directory and run:
```
pm2 start pm2/all.json
```

### xAPI Service

To start the xAPI service, navigate to the xAPI Service working directory and run:
```
pm2 start pm2/xapi.json
```

### Config, status and logs

Note you may wish to copy and modify these pm2 config files based on your setup. Documentation can be found [here](http://pm2.keymetrics.io/docs/usage/application-declaration/).

To view the status of your services:
```
pm2 status
```

To view logs:
```
pm2 logs
```

To restart the services:
```
pm2 restart all
```


## Running the services manually

If you wish to use a different process management tool (e.g. Supervisor) or simply wish to run them manually for testing, you can start the services with these commands.

#### Running the UI

```
node ui/dist/server
```

#### Running the API

```
node api/dist/server
```


#### Running the worker

```
node worker/dist/server
```


#### Running the xAPI service

_In your xAPI service directory_

```
node dist/server.js
```

## Server configuration

The application is accessed through 3 web interfaces, the UI, API and xAPI. Each of these is configured to run on independent ports but it is recommended you setup a server to sit infront of all traffic and route accordingly. An example nginx config can be seen here: https://github.com/LearningLocker/learninglocker/blob/develop/nginx.conf.example
