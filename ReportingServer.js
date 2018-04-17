const express = require('express');
const env = require('huli-env');
const db = require('huli-db');
const hb = require('huli-hb');
const logger = require('endpointz').reqLog;
const serverLog = require('endpointz').serverLog;
const startMessage = require('endpointz').startMessage;
const serverName = (process.argv[3] || 'WatchFox Reporting');
const PORT = process.argv[2] || 9797;
const app = express();

app.use(logger);

app.use(hb.endpoint);

app.use(express.static('www'));

app.get('/', (req, res) => {
  res.send('App reporting in');
});

app.get('/ping', (req, res) => {
  res.send('pong');
});

app.get('/*', (req, res) => {
  res.status(404).send('🐸 404 not found...');
})

app.listen(PORT, startMessage(serverName, PORT));
