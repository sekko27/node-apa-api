const _ = require('lodash');

module.exports = function(value) {
    return _.isString(value) ? Promise.resolve(value) : Promise.reject(`String value expected: ${value}`);
};