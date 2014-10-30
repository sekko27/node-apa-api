moment = require 'moment'

class Request
  constructor: (apiMeta, credential, operation) ->
    now = moment().format('Z')
    Object.defineProperty @, 'apiMeta', get: -> apiMeta
    Object.defineProperty @, 'credential', get: -> credential
    Object.defineProperty @, 'operation', get: -> operation
    Object.defineProperty @, 'timestamp', get: -> now

  asParams: ->
    AssociateTag: @credential.associateTag
    AWSAccessKeyId: @credential.accessKey
    Operation: @operation
    Service: @apiMeta.service
    Timestamp: @timestamp
    Version: @apiMeta.Version



module.exports = Request

