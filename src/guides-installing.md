---
redirect_from: 
   - "/install/"
   - "/installing/"
   - "/installation/"
   - "/upgrading/"
---

# Installing

## Via the install script

To install Learning Locker using our deploy script, please follow the below instructions.
For more information, you can view the [deployment repository's documentation](https://github.com/LearningLocker/deploy).

<iframe width="80%" height="315" src="https://www.youtube.com/embed/tc_VDNjXLSc" frameborder="0" gesture="media" allowfullscreen style="padding-left: 15%;"></iframe>

**You must run this script as root user. Typically this can be done by running `sudo su -`**

**Install with cURL**
```sh
curl -o- -L https://raw.githubusercontent.com/LearningLocker/deploy/master/deployll.sh > deployll.sh && bash deployll.sh
```
**Install with Wget**:
```sh
wget -qO deployll.sh https://raw.githubusercontent.com/LearningLocker/deploy/master/deployll.sh && bash deployll.sh
```

### Upgrading

You may choose to upgrade your Learning Locker to take advantage of new features and bug fixes. To make this process easier, it is strongly recommended that any Learning Locker running for production use has the database (Mongo) running on different servers to that of the application. This means you can seamlessly update your application without having to move your data.

You can run the install script below on your existing EC2 server and that will grab and rebuild the code directly on the server. **Please note: this requires an EC2 instance with at least 2GB of RAM**. You will be asked if you wish to "upgrade" any existing instance, or perform a fresh install.

If you plan on keeping the Mongo database on the same server as the application, you will need to perform a [backup and restoration](https://docs.mongodb.com/manual/tutorial/backup-and-restore-tools/) of your Mongo data between upgrades. For this reason we strongly recommend placing your database separate to your application.

### Logs

By default, logs are written to `/var/log/learninglocker/`

#### Install log

If there is a problem installing the script, you can view the full install log output here:
`/var/log/learninglocker/install.log`

#### Service logs

Individual logs for the different services outputs (stdout) and errors (stderr) are available in this directory under the following names:

**stdout**
* `xapi_stdout***.log`
* `api_stdout***.log`
* `ui_stdout***.log`
* `worker_stdout***.log`

**stderr**
* `xapi_stderr***.log`
* `api_stderr***.log`
* `ui_stderr***.log`
* `worker_stderr***.log`

`***`: _Logs may have slightly different names due to rotation_


### Restarting the services
To restart the services, simply run the following command: 
```
service pm2-learninglocker restart
```
Where `learninglocker` is the system user you chose to install with in the script (defaults to `learninglocker`)

### Managing the services

The PM2 service manages the 4 micro-services that Learning Locker requires. This is installed by default with the install script under the system user you chose. 

**In order to use the pm2 service, first ensure you are in as the correct system user:**

(using the default `learninglocker` system user):
```
sudo su learninglocker
```

#### Service status
To view the status of your processes (using the default `learninglocker` system user):
```
pm2 status
```

Output:
```
┌──────────┬─────────┬────────┬───┬──────┬────────────┐
│ Name     │ mode    │ status │ ↺ │ cpu  │ memory     │
├──────────┼─────────┼────────┼───┼──────┼────────────┤
│ API      │ cluster │ online │ 0 │ 0%   │ 144.0 MB   │
│ UIServer │ cluster │ online │ 0 │ 0%   │ 105.8 MB   │
│ Worker   │ cluster │ online │ 0 │ 0%   │ 109.5 MB   │
│ xAPI     │ cluster │ online │ 0 │ 0%   │ 81.8 MB    │
└──────────┴─────────┴──-─────┴───┴──────┴────────────┘
```

#### Service logs

You can view a tail of the logs by running:
```
pm2 logs
```

Or view the logs for a particular service (by name or ID):
```
pm2 logs xAPI
```

To view more lines:
```
pm2 logs --lines 1000
```

### Restarting the services manually
You can restart all the services by running:
```
pm2 restart all
```

Or individual services by their name or ID:
```
pm2 restart UIServer
```


### Application Structure

There are two main repositories that are installed as part of a fresh Learning Locker installation, the [Learning Locker application](https://github.com/LearningLocker/learninglocker) and [xAPI service](https://github.com/LearningLocker/xapi-service). An in depth look at what both these packages do can be read in the [Architecture Overview](../overview-architecture).

When installing your LL instance using the install script, these packages will be (by default) installed to `/usr/local/learninglocker/current` (as a symlink to a directory inside `/usr/local/learninglocker/release/...`).

Inside `current/webapp/` lives the Learning Locker application which controls the User Interface, API and worker.

We also install the xAPI Service here, inside the `current/xapi/` directory.


### Configuration & Environment Variables

Each of these applications has their own `.env`. These hold all the configurations that the applications require in order to run, from database settings to logging configuration.

By default the install script will copy the (.env.example) from [both](https://github.com/LearningLocker/learninglocker/blob/master/.env.example) repos [respectively](https://github.com/LearningLocker/xapi-service/blob/master/.env.example).

It is likely you will wish to configure your application to connect to external databases, and whilst setup and configuration of these is beyond the scopes of this documentation, you will need to ensure that both `.env` files contain the same configuration values where appropriate.

A full description of all configuration values in both repositories is available in the [Configuration Guide](../guides-configuring)

___

## Production Installations
For production installations, we recommend the following setup**:**

* 1 Load balancer (e.g. [AWS Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/));
* 2 Learning Locker servers (e.g. [AWS EC2](https://aws.amazon.com/ec2/));
* 3 Mongo servers in a replica set (e.g. [Atlas](https://www.mongodb.com/cloud/atlas));
* 1 Redis server (e.g. [AWS ElastiCache](https://aws.amazon.com/elasticache/)).

This setup ensures good performance and a reasonable degree of redundancy in case of failures in some parts. We'd also recommend that you back up your Mongo database quite regularly depending on your own data requirements. If this sounds too costly or challenging, you may wish to consider using [our Software as a Service (SaaS) enterprise solution](https://learningpool.com/solutions/learning-record-store-learning-locker/). If you require more advice for your setup, please get in touch via [hello@learninglocker.net](mailto:hello@learninglocker.net).

___

## Custom installations

Please follow instructions [here](../guides-custom-installation) if you wish to install Learning Locker manually.
