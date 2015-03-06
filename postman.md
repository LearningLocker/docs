---
---

# [Postman](https://www.getpostman.com)
Below are some of the [Postman Collections](https://www.getpostman.com/docs/collections) we use internally to test and demonstrate Learning Locker's APIs.

- [data/xAPI/statements](https://www.getpostman.com/collections/7a3452d868013026fef6)
- [data/xAPI/activities](https://www.getpostman.com/collections/680c14a7e5fcd028ae7f)
- [data/xAPI/activities/state](https://www.getpostman.com/collections/c6307884d177fbc684e6)
- [data/xAPI/agents](https://www.getpostman.com/collections/8f1ed1a786c2c61bf087)
- [api/v1/exports](https://www.getpostman.com/collections/66623276d9f0c88b06dd)
- [api/v1/reports](https://www.getpostman.com/collections/c6632fc8938c418492be)

> You can import a collection file. Click on the 'Import' button on the top bar, and paste a URL (use the links above) to the collection, or the collection JSON itself, and click 'Import'.

## Environment
We recommend that you use a [Postman Environment](https://www.getpostman.com/docs/environments) to utilise our collections. Each of your environments need the variables below.

- auth
- version
- baseUrl
- iri
- mbox

To get started please create a new Postman Enviroment, then modify your environment and select "Bulk edit". Once inside the bulk edit you can copy the code below and paste it into Postman. Please change `YOUR_AUTH` to your [base 64 encoded](https://www.base64encode.org/) [basic auth details](http://docs.learninglocker.net/statements/#basic-auth) (which can be found under "xAPI Statements" on the left, inside an LRS on Learning Locker), and `YOUR_ENDPOINT` to your endpoint (i.e. "localhost/learninglocker/public").

    auth: YOUR_AUTH
    version: 1.0.1
    baseUrl: YOUR_ENDPOINT
    iri: http://www.example.com
    mbox: mailto:ex@mple.com
