'use strict';

var jobsPt = [
  {
    id: 'mio_totem',
    title: 'Fiat Mio Totem',
    images:['mio_0.jpg', 'mio_1.jpg', 'mio_2.jpg', 'mio_3.jpg', 'mio_4.jpg'],
    thumb: 'mio_thumb.jpg',
    client: 'Fiat',
    platform: 'Flash, Unity3d, TUIO',
    agency: 'Agência Click',
    company: 'Taxilabs',
    roles: 'Lead Programmer, Flash, Unity3d, Shaders, Touch Screen.',
    description: 'Projeto desenvolvido para apresentar o carro conceito "Fiat Mio" no Salão do Automóvel de São Paulo. Desenvolvi uma aplicação híbrida Flash/Unity3d integrada a um painel Touch Screen (TUIO). Na camada Flash, realizei todas as animações de interface e navegação usando como base os layouts fornecidos pela agência. No ambiente Unity3d, programei toda a interatividade com o modelo 3d, e em conjunto com a equipe de arte escrevi os shaders e efeitos que foram utilizados no modelo 3d (como luzes dos faróis e raios-x de componentes internos do carro).',
    link: 'http://www.youtube.com/watch?v=wi2x5fWoDHg'
  },
  {
    id: 'transformers',
    title: 'LG Transformers Hotsite',
    images:['transformers_0.jpg', 'transformers_1.jpg', 'transformers_2.jpg', 'transformers_3.jpg', 'transformers_4.jpg'],
    thumb: 'transformers_thumb.jpg',
    client: 'LG',
    platform: 'Flash',
    agency: 'Publicis Modem San Francisco',
    company: 'Taxilabs',
    roles: 'Team Management, flow architecture, 3d modelling, animations, programming.',
    description: 'Neste projeto, a idéia da agência foi criar uma experiência baseada no filme Transformers 2 para apresentar um novo modelo de celular da LG. Ao entrar no site, o usuário deveria digitar um número de telefone, então o site ligava para o usuário e dava-se início ao story telling. O personagem, pelo telefone, dava uma missão ao usuário, que deveria ser cumprida utilizando comandos de voz. Então, o resultado do que acontecia no site era dependente das respostas dadas pelos usuários ao telefone, em tempo real. Neste projeto, coordenei a equipe responsável por criar as animações das ramificações do story telling, e a camada lógica que conectava as cenas umas nas outras com base nas interpretações de voz que vinham do servidor.',
    link: 'http://www.youtube.com/watch?v=gpmzXUN3lcI'
  },
  {
    id: 'dddiscador',
    title: 'DDDiscador',
    images:['discador_0.jpg', 'discador_1.jpg'],
    thumb: 'discador_thumb.jpg',
    client: 'Taxilabs',
    platform: 'iOS',
    agency: '-',
    company: 'Taxilabs',
    roles: 'Everything, including architecture, design and Obj-C coding.',
    description: 'Um dos primeiros aplicativos voltado para resolver o problema de discagem longa distância com operadoras e códigos de área no Brasil. Criei os layouts e desenvolvi as primeiras versões para iOS, de modo a permitir que o cliente desse continuidade ao desenvolvimento.',
    link: 'https://itunes.apple.com/us/app/dddiscador/id394201408?mt=8'
  },
  {
    id: 'garota_skol',
    title: 'Garota do tempo Skol',
    images:['garota_0.jpg', 'garota_1.jpg', 'garota_2.jpg', 'garota_3.jpg'],
    thumb: 'garota_thumb.jpg',
    client: 'Skol',
    platform: 'Flash',
    agency: 'F\\nazca ',
    company: 'Taxilabs',
    roles: 'Flash developer.',
    description: 'Previsão do tempo feita para a Skol. Nele, uma modelo apresenta a previsão do tempo para todas as cidades do Brasil. Foram dezenas de gravações que eram selecionadas para o usuário através de uma integração com o banco de dados do Climatempo. Neste projeto, participei do time de desenvolvedores Flash.',
    link: 'http://www.youtube.com/watch?v=Fwl81bikhQg'
  },
  {
    id: 'black_motion',
    title: 'Fiat Stilo Black Motion',
    images:['blackmotion_0.jpg', 'blackmotion_1.jpg', 'blackmotion_2.jpg'],
    thumb: 'blackmotion_thumb.jpg',
    client: 'Fiat',
    platform: 'Flash, Unity3d',
    agency: 'Agência Click',
    company: 'Taxilabs',
    roles: 'Flash developer.',
    description: 'Hotsite criado para o lançamento do Fiat Stilo Black Motion. A idéia foi criar um ambiente tridimensional escuro, que ao mover do mouse pintavam-se faixas brancas pelo cenário que por sua vez eram refletidas pelo modelo 3d do carro, fazendo com que fosse revelado. Este projeto ganhou bronze no Festival de Cannes.',
    link: 'http://www.fiatstilo.com.br/blackmotion/'
  },
  {
    id: 'vectra_remix',
    title: 'Vectra GT Remix',
    images:['gtremix_0.jpg', 'gtremix_1.jpg', 'gtremix_2.jpg', 'gtremix_3.jpg'],
    thumb: 'gtremix_thumb.jpg',
    client: 'GM',
    platform: 'Flash',
    agency: 'McCann',
    company: 'Edgy',
    roles: 'Lead Game Developer, AS3, AR, MaxScript.',
    description: 'Para o lançamento do Vectra GT, a agência desejava um game no qual deveria-se dirigir o novo Vectra por 3 pistas diferentes. A meta do jogo era seguir um traçado que controlava a mixagem da música que tocava na pista. Além disso, o jogo deveria ser controlado por um anúncio impresso que foi veiculado em diversas revistas. O objetivo foi atingido usando técnicas de composição de áudio e vídeo em tempo real e realidade aumentada.',
    link: 'http://www.youtube.com/watch?v=gsspprFwDuM'
  },
  {
    id: 'podium_petrobras',
    title: 'Podium Grand Prix Petrobras',
    images:['podium_0.jpg', 'podium_1.jpg', 'podium_2.jpg', 'podium_3.jpg'],
    thumb: 'podium_thumb.jpg',
    client: 'Petrobras',
    platform: 'Flash, OpenSocial, Facebook',
    agency: 'Agência Click',
    company: 'Taxilabs',
    roles: 'Lead Game Developer.',
    description: 'O jogo começa com gráficos que se assemelham aos do cultuado jogo Enduro, dos anos 80. A diferença é que agora o jogador pode usar a gasolina Podium. Quando o piloto abastece o carro, ganha potência e os gráficos do jogo melhoram (seguindo a evolução dos consoles de videogame). O desafio neste projeto foi alterar totalmente os gráficos do jogo, durante o gameplay, sem que houvesse qualquer impacto na performance. Para isso, utilizei ostensivamente padrões de otimização de código, como operações bitwise e técnicas que eram usadas na época dos games de 8 bits, como mode7, para simular as deformações da pista com base em operações matemáticas.',
    link: 'http://www.petrobras.com.br/pt/noticias/podium-grand-prix-game-em-redes-sociais-testa-sua-habilidade/'
  },
  {
    id: 'uno_racing',
    title: 'Uno Racing',
    images:['uno3d_0.jpg', 'uno3d_1.jpg', 'uno3d_2.jpg', 'uno3d_3.jpg'],
    thumb: 'uno3d_thumb.jpg',
    client: 'Fiat',
    platform: 'Unity3d',
    agency: 'Agência Click',
    company: 'Taxilabs',
    roles: 'Shader Programmer, Debugging.',
    description: 'Para o lançamento do novo Uno, foi criada uma instalação no Salão do Automóvel onde os visitantes podiam competir em uma pista virtual. Os principais desafios neste projeto foram permitir que até 4 pessoas corressem umas contra as outras na mesma partida, e o desejo do cliente de que todos os gráficos fossem estereoscópicos (para se jogar com óculos 3d). O resultado ficou animal.',
    link: 'http://vimeo.com/20080754'
  },
  {
    id: 'sprite_zero',
    title: 'Sprite 2.Zero',
    images:['sprite_0.jpg', 'sprite_1.jpg'],
    thumb: 'sprite_thumb.jpg',
    client: 'Coca-Cola',
    platform: 'Flash',
    agency: 'RMG Connect',
    company: 'Taxilabs',
    roles: 'Lead Programmer, fast AR tracking with bended and reflexive surfaces.',
    description: '"Após o bem-sucedido lançamento na região Sul do País e em parte do interior de São Paulo, a marca inova também em suas ações de comunicação, transformando sua embalagem em entretenimento. O refrigerante é o primeiro a utilizar a tecnologia de Realidade Aumentada (RA) em suas latas e garrafas, permitindo aos consumidores misturar o mundo real com o virtual e interagir com as personagens do filme publicitário em um jogo, no site da marca."',
    link: 'http://designzando.blogspot.com/2010/01/sprite-20-cpm-realidade-aumentada.html'
  }
];

