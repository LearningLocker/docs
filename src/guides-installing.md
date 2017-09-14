---
---

# Installing V2 Guide
To install Learning Locker version 2, you can simply run the command below as the root user on CentOS, Fedora, Ubuntu, and Debian. For more information, you can view the [deployment repository's documentation](https://github.com/LearningLocker/deploy).

```sh
wget -qO- http://bit.ly/ll-v2-install | bash
```

To upgrade, simply rerun the command above.

## Production Installations
For production installations, we do recommend that you have at least: 

- 1 Load balancer (using something like [AWS Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/))
- 2 Learning Locker servers (this is where you run the installation command above using something like [AWS EC2](https://aws.amazon.com/ec2/)).
- 2/3 Mongo servers in a replica set (using something like [Atlas](https://www.mongodb.com/cloud/atlas)).
- 1 Redis server (using something like [AWS ElastiCache](https://aws.amazon.com/elasticache/).

This setup ensures a reasonable degree of redundancy in case of failures in some parts. We'd also recommend that you back up your Mongo database quite regularly depending on your own data requirements. If this sounds too costly or challenging, you may wish to consider using [our Software as a Service (SaaS) enterprise solution](https://www.ht2labs.com/learning-locker/). If you require more advice for your setup, please get in touch via [hello@ht2labs.com](mailto:hello@ht2labs.com).
