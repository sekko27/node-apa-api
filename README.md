node-apa-api
============

Amazon Product Advertising API client

# Goals

Module provides easy access to the Amazon Product Advertising API:

* [REST Request Anatomy](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/AnatomyOfaRESTRequest.html)
* [Request Signatures](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/rest-signature.html)

# Usage

## Models

### APIMeta properties

Represents API connection details:

```coffeescript
{APIMeta} = require 'apa-api'

# Default options, you can skip it
options = {
    protocol: 'http'
    endPoint: 'webservices.amazon.com'
    service: 'AWSECommerceService'
    uri: '/onca/xml'
    method: 'GET'
    version: '2011-08-01'
}
meta = new APIMeta(options)

```

### Credential

Represents API authentication data (AWS access/secret):

```coffeescript
{Credential} = require 'apa-api'
options = {
    accessKey: "Your AWS access key",
    secretKey: "Your AWS secret key",
    associateTag: "Associate tag"
}
credential = new Credential(options)
```

## Service
 
Use this client to the Amazon Product Advertising service.

```coffeescript
{Service, ApiMeta, Credential} = require 'apa-api'
connectionDetails = {} # See above
credentialDetails = {} # See above

service = new Service(new ApiMeta(connectionDetails), new Credentials(credentialDetails), [signer], [client])
```

Service use the following optional members:

* signer - Request signer, default to **RequestSigner**
* client - Default to [request](https://github.com/request/request)

Service provides methods (feature enrichment in progress):

* [itemLookup](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/ItemLookup.html) - itemLookup(params) -
The method checks parameters: mandatory parameters, type checking, defaults (do not send params equal to defaults).

# Usage

Using defaults

```coffeescript
async = require 'async'
concat = require 'concat-stream'
{Service, ApiMeta, Credential} = require 'apa-api'

service = new Service(new ApiMeta(), new Credentials())
itemIds = ['0123456789', '1234567890', '2345678901', ...]
async.mapLimit itemIds, 5, (itemId, callback) -> 
    service.itemLookup(itemId: itemId)
        .on 'error', callback
        .pipe concat (response) ->
            # Response can contain error has been described in xml
            # We ignore this validation in this example
            callback(null, response)
```
