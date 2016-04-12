'use strict';

require('./index.html');
require('./styles/main.scss');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.embed(Elm.Main, mountNode);
