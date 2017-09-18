---
---

# Monitoring your LRS

## KeyMetrics

If you have installed Learning Locker using the recomended build script, then the application will come pre-installed onto an instance of the execellent [`pm2`](http://pm2.keymetrics.io/) Node Process Management tool.

Whilst this tool can be used to monitor the running processes from within each server running LL (refer to [the documentation](http://pm2.keymetrics.io/docs/usage/monitoring/)), it can also be setup to send performance metrics to the [Key Metrics](http://docs.keymetrics.io/) platform (costs may apply).

## New Relic

The Learning Locker application is configured to send performance metrics to New Relic. Simply fill in the following in the `.env` of your v2 application instance (**note that this is currently unavailable for the xAPI service layer**)

```
#############
# New Relic #
#############

# New Relic License key
NEW_RELIC_LICENSE_KEY=
# APM name for API
NEWRELIC_API_NAME=
# APM name for UI
NEWRELIC_UI_NAME=
```

## Others

Other Node monitoring solutions typically need to be initialised at the entry file of the application.
