const _ = require('lodash');

module.exports = function(min, max) {
    return function(value) {
        return min <= value && value <= max ? Promise.resolve(value) : Promise.reject(`Value out of range: ${value} - [${min}, {$max}]`);
    };
};