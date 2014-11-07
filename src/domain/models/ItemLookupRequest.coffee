_ = require 'lodash'
Request = require './Request'
ItemLookupRequestParameters = require './ItemLookupRequestParameters'

class ItemLookupRequest extends Request
  constructor: (apiMeta, credential, now, params) ->
    super(apiMeta, credential, 'ItemLookup', now)
    @member('params', new ItemLookupRequestParameters(params))

  asParams: ->
    _.merge super(), @['params'].validate()

module.exports = ItemLookupRequest


