Properties = require './Properties'

class APIMeta extends Properties
  constructor: (options = {}) ->
    return new APIMeta(options) if not @

    super(
      options,
      {
        protocol: 'http'
        endPoint: 'webservices.amazon.com'
        service: 'AWSECommerceService'
        uri: '/onca/xml'
        method: 'GET'
        version: '2011-08-01'
      }
    )

module.exports = APIMeta
