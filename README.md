node-apa-api
============

Amazon Product Advertising API client

# Goals

Module provides easy access to the Amazon Product Advertising API:

* [REST Request Anatomy](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/AnatomyOfaRESTRequest.html)
* [Request Signatures](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/rest-signature.html)

# Usage

## Models

### APIMeta value object

Represents API access details:

```coffeescript
{APIMeta} = require 'apa-api'
meta = new APIMeta(protocol, endPoint, service, uri, method, version)
```

Where

* protocol - Default to **http**
* endPoint - Default to **webservices.amazon.com**
* service - Default to **AWSECommerceService**
* uri - Default to **/onca/xml**
* method - Default to **GET**
* version - Default to **2011-08-11**

### Credential

Represents API authentication data:

```coffeescript
{Credential} = require 'apa-api'
credential = new Credential(accessKey, secretKey, associateTag)
```

## Service
 
Use this client to the Amazon Product Advertising service.

```coffeescript
{Service} = require 'apa-api'
service = new Service()
```

Service use the following injected members:

* signer - Request signer, default to **RequestSigner**
* client - Default to [request](https://github.com/request/request)

Service provides methods (feature enrichment in progress):

* [itemLookup](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/ItemLookup.html) - itemLookup(params) -
The method checks parameters: mandatory parameters, type checking, defaults (do not send params equal to defaults).

# Usage

Using defaults

```coffeescript
{APIMeta, Crendential, Service} = require 'apa-api'

meta = new APIMeta()
credential = new Credential('access', 'secret', 'associate')
service = new Service(meta, service)
service.itemLookup(ItemId: '0123456789').pipe(output)
```
