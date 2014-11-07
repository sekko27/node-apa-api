_ = require 'lodash'
Request = require './Request'
ItemLookupRequestParameters = require './ItemLookupRequestParameters'

class ItemLookupRequest extends Request
  constructor: (apiMeta, credential, params, now) ->
    super(apiMeta, credential, 'ItemLookup', now)
    @member('params', new ItemLookupRequestParameters(params))

  asParams: ->
    _.merge super(), @['params'].validate()

module.exports = ItemLookupRequest


