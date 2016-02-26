_ = require 'lodash'
Properties = require './Properties'
moment = require 'moment'

class Request extends Properties
  constructor: (options, defaultCustomOptions = {}) ->
    super(
      options,
      _.assign(
        {
          timestamp: moment().format('YYYY-MM-DDTHH:mm:ssZ')
          apiMeta: null
          credential: null
          operation: ''
        }
        defaultCustomOptions
      )
    )

  asParams: ->
    AssociateTag: @credential.associateTag
    AWSAccessKeyId: @credential.accessKey
    Operation: @operation
    Service: @apiMeta.service
    Timestamp: @timestamp
    Version: @apiMeta.version

module.exports = Request

