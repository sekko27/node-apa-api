ItemLookupRequest = require './../models/ItemLookupRequest'
request = require 'request'

class APAService
  signer: null

  constructor: (apiMeta, credential) ->
    Object.defineProperty @, 'apiMeta', get: -> apiMeta
    Object.defineProperty @, 'credential', get: -> credential

  itemLookup: (itemId) ->
    request = new ItemLookupRequest(@apiMeta, @credential, itemId)
    @request(request)

  request: (request) ->
    signedUrl = @signer.sign(request)
    request.get(signedUrl)

module.exports = APAService
