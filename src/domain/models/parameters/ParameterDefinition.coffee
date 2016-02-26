_ = require 'lodash'
ParameterFactory = require './ParameterFactory'

class ParameterDefinition
  constructor: (@name, @defaultValue, @required) ->

  parameter: (value) ->
    if _.isUndefined(value)
      throw new Error("Parameter #{@name} is required") if @required
      return ParameterFactory()
    validatedValue = @validate(value)
    return ParameterFactory(undefined) if validatedValue == @defaultValue
    ParameterFactory(validatedValue)

  validate: (value) ->
    throw new Error("ParameterDefinition.validate not implemented for #{value}")

module.exports = ParameterDefinition
