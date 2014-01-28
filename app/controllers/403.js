'use strict';

exports.use = function (app) {
    app.get('/403', function(req, res, next) {
        var err = new Error('not allowed!');
            err.status = 403;
        next(err);
    });
};