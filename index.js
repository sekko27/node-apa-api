// Generated by CoffeeScript 1.10.0
(function() {
  var Helper;

  Helper = require('wire-context-helper').Helper();

  module.exports = {
    Service: require(Helper.Service('APA')),
    APIMeta: require(Helper.model('APIMeta')),
    Credential: require(Helper.model('Credential')),
    DefaultSigner: require(Helper.service('RequestSigner'))
  };

}).call(this);
