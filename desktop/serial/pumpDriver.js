const { SerialPort } = require('serialport');
const EventEmitter = require('events');

let port;
const emitter = new EventEmitter();

function connect(path) {
  return new Promise((resolve, reject) => {
    port = new SerialPort({ path, baudRate: 9600 }, (err) => {
      if (err) {
        reject(err.message);
      } else {
        resolve({ connected: true });
        port.on('data', (data) => {
          emitter.emit('status', { response: data.toString() });
        });
        port.on('error', (err) => {
          emitter.emit('status', { error: err.message });
        });
      }
    });
  });
}

function send(cmd) {
  if (!port) return Promise.reject('Not connected');
  return new Promise((resolve, reject) => {
    port.write(cmd + '\r', (err) => {
      if (err) {
        reject(err.message);
      } else {
        resolve({ sent: cmd });
      }
    });
  });
}

function disconnect() {
  return new Promise((resolve) => {
    if (port) {
      port.close(() => {
        port = null;
        resolve({ disconnected: true });
      });
    } else {
      resolve({ disconnected: true });
    }
  });
}

function onStatus(cb) {
  emitter.on('status', cb);
}

module.exports = { connect, send, disconnect, onStatus };
