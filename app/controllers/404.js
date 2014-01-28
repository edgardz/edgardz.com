'use strict';

exports.use = function (app) {
    app.get('/404', function(req, res, next) {
        next();
    });
};