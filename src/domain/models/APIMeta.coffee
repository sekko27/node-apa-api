ValueObject = require './ValueObject'

DEFAULT_PROTOCOL = 'http'
DEFAULT_ENDPOINT = 'webservices.amazon.com'
DEFAULT_SERVICE  = 'AWSECommerceService'
DEFAULT_URI      = '/onca/xml'
DEFAULT_METHOD   = 'GET'
DEFAULT_VERSION  = '2011-08-01'

class APIMeta extends ValueObject
  constructor: (
    protocol = DEFAULT_PROTOCOL
    endPoint = DEFAULT_ENDPOINT
    service  = DEFAULT_SERVICE
    uri      = DEFAULT_URI
    method   = DEFAULT_METHOD
    version  = DEFAULT_VERSION
  ) ->
    @member 'protocol', protocol
    @member 'endPoint', endPoint
    @member 'service', service
    @member 'uri', uri
    @member 'method', method
    @member 'version', version

module.exports = APIMeta
