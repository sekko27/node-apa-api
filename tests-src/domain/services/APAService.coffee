fs = require 'fs'
Helper = require('wire-context-helper').Helper()
TestHelper = require('wire-context-helper').Helper('tests')
APIMeta = require Helper.model('APIMeta')
Credential = require Helper.model('Credential')
Request = require Helper.model('ItemLookupRequest')
Signer = require Helper.service('RequestSigner')
APAService = require Helper.Service('APA')
{parseString} = require 'xml2js'
selectn = require 'selectn'

concat = require 'concat-stream'
chai = require 'chai'
assert = chai.assert
promised = require 'chai-as-promised'
chai.use promised

describe 'APA service', ->
  apa = null

  @timeout(20000)

  before (done) ->
    apiMeta = new APIMeta()
    fs.readFile TestHelper.path('configs/test-credentials.json'), encoding: 'utf8', (err, credentialConfiguration) ->
      return done(err) if err
      credential = new Credential JSON.parse(credentialConfiguration)
      apa = new APAService(apiMeta, credential)
      done()

  it 'should returns valid response', (done) ->
    stream = concat (response) ->
      parseString response, (err, result) ->
        return done(err) if err
        assert.equal selectn('ItemLookupResponse.Items.0.Request.0.IsValid.0', result), 'True'
        assert.equal selectn('ItemLookupResponse.Items.0.Item.0.ASIN.0', result), '0124166903'
        done()

    apa.itemLookup(ItemId: '0124166903', VariationPage: 70).pipe(stream)
