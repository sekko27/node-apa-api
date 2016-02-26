_ = require 'lodash'
Request = require './Request'


class ItemLookupRequest extends Request
  constructor: (options) ->
    super(options, params: {})

  asParams: ->
    _.assign {}, super(), @params?.validate()

module.exports = ItemLookupRequest


