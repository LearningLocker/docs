---
---

# Sales Statements

- [User closed sale with Client](#user-closed-sale-with-client)
- [User generated lead with Client](#user-generated-lead-with-client)
- [User called Client](#user-called-client)

The statements shown here are not currently guided by an existing Profile or Community of Practice. They have been created to define how we should create statements for SalesForce.

## User closed sale with Client
A statement that is used to indicate that the User has closed a sale with a Client.

### Statement

```json
{
  "actor": {
    "objectType": "Agent",
    "mbox": "mailto:user@example.org",
    "name": "Example User"
  },
  "verb": {
    "id": "http://id.tincanapi.com/verb/closed-sale",
    "display": {
      "en-US": "closed a sale with"
    }
  },
  "object": {
    "objectType": "Group",
    "name": "Example Client Name",
    "account": {
      "homePage": "https://learningpool.force.com/client",
      "name": "Example-Client-Account-ID"
    }
  },
  "context": {
    "platform": "SalesForce",
    "language": "en"
  }
}
```

## User generated lead with Client
A statement that is used to indicate that the User has genereated a lead with a Client.

### Statement

```json
{
  "actor": {
    "objectType": "Agent",
    "mbox": "mailto:user@example.org",
    "name": "Example User"
  },
  "verb": {
    "id": "https://w3id.org/xapi/dod-isd/verbs/generated",
    "display": {
      "en-US": "generated a lead with"
    }
  },
  "object": {
    "objectType": "Group",
    "name": "Example Client Name",
    "account": {
      "homePage": "https://learningpool.force.com/client",
      "name": "Example-Client-Account-ID"
    }
  },
  "context": {
    "platform": "SalesForce",
    "language": "en"
  }
}
```


## User called Client
A statement that is used to indicate that the User has called a Client.

### Statement

```json
{
  "actor": {
    "objectType": "Agent",
    "mbox": "mailto:user@example.org",
    "name": "Example User"
  },
  "verb": {
    "id": "http://id.tincanapi.com/verb/called",
    "display": {
      "en-US": "called"
    }
  },
  "object": {
    "objectType": "Group",
    "name": "Example Client Name",
    "account": {
      "homePage": "https://learningpool.force.com/client",
      "name": "Example-Client-Account-ID"
    }
  },
  "context": {
    "platform": "SalesForce",
    "language": "en"
  }
}
```
