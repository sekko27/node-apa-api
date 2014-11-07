fs = require 'fs'
Helper = require('wire-context-helper').Helper()
TestHelper = require('wire-context-helper').Helper('tests')
APIMeta = require Helper.model('APIMeta')
Credential = require Helper.model('Credential')
Request = require Helper.model('ItemLookupRequest')
Signer = require Helper.service('RequestSigner')
APAService = require Helper.Service('APA')
{parseString} = require 'xml2js'

concat = require 'concat-stream'
chai = require 'chai'
assert = chai.assert
promised = require 'chai-as-promised'
chai.use promised

describe 'RequestSigner', ->
  apa = null

  before (done) ->
    apiMeta = new APIMeta()
    fs.readFile TestHelper.path('configs/test-credentials.json'), encoding: 'utf8', (err, config) ->
      return done(err) if err
      c = JSON.parse config
      credential = new Credential c.accessKey, c.secretKey, c.associateTag
      apa = new APAService(apiMeta, credential)
      done()

  it 'should returns valid response', (done) ->
    stream = concat (response) ->
      parseString response, (err, result) ->
        return done(err) if err
        assert.equal result.ItemLookupResponse.Items[0].Request[0].IsValid[0], 'True'
        done()

    apa.itemLookup(ItemId: '0124166903').pipe(stream)
