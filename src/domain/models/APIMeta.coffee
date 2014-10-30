class APIMeta
  constructor: (protocol, endPoint, service, uri, method, version) ->
    Object.defineProperty @, 'protocol', get: -> protocol
    Object.defineProperty @, 'endPoint', get: -> endPoint
    Object.defineProperty @, 'service', get: -> service
    Object.defineProperty @, 'uri', get: -> uri
    Object.defineProperty @, 'method', get: -> method
    Object.defineProperty @, 'version', get: -> version

module.exports = APIMeta
