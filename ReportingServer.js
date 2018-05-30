const express = require('express');
const app = express();
const PORT = process.argv[2] || 8080;
const serverName = (process.argv[3] || 'WatchFox Reporting Server');

app.use(express.static('www'));

app.get('/*', (req, res) => {
  res.status(404).send('🐸 404 not found...');
})

app.listen(PORT, () => {
  console.log(`${serverName} listening on ${PORT}`);
});
