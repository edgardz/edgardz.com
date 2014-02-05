'use strict';

var jobs_model = require('../model/jobs');
var about_model = require('../model/about');
var skills_model = require('../model/skills');

exports.use = function (app) {
    app.get('/', function(req, res, next) {
        req.i18n.setLng(req.headers['cf-ipcountry'] === 'BR' ? 'pt' : 'en');
        jobs_model.getJobs(function(err, jobs){
            about_model.getAbout(function(err, about){
                skills_model.getSkills(function(err, skills){
                    res.render('home', {jobs: jobs, about:about, skills:skills});
                });
            });
        });
    });
};