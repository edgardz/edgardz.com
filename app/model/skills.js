'use strict';

var skills = [
    {
        name: 'PHP',
        score: 0
    },
    {
        name: 'Python',
        score: 0
    },
    {
        name: 'C#',
        score: 0
    },
    {
        name: 'MySQL',
        score: 0
    },
    {
        name: 'Redis',
        score: 0
    },
    {
        name: 'Solr',
        score: 0
    },
    {
        name: 'Apache',
        score: 0
    },
    {
        name: 'Nginx',
        score: 0
    },
    {
        name: 'Node.js',
        score: 0
    },
    {
        name: 'Amazon (AWS)',
        score: 0
    },
    {
        name: 'Linux',
        score: 0
    },
    {
        name: 'Git',
        score: 0
    },
    {
        name: 'JavaScript',
        score: 0
    },
    {
        name: 'Grunt, Gulp',
        score: 0
    },
    {
        name: 'HTTP (REST)',
        score: 0
    },
    {
        name: 'HTML5',
        score: 0
    },
    {
        name: 'CSS3',
        score: 0
    },
    {
        name: 'LESS, SASS',
        score: 0
    },
    {
        name: 'Smarty',
        score: 0
    },
    {
        name: 'Jade',
        score: 0
    },
    {
        name: 'Objective-C',
        score: 0
    },
    {
        name: 'Titanium',
        score: 0
    },
    {
        name: 'WebGL',
        score: 0
    },
    {
        name: 'Unity3d',
        score: 0
    },
    {
        name: 'Photoshop',
        score: 0
    },
    {
        name: '3dsmax',
        score: 0
    },
    {
        name: 'After Effects',
        score: 0
    },
    {
        name: 'Flash',
        score: 0
    }
];

exports.getSkills = function (callback) {
  return callback(null, skills);
};