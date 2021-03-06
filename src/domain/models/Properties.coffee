_ = require 'lodash'

class Properties
  constructor: (options, defaultOptions) ->
    strictOptions = _.pick options, _.keys(defaultOptions)
    _.assign @, defaultOptions, strictOptions

module.exports = Properties
