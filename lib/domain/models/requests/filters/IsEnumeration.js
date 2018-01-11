const _ = require('lodash');

module.exports = function(values) {
    return function(value) {
        return _.indexOf(values, value) > -1
            ? Promise.resolve(value)
            : Promise.reject(`${value} is not a member of (${values.join(',')})`);
    };
};