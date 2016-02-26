_ = require 'lodash'
ItemLookupRequest = require './ItemLookupRequest'
ItemLookupRequestParameters = require './ItemLookupRequestParameters'

Operations =
  request: (operation) ->
    result = _.find @values, operation: operation
    throw "Invalid operation: #{operation}" if not result
    result

# Define operation constants
Object.defineProperty(Operations, 'ITEM_LOOKUP', value: 'ItemLookup')

# Define lookup by operation (request and request parameter types)
Object.defineProperty(Operations, 'values', value: [
      { operation: Operations.ITEM_LOOKUP, requestClass: ItemLookupRequest, parametersClass: ItemLookupRequestParameters }
    ]
)

Object.freeze(Operations)

module.exports = Operations