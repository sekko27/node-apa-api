RequestSigner = require './RequestSigner'
RequestFactory = require './../models/RequestFactory'
Operations = require './../models/Operations'
defaultClient = require 'request'

class APAService
  signer: new RequestSigner()
  client: defaultClient

  constructor: (apiMeta, credential) ->
    @requestFactory = new RequestFactory(apiMeta, credential)
    Object.freeze(@)

  itemLookup: (params) ->
    @request @requestFactory.newInstance Operations.ITEM_LOOKUP, params

  request: (request) ->
    signedUrl = @signer.sign(request)
    @client(signedUrl)

module.exports = APAService
