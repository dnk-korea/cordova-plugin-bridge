var exec = require('cordova/exec');

exports.bridge = function (fnc,arg, success, error) {
    exec(success, error, 'bridge', fnc, arg);
};
