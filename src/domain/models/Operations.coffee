_ = require 'lodash'
ItemLookupRequest = require './ItemLookupRequest'
ItemLookupRequestParameters = require './ItemLookupRequestParameters'

Operations =
  ITEM_LOOKUP: 'ItemLookup'

  request: (operation) ->
    result = _.find @values, operation: operation
    throw "Invalid operation: #{operation}" if not result
    result

  values:   [
    { operation: 'ItemLookup', requestClass: ItemLookupRequest, parametersClass: ItemLookupRequestParameters }
  ]

module.exports = Operations