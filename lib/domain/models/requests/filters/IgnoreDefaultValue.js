const _ = require('lodash');

module.exports = function(defaultValue) {
    return function(value) {
        return value === defaultValue ? Promise.resolve(undefined) : Promise.resolve(value);
    };
};