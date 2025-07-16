const express = require('express');
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
    return res.status(500).json({ error: 'Failed to open pump port', details: err.message });
  }

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
    res.status(500).json({ error: 'Failed to send command', details: err.message });
  }
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
