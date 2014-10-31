_ = require 'lodash'
Request = require './Request'

class ItemLookupRequest extends Request
  constructor: (apiMeta, credential, itemId) ->
    super(apiMeta, credential, 'ItemLookup')
    Object.defineProperty @, 'itemId', get: -> itemId

  asParams: ->
    _.merge super(),
      ItemId: @itemId

module.exports = ItemLookupRequest
