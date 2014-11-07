ValueObject = require './../ValueObject'

cache = {}

class Parameter extends ValueObject
  constructor: (value) ->
    @member('value', value)

NONE = new Parameter(undefined)

module.exports = (value) ->
  return NONE if not value
  if not cache[value]
    cache[value] = new Parameter(value)
  cache[value]