var jobsEn = [
  {
    id: 'mio_totem',
    title: 'Fiat Mio Totem',
    images:['mio_0.jpg', 'mio_1.jpg', 'mio_2.jpg', 'mio_3.jpg', 'mio_4.jpg'],
    thumb: 'mio_thumb.jpg',
    client: 'Fiat',
    platform: 'Flash, Unity3d, TUIO',
    agency: 'Agência Click',
    company: 'Taxilabs',
    roles: 'Lead Programmer, Flash, Unity3d, Shaders, Touch Screen.',
    description: 'Project designed to introduce the concept car "Fiat Mio" at the Auto Show in Sao Paulo. I developed an hybrid application Flash/Unity3d integrated into a Touch Screen panel (TUIO). In the Flash layer, I performed all animations and interface navigations based on layouts provided by the agency. In the Unity3d environment, I programmed all the interactivity with the 3D model and, in conjunction with the design team, wrote the shaders and effects that were used in the 3D model (such as car headlights and x-rays of the internal components of the car).',
    link: 'http://www.youtube.com/watch?v=wi2x5fWoDHg'
  },
  {
    id: 'transformers',
    title: 'LG Transformers Hotsite',
    images:['transformers_0.jpg', 'transformers_1.jpg', 'transformers_2.jpg', 'transformers_3.jpg', 'transformers_4.jpg'],
    thumb: 'transformers_thumb.jpg',
    client: 'LG',
    platform: 'Flash',
    agency: 'Publicis Modem San Francisco',
    company: 'Taxilabs',
    roles: 'Team Management, flow architecture, 3d modelling, animations, programming.',
    description: 'In this project, the idea of the agency was to create an experience based on the movie Transformers 2 to present a new model of mobile phone from LG. Upon entering the site, the user would type in a phone number so the site dialed to the user and started telling the story. The character, by phone, gave a mission to the user, which should be fulfilled by using voice commands. So, the result of what happened on the site was dependent on the answers given by the users on the phone in real time. In this project, I coordinated the team responsible for creating the animations of the story telling ramifications and the logical layer that connected the scenes based on voice interpretations coming from the server.',
    link: 'http://www.youtube.com/watch?v=gpmzXUN3lcI'
  },
  {
    id: 'dddiscador',
    title: 'DDDiscador',
    images:['discador_0.jpg', 'discador_1.jpg'],
    thumb: 'discador_thumb.jpg',
    client: 'Taxilabs',
    platform: 'iOS',
    agency: '-',
    company: 'Taxilabs',
    roles: 'Everything, including architecture, design and Obj-C coding.',
    description: 'One of the first applications focused on solving the problem of long distance dial with operators and area codes in Brazil. I created the layouts and developed the first versions for iOS, in order to allow the customer to continue the development.',
    link: 'https://itunes.apple.com/us/app/dddiscador/id394201408?mt=8'
  },
  {
    id: 'garota_skol',
    title: 'Garota do tempo Skol',
    images:['garota_0.jpg', 'garota_1.jpg', 'garota_2.jpg', 'garota_3.jpg'],
    thumb: 'garota_thumb.jpg',
    client: 'Skol',
    platform: 'Flash',
    agency: 'F\\nazca ',
    company: 'Taxilabs',
    roles: 'Flash developer.',
    description: 'Weather forecast made ​​for the Skol (a brand of Brazilian Beer). In it, a girl model displays the weather forecast for all cities in Brazil. There were dozens of recordings that were selected to the user through an integration with a system of weather forecasting. In this project I was on the Flash development team.',
    link: 'http://www.youtube.com/watch?v=Fwl81bikhQg'
  },
  {
    id: 'black_motion',
    title: 'Fiat Stilo Black Motion',
    images:['blackmotion_0.jpg', 'blackmotion_1.jpg', 'blackmotion_2.jpg'],
    thumb: 'blackmotion_thumb.jpg',
    client: 'Fiat',
    platform: 'Flash, Unity3d',
    agency: 'Agência Click',
    company: 'Taxilabs',
    roles: 'Flash developer.',
    description: 'Hotsite created for the launch of the Fiat Stilo Black Motion. The idea was to create a dark three-dimensional environment so that when you move the mouse, white bands appear in the scene which then were reflected by the 3d model of the car, causing it to be revealed. This design won bronze at the Cannes Festival.',
    link: 'http://www.fiatstilo.com.br/blackmotion/'
  },
  {
    id: 'vectra_remix',
    title: 'Vectra GT Remix',
    images:['gtremix_0.jpg', 'gtremix_1.jpg', 'gtremix_2.jpg', 'gtremix_3.jpg'],
    thumb: 'gtremix_thumb.jpg',
    client: 'GM',
    platform: 'Flash',
    agency: 'McCann',
    company: 'Edgy',
    roles: 'Lead Game Developer, AS3, AR, MaxScript.',
    description: 'For the launch of Vectra GT, the agency briefed a game in which you should direct the new Vectra in 3 different tracks. The goal of the game was to follow a path that controlled the track music. In addition, the game should be controlled by a printed advertisement that was published in various journals. The goal was achieved using real-time video editing techniques and augmented reality.',
    link: 'http://www.youtube.com/watch?v=gsspprFwDuM'
  },
  {
    id: 'podium_petrobras',
    title: 'Podium Grand Prix Petrobras',
    images:['podium_0.jpg', 'podium_1.jpg', 'podium_2.jpg', 'podium_3.jpg'],
    thumb: 'podium_thumb.jpg',
    client: 'Petrobras',
    platform: 'Flash, OpenSocial, Facebook',
    agency: 'Agência Click',
    company: 'Taxilabs',
    roles: 'Lead Game Developer.',
    description: 'The game begins with graphics that resemble the cult game Enduro. The difference is that now the player can use the Podium gasoline. When the pilot fuel car, it gains power and improve the graphics of the game (by following the evolution of video game consoles). The challenge in this project was to totally alter the game\'s graphics during gameplay, without causing any impact on performance. For this, I used plenty of code optimization, like bitwise operations and techniques that were used in the days of 8-bit games like mode7 to simulate the deformation of the track based on mathematical operations.',
    link: 'http://www.petrobras.com.br/pt/noticias/podium-grand-prix-game-em-redes-sociais-testa-sua-habilidade/'
  },
  {
    id: 'uno_racing',
    title: 'Uno Racing',
    images:['uno3d_0.jpg', 'uno3d_1.jpg', 'uno3d_2.jpg', 'uno3d_3.jpg'],
    thumb: 'uno3d_thumb.jpg',
    client: 'Fiat',
    platform: 'Unity3d',
    agency: 'Agência Click',
    company: 'Taxilabs',
    roles: 'Shader Programmer, Debugging.',
    description: 'To launch the new Uno, a facility was created at the Motor Show where visitors could compete in a virtual track. The main challenges in this project were to allow up to 4 people ran against each other in the same game, and the requirement that all graphs were stereoscopic. The result was awesome.',
    link: 'http://vimeo.com/20080754'
  },
  {
    id: 'sprite_zero',
    title: 'Sprite 2.Zero',
    images:['sprite_0.jpg', 'sprite_1.jpg'],
    thumb: 'sprite_thumb.jpg',
    client: 'Coca-Cola',
    platform: 'Flash',
    agency: 'RMG Connect',
    company: 'Taxilabs',
    roles: 'Lead Programmer, fast AR tracking with bended and reflexive surfaces.',
    description: '"After the successful launch in Southern Brazil, the brand also innovates in their communication actions, transforming its packaging in entertainment. The refrigerant is the first to use Augmented Reality (AR) in their cans and bottles, allowing consumers to mix the real with the virtual world and interact with characters from the film in an advertising game at the brand site."',
    link: 'http://designzando.blogspot.com/2010/01/sprite-20-cpm-realidade-aumentada.html'
  }
];

exports.getJobs = function (locale, callback) {
  return callback(null, locale === 'pt' ? jobsPt : jobsEn);
};