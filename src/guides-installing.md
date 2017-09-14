---
---

# Installing V2 Guide
To install Learning Locker version 2, you can run one of the commands below **as the root user** on `CentOS`, `Fedora`, `Ubuntu`, and `Debian`. For more information, you can view the [deployment repository's documentation](https://github.com/LearningLocker/deploy).

**Install with curl**
```sh
curl -o- https://bit.ly/ll-v2-install | bash
```
**Install with wget**:
```sh
wget -qO- https://bit.ly/ll-v2-install | bash
```

To upgrade, simply re-run the command above.

## Production Installations
For production installations, we recommend the following setup**:**

* 1 Load balancer (e.g. [AWS Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/));
* 2 Learning Locker servers (e.g. [AWS EC2](https://aws.amazon.com/ec2/));
* 3 Mongo servers in a replica set (e.g. [Atlas](https://www.mongodb.com/cloud/atlas));
* 1 Redis server (e.g. [AWS ElastiCache](https://aws.amazon.com/elasticache/).

This setup ensures good performace and a reasonable degree of redundancy in case of failures in some parts. We'd also recommend that you back up your Mongo database quite regularly depending on your own data requirements. If this sounds too costly or challenging, you may wish to consider using [our Software as a Service (SaaS) enterprise solution](https://www.ht2labs.com/learning-locker/). If you require more advice for your setup, please get in touch via [hello@ht2labs.com](mailto:hello@ht2labs.com).
