_ = require 'lodash'
ParameterFactory = require './ParameterFactory'
ParameterDefinition = require './ParameterDefinition'

class EnumParameterDefition extends ParameterDefinition
  constructor: (name, defaultValue, values, required = false) ->
    super(name, defaultValue, required)
    @member('values', values)

  validate: (value) ->
    if -1 == _.indexOf(@values, value)
      throw new Error("Invalid parameter value for #{@name} enumeration parameter: #{value}")
    value

module.exports = EnumParameterDefition
