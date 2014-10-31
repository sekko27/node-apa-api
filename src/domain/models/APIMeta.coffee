DEFAULT_PROTOCOL = 'http'
DEFAULT_ENDPOINT = 'webservices.amazon.com'
DEFAULT_SERVICE  = 'AWSECommerceService'
DEFAULT_URI      = '/onca/xml'
DEFAULT_METHOD   = 'GET'
DEFAULT_VERSION  = '2011-08-01'

class APIMeta
  constructor: (
    protocol = DEFAULT_PROTOCOL
    endPoint = DEFAULT_ENDPOINT
    service  = DEFAULT_SERVICE
    uri      = DEFAULT_URI
    method   = DEFAULT_METHOD
    version  = DEFAULT_VERSION
  ) ->
    Object.defineProperty @, 'protocol', get: -> protocol
    Object.defineProperty @, 'endPoint', get: -> endPoint
    Object.defineProperty @, 'service', get: -> service
    Object.defineProperty @, 'uri', get: -> uri
    Object.defineProperty @, 'method', get: -> method
    Object.defineProperty @, 'version', get: -> version

module.exports = APIMeta
