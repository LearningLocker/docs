---
---

# Installing V2 Guide
To install Learning Locker version 2, you can run one of the commands below **as the root user** on `CentOS`, `Fedora`, `Ubuntu`, and `Debian`. For more information, you can view the [deployment repository's documentation](https://github.com/LearningLocker/deploy).

Please run the required update script for your distro to ensure you have the latest version of all packages.

.e.g
```
yum update
```
or
```
apt-get update
```


**You must run this script as root user. Typically this can be done by running `sudo su -`**

**Install with cURL**
```sh
curl -o- http://lrnloc.kr/install-v2 | bash
```
**Install with Wget**:
```sh
wget -qO- http://lrnloc.kr/install-v2 | bash
```

To upgrade, simply re-run the command above.

## Production Installations
For production installations, we recommend the following setup**:**

* 1 Load balancer (e.g. [AWS Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/));
* 2 Learning Locker servers (e.g. [AWS EC2](https://aws.amazon.com/ec2/));
* 3 Mongo servers in a replica set (e.g. [Atlas](https://www.mongodb.com/cloud/atlas));
* 1 Redis server (e.g. [AWS ElastiCache](https://aws.amazon.com/elasticache/)).

This setup ensures good performance and a reasonable degree of redundancy in case of failures in some parts. We'd also recommend that you back up your Mongo database quite regularly depending on your own data requirements. If this sounds too costly or challenging, you may wish to consider using [our Software as a Service (SaaS) enterprise solution](https://www.ht2labs.com/learning-locker/). If you require more advice for your setup, please get in touch via [hello@ht2labs.com](mailto:hello@ht2labs.com).

## Application Structure

There are two main repositories that are installed as part of a fresh Learning Locker installation, the [Learning Locker application](https://github.com/LearningLocker/learninglocker) and [xAPI service](https://github.com/LearningLocker/xapi-service). An in depth look at what both these packages do can be read in the [Architecture Overview](../overview-architecture).

When installing your LL instance using the deploy script, these packages will be (by default) installed to `/usr/local/learninglocker/current` (as a symlink to a directory inside `/usr/local/learninglocker/release/...`).

Inside `current/` lives the Learning Locker application which controls the User Interface, API and worker.

We also install the xAPI Service here, inside the `xapi/` directory.

## Configuration & Environment Variables

Each of these applications has thier own `.env`. These hold all the configurations that the applications require in order to run, from database settings to logging configuration.

By default the install script will copy the (.env.example) from [both](https://github.com/LearningLocker/learninglocker/blob/master/.env.example) repos [respectively](https://github.com/LearningLocker/xapi-service/blob/master/.env.example).

It is likely you will wish to configure your application to connect to external databases, and whilst setup and configuration of these in beyond the scopes of this documentation, you will need to ensure that both `.env` files contain the same configuration values where appropriate.

A full description of all configuration values in both repositories is available in the [Configuration Guide](../guides-configuring)