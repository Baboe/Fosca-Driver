/*
  Fosca Driver
  Licensed under the GNU LGPLv3. See the LICENSE file in this repository.
*/
const log = document.getElementById('log');
const portInput = document.getElementById('port');
const commandInput = document.getElementById('command');
const actionTimeInput = document.getElementById('action-time');
const dutyCycleInput = document.getElementById('duty-cycle');
const pump1CB = document.getElementById('pump1');
const pump2CB = document.getElementById('pump2');
const pump3CB = document.getElementById('pump3');
const pump4CB = document.getElementById('pump4');
const stepsDiv = document.getElementById('steps');

const steps = [];

document.getElementById('connect').addEventListener('click', async () => {
  const port = portInput.value;
  const res = await window.pumpAPI.connect(port);
  appendLog('Connect: ' + JSON.stringify(res));
});

document.getElementById('disconnect').addEventListener('click', async () => {
  const res = await window.pumpAPI.disconnect();
  appendLog('Disconnect');
});

document.getElementById('send').addEventListener('click', async () => {
  const cmd = commandInput.value;
  const res = await window.pumpAPI.send(cmd);
  appendLog('Send: ' + cmd + ' -> ' + JSON.stringify(res));
});

window.pumpAPI.onStatus((status) => {
  appendLog('Status: ' + JSON.stringify(status));
});

document.getElementById('add-step').addEventListener('click', () => {
  const step = {
    time: parseFloat(actionTimeInput.value) || 0,
    duty: parseFloat(dutyCycleInput.value) || 0,
    pumps: [pump1CB.checked, pump2CB.checked, pump3CB.checked, pump4CB.checked]
  };
  steps.push(step);
  const div = document.createElement('div');
  div.textContent = `Step ${steps.length}: time ${step.time}s, duty ${step.duty}%, pumps ${step.pumps.map(p=>p?'on':'off').join(',')}`;
  stepsDiv.appendChild(div);
});

document.getElementById('run-sequence').addEventListener('click', async () => {
  for (const [i, step] of steps.entries()) {
    const cmd = `STEP ${i+1} ${step.time} ${step.duty} ${step.pumps.map(p=>p?1:0).join('')}`;
    const res = await window.pumpAPI.send(cmd);
    appendLog('Send: ' + cmd + ' -> ' + JSON.stringify(res));
    await new Promise(r => setTimeout(r, step.time * 1000));
  }
});

function appendLog(line) {
  const div = document.createElement('div');
  div.textContent = line;
  log.appendChild(div);
  log.scrollTop = log.scrollHeight;
}
