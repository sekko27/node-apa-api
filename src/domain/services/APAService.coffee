RequestSigner = require './RequestSigner'
ItemLookupRequest = require './../models/ItemLookupRequest'
defaultClient = require 'request'

class APAService
  signer: new RequestSigner()
  client: defaultClient

  constructor: (apiMeta, credential) ->
    Object.defineProperty @, 'apiMeta', get: -> apiMeta
    Object.defineProperty @, 'credential', get: -> credential

  itemLookup: (params) ->
    request = new ItemLookupRequest(@apiMeta, @credential, params)
    @request(request)

  request: (request) ->
    signedUrl = @signer.sign(request)
    @client(signedUrl)

module.exports = APAService
