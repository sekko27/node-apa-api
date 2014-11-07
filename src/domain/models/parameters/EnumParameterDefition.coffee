_ = require 'lodash'
ParameterFactory = require './ParameterFactory'
ParameterDefinition = require './ParameterDefinition'

class EnumParameterDefition extends ParameterDefinition
  constructor: (name, defaultValue, values, required = false) ->
    super(name, defaultValue, required)
    @member('values', values)

  validate: (value) ->
    throw "Invalid parameter value for #{@name} enumeration parameter: #{value}" if not _.indexOf @values, value
    value

module.exports = EnumParameterDefition
