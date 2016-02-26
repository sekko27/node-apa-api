_ = require 'lodash'
Operations = require './Operations'
moment = require 'moment'

class RequestFactory
  #Inject apiMeta: null
  #Inject credential: null
  constructor: (@apiMeta, @credential) ->
    Object.freeze(@)

  timestampFactory: ->
    moment().format('YYYY-MM-DDTHH:mm:ssZ')

  newInstance: (operation, params = {}, options = {}) ->
    operationRequest = Operations.request(operation)
    RequestClass = operationRequest.requestClass
    RequestParameterClass = operationRequest.parametersClass
    new RequestClass(_.assign {}, options, {
      apiMeta: @apiMeta
      credential: @credential
      operation: operation
      params: new RequestParameterClass(params)
    })

module.exports = RequestFactory
