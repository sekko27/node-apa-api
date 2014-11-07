Operations = require './Operations'
moment = require 'moment'

class RequestFactory
  apiMeta: null
  credential: null
  timestampFactory: ->
    moment().format('YYYY-MM-DDTHH:mm:ssZ')

  newInstance: (operation, params) ->
    RequestClass = Operations.request(operation)
    new RequestClass(@apiMeta, @credential, @timestampFactory(), params)

module.exports = RequestFactory
