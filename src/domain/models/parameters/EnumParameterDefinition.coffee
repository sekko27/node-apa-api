_ = require 'lodash'
ParameterFactory = require './ParameterFactory'
ParameterDefinition = require './ParameterDefinition'

class EnumParameterDefinition extends ParameterDefinition
  constructor: (name, defaultValue, values, required = false) ->
    super(name, defaultValue, required)
    @member('values', values)

  validate: (value) ->
    if 0 > _.indexOf(@values, value)
      throw new Error("Invalid parameter value for #{@name} enumeration parameter: #{value}")
    value

module.exports = EnumParameterDefinition
