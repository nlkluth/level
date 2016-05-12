'use strict';

require('./index.html');
require('./styles/main.scss');
require('localforage');

const Elm = require('./Main.elm');
const mountNode = document.getElementById('main');
const heroUrl = "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?champData=image&api_key=587833f9-98ff-4cb8-92c8-ae1413a925af";
const app = Elm.embed(Elm.Main, mountNode);

const fetchHeroList = () => {
  localforage.getItem('heroList').then((value) => {
    if (!value) {
      return fetch(heroUrl);
    }

    return value;
  }).then((value) => {
    app.ports.heroList.send(value);
  }).catch((error) => {
    app.ports.errors.send(error);
  });
}

app.ports.subscribe.fetchAllHeroes(fetchHeroList);
