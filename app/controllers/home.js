'use strict';

var jobs_model = require('../model/jobs');
var about_model = require('../model/about');
var skills_model = require('../model/skills');

exports.use = function (app) {
    app.get('/', function(req, res, next) {
        var locale = req.headers['cf-ipcountry'] === 'BR' ? 'pt' : 'en';
        req.i18n.setLng(locale);
        jobs_model.getJobs(function(err, jobs){
            about_model.getAbout(function(err, about){
                skills_model.getSkills(function(err, skills){
                    res.render('home', {jobs: jobs, about:about, skills:skills});
                });
            });
        });
    });
};