ValueObject = require './ValueObject'
moment = require 'moment'

class Request extends ValueObject
  constructor: (apiMeta, credential, operation, now) ->
    now = now ? moment().format('YYYY-MM-DDTHH:mm:ssZ')
    @member('apiMeta', apiMeta)
    @member('credential', credential)
    @member('operation', operation)
    @member('timestamp', now)

  asParams: ->
    AssociateTag: @credential.associateTag
    AWSAccessKeyId: @credential.accessKey
    Operation: @operation
    Service: @apiMeta.service
    Timestamp: @timestamp
    Version: @apiMeta.version



module.exports = Request

