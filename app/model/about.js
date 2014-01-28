'use strict';

var about = 'Olá! Eu sou Edgard. Há 14 anos trabalho com programação e computação gráfica. Minha paixão é encontrar soluções elegantes para as idéias mais malucas que você puder imaginar. Meu foco é sempre o produto final, e devido a isso, eu encontrei no caminho generalista a possibilidade de juntar várias tecnologias e técnicas para dar vida a estas ideias. Com o passar dos anos adquiri experiência em diversas linguagens de programação e ferramentas gráficas:';

exports.getAbout = function (callback) {
  return callback(null, about);
};