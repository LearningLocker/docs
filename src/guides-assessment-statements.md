---
---

# Assessment Statements

- [User completed Assessment](#user-completed-assessment)
- [User answered True/False Question](#user-answered-true-false-question)
- [User answered Numeric Question](#user-answered-numeric-question)
- [User answered Fill-In Question](#user-answered-fill-in-question)
- [User answered Choice Question](#user-answered-choice-question)
- [User answered Sequencing Question](#user-answered-sequencing-question)
- [User answered Likert Question](#user-answered-likert-question)
- [User answered Matching Question](#user-answered-matching-question)

## User completed Assessment

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "mbox": "mailto:user@example.org",
    "name": "Example User"
  },
  "verb": {
      "id": "http://adlnet.gov/expapi/verbs/completed",
      "display": {
        "en-US": "completed"
      }
  },
  "object": {
    "objectType": "Activity",
    "id": "http://www.example.org/quiz/1",
    "definition": {
      "type": "http://adlnet.gov/expapi/activities/assessment",
      "name": {
        "en-US": "Example Assessment"
      }
    }
  },
  "result": {
    "completion": true,
    "success": true,
    "score": {
      "scaled": 1.0,
      "raw": 7,
      "min": 0,
      "max": 7
    },
    "duration": "PT0H5M2S"
  }
}
```

## User answered True False Question

### Metadata
```json
{
  "https://learninglocker&46;net/true-false-response": "Yes"
}
```

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "name": "Example User",
    "mbox": "mailto:user@example.org"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/answered",
    "display": {
      "en": "answered"
    }
  },
  "object": {
    "objectType": "Activity",
    "id": "http://www.example.org/quiz/1/question/1",
    "definition": {
      "name": {"en":"Is 1 + 1 = 2?"},
      "type": "http://adlnet.gov/expapi/activities/cmi.interaction",
      "interactionType": "true-false",
      "correctResponsesPattern": ["Yes"]
    }
  },
  "result": {
    "success": true,
    "response": "Yes"
  }
}
```

## User answered Numeric Question

### Metadata
```json
{
  "https://learninglocker&46;net/numeric-response": 2
}
```

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "name": "Example User",
    "mbox": "mailto:user@example.org"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/answered",
    "display": {
      "en": "answered"
    }
  },
  "object": {
    "id": "http://www.example.org/quiz/1/question/2",
    "objectType": "Activity",
    "definition": {
      "name": {"en": "What is 1 + 1?"},
      "type": "http://adlnet.gov/expapi/activities/cmi.interaction",
      "interactionType": "numeric",
      "correctResponsesPattern": ["2"]
    }
  },
  "result": {
    "success": true,
    "response": "2"
  }
}
```

## User answered Fill-In Question

### Metadata
No Metadata

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "name": "Example User",
    "mbox": "mailto:user@example.org"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/answered",
    "display": {
      "en": "answered"
    }
  },
  "object": {
    "id": "http://www.example.org/quiz/1/question/3",
    "objectType": "Activity",
    "definition": {
      "name": {"en": "What is Ben often heard saying?"},
      "type": "http://adlnet.gov/expapi/activities/cmi.interaction",
      "interactionType": "fill-in",
      "correctResponsesPattern": ["Bob’s your uncle"]
    }
  },
  "result": {
    "success": true,
    "response": "Bob's your uncle"
  }
}
```

## User answered Choice Question

### Metadata
```json
{
  "https://learninglocker&46;net/choice-response": [
    "hedgehog",
    "shark"
  ]
}
```

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "name": "Example User",
    "mbox": "mailto:user@example.org"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/answered",
    "display": {
      "en": "answered"
    }
  },
  "object": {
    "id": "http://www.example.org/quiz/1/question/4",
    "objectType": "Activity",
    "definition": {
      "name": {"en": "Which of these animals have a spine?"},
      "type": "http://adlnet.gov/expapi/activities/cmi.interaction",
      "interactionType": "choice",
      "correctResponsesPattern": ["hedgehog[,]shark"],
      "choices": [
        {"id": "hedgehog", "description": {"en": "Hedgehog"}},
        {"id": "shark", "description": {"en": "Shark"}},
        {"id": "octopus", "description": {"en": "Octopus"}}
      ]
    }
  },
  "result": {
    "success": true,
    "response": "hedgehog[,]shark"
  }
}
```

## User answered Sequencing Question

### Metadata
```json
{
  "https://learninglocker&46;net/sequencing-response": [
    "12",
    "234",
    "4561"
  ]
}
```

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "name": "Example User",
    "mbox": "mailto:user@example.org"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/answered",
    "display": {
      "en": "answered"
    }
  },
  "object": {
    "id": "http://www.example.org/quiz/1/question/5",
    "objectType": "Activity",
    "definition": {
      "name": {"en": "Order these numbers from lowest to highest?"},
      "type": "http://adlnet.gov/expapi/activities/cmi.interaction",
      "interactionType": "sequencing",
      "correctResponsesPattern": ["12[,]234[,]4561"],
      "choices": [
        {"id": "234", "description": {"en": "Two hundred and thirty four"}},
        {"id": "12", "description": {"en": "Twelve"}},
        {"id": "4561", "description": {"en": "Four thousand, five hundred and sixty one"}}
      ]
    }
  },
  "result": {
    "success": true,
    "response": "12[,]234[,]4561"
  }
}
```

## User answered Likert Question

### Metadata
```json
{
  "https://learninglocker&46;net/likert-response": "likert_3"
}
```

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "name": "Example User",
    "mbox": "mailto:user@example.org"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/answered",
    "display": {
      "en": "answered"
    }
  },
  "object": {
    "id": "http://www.example.org/quiz/1/question/6",
    "objectType": "Activity",
    "definition": {
      "name": {"en": "How awesome is xAPI?"},
      "type": "http://adlnet.gov/expapi/activities/cmi.interaction",
      "interactionType": "likert",
      "correctResponsesPattern": ["likert_3"],
      "scale": [
        {"id": "likert_0", "description": {"en": "It’s OK"}},
        {"id": "likert_1", "description": {"en": "It’s Pretty Cool"}},
        {"id": "likert_2", "description": {"en": "It’s Damn Cool"}},
        {"id": "likert_3", "description": {"en": "It’s Gonna Change the World"}}
      ]
    }
  },
  "result": {
    "success": true,
    "response": "likert_3"
  }
}
```

## User answered Matching Question

### Metadata
```json
{
  "https://learninglocker&46;net/matching-response": [
    ["apple", "fruit"],
    ["cheese", "dairy"],
    ["chicken", "meat"]
  ]
}
```

### Statement
```json
{
  "actor": {
    "objectType": "Agent",
    "name": "Example User",
    "mbox": "mailto:user@example.org"
  },
  "verb": {
    "id": "http://adlnet.gov/expapi/verbs/answered",
    "display": {
      "en": "answered"
    }
  },
  "object": {
    "id": "http://www.example.org/quiz/1/question/7",
    "objectType": "Activity",
    "definition":{
      "name":{"en":"Match these foods to their food group"},
      "type":"http://adlnet.gov/expapi/activities/cmi.interaction",
      "interactionType":"matching",
      "correctResponsesPattern":[
        "apple[.]fruit[,]cheese[.]dairy[,]chicken[.]meat"
      ],
      "source":[
        {
          "id":"apple",
          "description":{"en":"Apple"}
        },
        {
          "id":"cheese",
          "description":{"en":"Cheese"}
        },
        {
          "id":"chicken",
          "description":{"en":"Chicken"}
        }
      ],
      "target":[
        {
          "id":"fruit",
          "description":{"en":"Fruit"}
        },
        {
          "id":"dairy",
          "description":{"en":"Dairy"}
        },
        {
          "id":"meat",
          "description":{"en":"Meat"}
        }
      ]
    }
  },
  "result": {
    "success": true,
    "response": "apple[.]fruit[,]cheese[.]dairy[,]chicken[.]meat"
  }
}
```
