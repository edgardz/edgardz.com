'use strict';

var aboutPt = 'Olá! Eu sou Edgard. Há 14 anos trabalho com programação e computação gráfica. Minha paixão é encontrar soluções elegantes para as idéias mais malucas que você puder imaginar. Meu foco é sempre o produto final, e devido a isso, eu encontrei no caminho generalista a possibilidade de juntar várias tecnologias e técnicas para dar vida a estas ideias. Com o passar dos anos adquiri experiência em diversas linguagens de programação e ferramentas gráficas:';
var aboutEn = "Hi, I'm a brazilian developer with more than 14 years of experience on coding and computer graphics. My passion is to achieve nifty solutions to the craziest briefings you can possibly imagine. My main focus is always the final product, and because that, I've found the generalist path to be the best way to allow me to mix various technologies and techniques. Over the years I've learned some programming languages and graphical tools:";

exports.getAbout = function (locale, callback) {
  return callback(null, locale === 'pt' ? aboutPt : aboutEn);
};