const _ = require('lodash');

module.exports = function(defaultValue) {
    return function(value) {
        return Promise.resolve(_.isUndefined(value) ? defaultValue : value);
    };
};