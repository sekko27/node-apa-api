RequestSigner = require './RequestSigner'
RequestFactory = require './../models/RequestFactory'
Operations = require './../models/Operations'
defaultClient = require 'request'

DEFAULT_SIGNER = new RequestSigner()

class APAService
  constructor: (apiMeta, credential, @signer = DEFAULT_SIGNER, @client = defaultClient) ->
    @requestFactory = new RequestFactory(apiMeta, credential)

  itemLookup: (params) ->
    @request @requestFactory.newInstance Operations.ITEM_LOOKUP, params

  request: (request) ->
    signedUrl = @signer.sign(request)
    @client(signedUrl)

module.exports = APAService
