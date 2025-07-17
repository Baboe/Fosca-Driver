/*
  Fosca Driver
  Licensed under the GNU LGPLv3. See the LICENSE file in this repository.
*/
const { SerialPort } = require('serialport');
const EventEmitter = require('events');

let port;
const emitter = new EventEmitter();
let abort = false;

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

function buildCmd(step) {
  const pumpStr = step.pumps.map((p,i)=>`P${i+1}:${p.on?1:0},${p.dir},${p.volt},${p.speed}`).join(';');
  return `T=${step.time}${step.unit},D=${step.duty};${pumpStr}`;
}

async function runSequence(steps, opts={}) {
  abort = false;
  const repeat = opts.untilStop ? Infinity : (opts.repeat||1);
  for (let r=0; r<repeat && !abort; r++) {
    for (const step of steps) {
      const cmd = buildCmd(step);
      if (opts.live) {
        await send(cmd);
      }
      const ms = step.unit==='h'? step.time*3600000 : step.unit==='min'? step.time*60000 : step.time*1000;
      await new Promise(res => setTimeout(res, ms));
      if (abort) break;
    }
  }
  return { finished: !abort };
}

function stopSequence() {
  abort = true;
}

function buildCommand(steps) {
  return steps.map(buildCmd).join('|');
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

module.exports = { connect, send, disconnect, onStatus, runSequence, stopSequence, buildCommand };
