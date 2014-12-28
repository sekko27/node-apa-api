_ = require 'lodash'
ItemLookupRequest = require './ItemLookupRequest'

Operations =
  request: (operation) ->
    result = _.find @values, operation: operation
    throw "Invalid operation: #{operation}" if not result
    result.request

Object.defineProperty Operations, 'values', get: ->
  [
    { operation: 'ItemLookup', request: ItemLookupRequest }
  ]

module.exports = Operations