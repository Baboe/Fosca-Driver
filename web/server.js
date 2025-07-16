const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const { SerialPort } = require('serialport');
const { ReadlineParser } = require('@serialport/parser-readline');

const app = express();
const port = process.env.PORT || 3000;
const devicePath = process.env.PUMP_PORT || '/dev/ttyUSB0';
const baudRate = parseInt(process.env.BAUD_RATE || '9600', 10);

let pumpPort = new SerialPort({ path: devicePath, baudRate, autoOpen: false });
const parser = pumpPort.pipe(new ReadlineParser({ delimiter: '\n' }));

function openPumpPort() {
  if (pumpPort.isOpen) return Promise.resolve();
  return new Promise((resolve, reject) => {
    pumpPort.open(err => {
      if (err) return reject(err);
      resolve();
    });
  });
}

const server = http.createServer(app);
const io = new Server(server);

const status = {
  speed: null,
  direction: null,
  lastCommand: null,
  lastResponse: null,
  error: null
};

parser.on('data', data => {
  const text = data.toString().trim();
  status.lastResponse = text;
  status.error = null;
  const speedMatch = text.match(/SP(?:EED)?=([0-9]+)/i);
  if (speedMatch) status.speed = speedMatch[1];
  const dirMatch = text.match(/DIR(?:ECTION)?=([A-Za-z]+)/i);
  if (dirMatch) status.direction = dirMatch[1];
  io.emit('status', status);
  io.emit('log', { type: 'response', message: text, timestamp: Date.now() });
});

app.use(express.json());
app.use(express.static(__dirname + '/public'));

app.post('/api/send-command', async (req, res) => {
  const command = req.body.command;
  if (!command || typeof command !== 'string') {
    return res.status(400).json({ error: 'Invalid command' });
  }
  try {
    await openPumpPort();
  } catch (err) {
    status.error = 'Failed to open pump port';
    io.emit('status', status);
    io.emit('log', { type: 'error', message: err.message, timestamp: Date.now() });
    return res.status(500).json({ error: status.error, details: err.message });
  }

  status.lastCommand = command;
  io.emit('log', { type: 'command', message: command, timestamp: Date.now() });
  io.emit('status', status);

  try {
    const response = await new Promise((resolve, reject) => {
      const timeout = setTimeout(() => {
        parser.removeListener('data', onData);
        reject(new Error('Timeout waiting for response'));
      }, 2000);

      function onData(data) {
        clearTimeout(timeout);
        resolve(data.toString().trim());
      }

      parser.once('data', onData);
      pumpPort.write(command + '\n', err => {
        if (err) {
          clearTimeout(timeout);
          parser.removeListener('data', onData);
          reject(err);
        }
      });
    });

    res.json({ response });
  } catch (err) {
    status.error = err.message;
    io.emit('status', status);
    io.emit('log', { type: 'error', message: err.message, timestamp: Date.now() });
    res.status(500).json({ error: 'Failed to send command', details: err.message });
  }
});

server.listen(port, async () => {
  console.log(`Server listening on port ${port}`);
  try {
    await openPumpPort();
  } catch (err) {
    console.error('Error opening pump port:', err.message);
  }
});
