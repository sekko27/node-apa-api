RequestSigner = require './RequestSigner'
ItemLookupRequest = require './../models/ItemLookupRequest'
defaultClient = require 'request'

class APAService
  signer: new RequestSigner()
  client: defaultClient

  constructor: (apiMeta, credential) ->
    Object.defineProperty @, 'apiMeta', get: -> apiMeta
    Object.defineProperty @, 'credential', get: -> credential

  itemLookup: (itemId) ->
    request = new ItemLookupRequest(@apiMeta, @credential, itemId)
    @request(request)

  request: (request) ->
    signedUrl = @signer.sign(request)
    @client(signedUrl)

module.exports = APAService
