_ = require 'lodash'
URI = require 'URIjs'
crypto = require 'crypto'

class RequestSigner
  sign: (request) ->
    params = request.asParams()
    normalized = normalize(params)
    queryStringBase = prefix(request.apiMeta).concat(normalized).join('\n')
    signature = digest(queryStringBase, request.credential)
    "#{queryStringBase}&Signature=#{signature}"

##################
# PRIVATE
##################
normalize = (params) ->
  encoded = _.map params, (value, key) ->
    [escape(key), escape(value)].join('=')
  encoded.sort().join('&')

prefix = (apiMeta) ->
  [
    apiMeta.method
    apiMeta.endPoint
    apiMeta.uri
  ]

escape = (value) ->
  URI.encode(value)

digest = (source, credential) ->
  hmac = crypto.createHmac('sha256', credential.secretKey)
  hmac.update(source)
  escape hmac.digest('base64')