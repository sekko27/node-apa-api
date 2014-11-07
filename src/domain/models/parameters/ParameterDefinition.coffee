_ = require 'lodash'
ParameterFactory = require './ParameterFactory'
ValueObject = require './../ValueObject'

class ParameterDefinition extends ValueObject
  constructor: (name, defaultValue, required) ->
    @member('name', name)
    @member('defaultValue', defaultValue)
    @member('required', required)

  member: (name, value) ->
    Object.defineProperty @, name,
      get: -> value
      enumerable: true

  parameter: (value) ->
    if _.isUndefined(value)
      throw "Parameter #{@name} is required" if @required
      return ParameterFactory()
    validatedValue = @validate(value)
    return ParameterFactory(undefined) if validatedValue == @defaultValue

  validate: (value) ->
    throw "ParameterDefinition.validate not implemented for #{value}"

module.exports = ParameterDefinition
