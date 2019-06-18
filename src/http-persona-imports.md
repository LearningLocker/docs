---
---

# Persona Imports HTTP Interface

Represents a CSV import (typically from a HR system) containing [persona](../http-personas) [identifiers](../http-persona-identifiers) and their [attributes](../http-persona-attributes).

It is accessible through the following HTTP interfaces:

- [Connection HTTP Interface](../http-connection) via http://www.example.org/api/connection/personasImport.
- [REST HTTP Interface](../http-rest) via http://www.example.org/api/v2/personasImport.

To import a CSV via the API, you need to make the three requests below in order.

1. Create the persona import model via the [REST HTTP Interface](../http-rest) (http://www.example.org/api/v2/personasImport).
2. Upload the CSV via the [Upload HTTP interface](#upload-http-interface).
3. Process the persona import model via the [Process HTTP interface](#process-http-interface).

### Schema

Name | Description
--- | ---
_id | The id of this persona import model.
organisation | The id of the [organisation](../http-organisations) this persona import belongs to.
owner | The id of the [user](../http-users) that created the persona import.
title | The title of this persona import.
csvHeaders | An array of the header names from the CSV.
structure | The [structure](#structure) of the CSV.
importedAt | The date and time that the persona import was imported.
csvHandle | The location of the CSV file in the storage provider.
csvErrorHandle | The location of the CSV file with its errors in the storage provider.
totalCount | Total number of data rows in the CSV.
processedCount | Total number of processed data rows in the CSV.
importErrors | An array of the errors in the CSV.
result | The result of the import in terms of personas created and merged.

### Example

```json
{
  "_id" : "59c1219936229d4ce9634601",
  "organisation" : "59c1219936229d4ce9634602",
  "owner": "59c1219936229d4ce9634603",
  "title": "Example Persona Import",
  "csvHeaders": ["Full Name", "Moodle User ID", "Moodle Home Page", "Age"],
  "structure": {
    "Full Name": {
      "columnName": "Full Name",
      "columnType": "COLUMN_NAME",
      "relatedColumn": "",
      "primary": null
    },
    "Moodle User ID": {
      "columnName": "Moodle User ID",
      "columnType": "COLUMN_ACCOUNT_VALUE",
      "relatedColumn": "Moodle Home Page",
      "primary": null
    },
    "Moodle Home Page": {
      "columnName": "Moodle Home Page",
      "columnType": "COLUMN_ACCOUNT_KEY",
      "relatedColumn": "Moodle User ID",
      "primary": 1
    },
    "Age": {
      "columnName": "Age",
      "columnType": "COLUMN_ATTRIBUTE_DATA",
      "relatedColumn": "",
      "primary": null
    }
  }
}
```

# Structure

Defines the structure of the CSV and how it should be parsed. The structure property is stored as an object where the keys are the CSV column names and the values are objects that define the column structure (value object schema defined below).

### Schema

Name | Description
--- | ---
columnName | The name of the column in the CSV (CSV header).
[columnType](#column-types) | The type of the column or how it should be parsed.
relatedColumn | For account names this is the account home page column, for account home pages this is the account name column.
primary | Defines the order in which identifiers should be used.

# Column Types

Column Type | Description
--- | ---
COLUMN_NAME | Persona name.
COLUMN_ACCOUNT_KEY | Persona identifier account home page.
COLUMN_ACCOUNT_VALUE | Persona identifier account name.
COLUMN_ATTRIBUTE_DATA | Persona attribute value.
COLUMN_MBOX | Persona identifier mbox.
COLUMN_MBOXSHA1SUM | Persona identifier mbox_sha1sum.
COLUMN_OPENID | Persona identifier openid.

# Upload HTTP Interface
This interface uploads the CSV for the persona import model. Requests to this interface should look something like the request below.

```http
POST http://www.example.org/api/uploadpersonas
Authorization: YOUR_BASIC_AUTH
Content-Type: multipart/form-data; boundary=YOUR_FORM_BOUNDARY
Content-Length: YOUR_CONTENT_LENGTH

--YOUR_FORM_BOUNDARY
Content-Disposition form-data; name="id"
Content-Length: YOUR_PERSONA_IMPORT_MODEL_ID_LENGTH

YOUR_PERSONA_IMPORT_MODEL_ID

--YOUR_FORM_BOUNDARY
Content-Disposition form-data; name="file"; filename="import.csv"
Content-Length: YOUR_CSV_CONTENT_LENGTH
Content-Type: text/csv

YOUR_CSV_CONTENT

--YOUR_FORM_BOUNDARY--
```

The interface will respond with a 200 response code when the CSV is successfully uploaded.

# Process HTTP Interface
This interface starts the processing of the persona import. Requests to this interface should look something like the request below.

```http
POST http://www.example.org/api/importpersonas
Authorization: YOUR_BASIC_AUTH
Content-Type: application/json; charset=utf-8

{
  "id": "YOUR_PERSONA_IMPORT_MODEL_ID"
}
```

The interface will respond with a 200 response code, processing of the persona import will start shortly after the response is received.
