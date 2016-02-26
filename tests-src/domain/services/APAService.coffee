_ = require 'lodash'
Helper = require('wire-context-helper').Helper()
APIMeta = require Helper.model('APIMeta')
Credential = require Helper.model('Credential')
Request = require Helper.model('ItemLookupRequest')
Signer = require Helper.service('RequestSigner')
APAService = require Helper.Service('APA')
{parseString} = require 'xml2js'
credentialConfiguration = require Helper.path("configs/test-credentials")

concat = require 'concat-stream'
{assert} = require 'chai'

describe 'APA service', ->
  apa = new APAService(new APIMeta(), new Credential(credentialConfiguration))

  @timeout(20000)

  it 'should returns valid response', (done) ->
    stream = concat (response) ->
      parseString response, (err, result) ->
        return done(err) if err
        assert.equal _.get(result, 'ItemLookupResponse.Items.0.Request.0.IsValid.0'), 'True'
        assert.equal _.get(result, 'ItemLookupResponse.Items.0.Item.0.ASIN.0'), '0124166903'
        done()

    apa.itemLookup(ItemId: '0124166903', VariationPage: 70).pipe(stream)
