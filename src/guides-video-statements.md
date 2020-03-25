---
---

# Video Statements

- [User initialized video](#user-initialized-video)
- [User played video](#user-played-video)
- [User paused video](#user-paused-video)
- [User terminated video](#user-paused-video)

The statements shown here are guided by the [xAPI Video Profile](https://liveaspankaj.gitbooks.io/xapi-video-profile/content/statement_data_model.html) created by the [xAPI Video Community of Practice](https://liveaspankaj.gitbooks.io/xapi-video-profile/content/). All times and lengths represented as numbers below should use seconds as the unit.

## User initialized video
An "Initialized" statement is used by the LRP to indicate that the video has been fully initialized or launched/accessed.

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "mbox": "mailto:user@example.org",
    "name": "Example User"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/initialized",
    "display": {
      "en-US": "initialized"
    }
  },
  "object": {
    "objectType": "Activity",
    "id": "http://www.example.org/video/1",
    "definition": {
      "type": "https://w3id.org/xapi/video/activity-type/video",
      "name": {
        "en-US": "Example Video"
      },
      "extensions": {
        "https://w3id.org/xapi/video/extensions/length": 124.3
      }
    }
  },
  "context": {
    "platform": "Brightcove",
    "language": "en",
    "extensions": {
      "https://w3id.org/xapi/video/extensions/session-id": "9a2ce995-c3f5-458a-9fd3-cab07ea005c0"
    }
  }
}
```

## User played video
Indicates that the actor started experiencing the recorded media object.

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "mbox": "mailto:user@example.org",
    "name": "Example User"
  },
  "verb": {
    "id": "https://w3id.org/xapi/video/verbs/played",
    "display": {
      "en-US": "played"
    }
  },
  "object": {
    "objectType": "Activity",
    "id": "http://www.example.org/video/1",
    "definition": {
      "type": "https://w3id.org/xapi/video/activity-type/video",
      "name": {
        "en-US": "Example Video"
      }
    }
  },
  "context": {
    "platform": "Brightcove",
    "language": "en",
    "extensions": {
      "https://w3id.org/xapi/video/extensions/session-id": "9a2ce995-c3f5-458a-9fd3-cab07ea005c0"
    }
  },
  "result": {
    "extensions": {
      "https://w3id.org/xapi/video/extensions/time": 0
    }
  }
}
```

## User paused video
Indicates that the actor temporary or permanently stopped experiencing the recorded media object.

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "mbox": "mailto:user@example.org",
    "name": "Example User"
  },
  "verb": {
    "id": "https://w3id.org/xapi/video/verbs/paused",
    "display": {
      "en-US": "paused"
    }
  },
  "object": {
    "objectType": "Activity",
    "id": "http://www.example.org/video/1",
    "definition": {
      "type": "https://w3id.org/xapi/video/activity-type/video",
      "name": {
        "en-US": "Example Video"
      }
    }
  },
  "context": {
    "platform": "Brightcove",
    "language": "en",
    "extensions": {
      "https://w3id.org/xapi/video/extensions/session-id": "9a2ce995-c3f5-458a-9fd3-cab07ea005c0"
    }
  },
  "result": {
    "extensions": {
      "https://w3id.org/xapi/video/extensions/time": 57.1
    }
  }
}
```

## User terminated video
Used to express that the actor ended a video.

### Metadata
```json
{
  "https://learninglocker&46;net/duration": {
    "seconds": 124.3
  }
}
```

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "mbox": "mailto:user@example.org",
    "name": "Example User"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/terminated",
    "display": {
      "en-US": "terminated"
    }
  },
  "object": {
    "objectType": "Activity",
    "id": "http://www.example.org/video/1",
    "definition": {
      "type": "https://w3id.org/xapi/video/activity-type/video",
      "name": {
        "en-US": "Example Video"
      },
      "extensions": {
        "https://w3id.org/xapi/video/extensions/length": 124.3
      }
    }
  },
  "context": {
    "platform": "Brightcove",
    "language": "en",
    "extensions": {
      "https://w3id.org/xapi/video/extensions/session-id": "9a2ce995-c3f5-458a-9fd3-cab07ea005c0"
    }
  },
  "result": {
    "completion": true,
    "duration": "PT124.3S",
    "extensions": {
      "https://w3id.org/xapi/video/extensions/time": 124.3,
      "https://w3id.org/xapi/video/extensions/progress": 1
    }
  }
}
```
