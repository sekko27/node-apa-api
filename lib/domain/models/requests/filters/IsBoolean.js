const _ = require('lodash');

module.exports = function(value) {
    return _.isBoolean(value) ? Promise.resolve(value) : Promise.reject(`Boolean value expected: ${value}`);
};