function mkelectron
    if count $argv > /dev/null
    else
       echo 'Please input file name for argument.'
       return
    end

    string trim "
'use strict';

var app = require('app');
var BrowserWindow = require('browser-window');

require('crash-reporter').start();

var mainWindow = null;

app.on('window-all-closed', function() {
  if (process.platform != 'darwin') {
    app.quit();
  }
});

app.on('ready', function() {
  mainWindow = new BrowserWindow({width: 1200, height: 800});
  mainWindow.loadUrl('file://' + __dirname + '/index.html');
  mainWindow.openDevTools(true);

  mainWindow.on('closed', function() {
    mainWindow = null;
  });
});
" > ./main.js
    echo './main.js file was created.'

string trim "
<html>
  <body>
    <div id="app"></div>
    <script src="dist/build.js"></script>
  </body>
</html>
" > ./index.html
    echo './index.html file was created.'

string trim "
import React, { Component } from 'react'
import { render } from 'react-dom'

class App extends Component {
  render() {
    <webview src="http://.com" autosize="on"></webview>
  }
}

render(
  <App />,
  document.getElementById('app')
)
" > ./app.js
    echo './app.js file was created.'

end
