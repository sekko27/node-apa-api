_ = require 'lodash'
Request = require './Request'

class ItemLookupRequest extends Request
  constructor: (apiMeta, credential, itemId, now) ->
    super(apiMeta, credential, 'ItemLookup', now)
    Object.defineProperty @, 'itemId', get: -> itemId

  asParams: ->
    _.merge super(),
      ItemId: @itemId

module.exports = ItemLookupRequest
