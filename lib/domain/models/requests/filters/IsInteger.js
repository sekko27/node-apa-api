const _ = require('lodash');

module.exports = function(value) {
    return _.isInteger(value) ? Promise.resolve(value) : Promise.reject(`Integer value expected: ${value}`);
};