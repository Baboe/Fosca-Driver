/*
  Fosca Driver
  Licensed under the GNU LGPLv3. See the LICENSE file in this repository.
*/

const log = document.getElementById('log');
const statusInfo = document.getElementById('status-info');
const portInput = document.getElementById('port');
const liveCB = document.getElementById('live-mode');
const repeatInput = document.getElementById('repeat-count');
const untilStopCB = document.getElementById('repeat-until-stop');
const pumpCountInput = document.getElementById('pump-count');
let loadedFile = '';

function buildStepUI(container, step) {
  container.innerHTML = '';
  const time = document.createElement('input');
  time.type = 'number';
  time.className = 'time';
  const unit = document.createElement('select');
  unit.innerHTML = '<option value="s">s</option><option value="min">min</option><option value="h">h</option>';
  const duty = document.createElement('input');
  duty.type = 'number';
  duty.className = 'duty';
  container.append('Action Time ', time, unit, document.createElement('br'));
  container.append('Duty Cycle ', duty, '%', document.createElement('br'));
  const pumpsDiv = document.createElement('div');
  pumpsDiv.className = 'pumps';
  for (let i = 1; i <= 4; i++) {
    const pdiv = document.createElement('div');
    pdiv.className = 'pump';
    pdiv.dataset.pump = i;
    pdiv.innerHTML = `Pump ${i} <input type="checkbox" class="on"/> ` +
      `Dir <label><input type="radio" name="step${step}-dir${i}" value="f" checked/>F</label>` +
      `<label><input type="radio" name="step${step}-dir${i}" value="r"/>R</label> ` +
      `Volt <input type="number" class="volt"/> Speed <input type="number" class="speed"/>`;
    pumpsDiv.appendChild(pdiv);
  }
  container.appendChild(pumpsDiv);
}

document.querySelectorAll('.step-inputs').forEach((el, idx) => buildStepUI(el, idx + 1));

document.getElementById('tab-buttons').addEventListener('click', (e) => {
  if (e.target.classList.contains('tab-button')) {
    document.querySelectorAll('.tab-button').forEach(b => b.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
    e.target.classList.add('active');
    document.getElementById(e.target.dataset.tab).classList.add('active');
  }
});

function gatherSteps() {
  const steps = [];
  document.querySelectorAll('.step-inputs').forEach((stepEl) => {
    const time = parseFloat(stepEl.querySelector('.time').value) || 0;
    const unit = stepEl.querySelector('select').value;
    const duty = parseFloat(stepEl.querySelector('.duty').value) || 0;
    const pumps = [];
    stepEl.querySelectorAll('.pump').forEach(p => {
      const radioName = p.querySelector('input[type=radio]').name;
      pumps.push({
        on: p.querySelector('.on').checked,
        dir: stepEl.querySelector(`input[name="${radioName}"]:checked`).value,
        volt: parseFloat(p.querySelector('.volt').value) || 0,
        speed: parseFloat(p.querySelector('.speed').value) || 0
      });
    });
    steps.push({ time, unit, duty, pumps });
  });
  return steps;
}

function updateStatus(text) {
  statusInfo.textContent = text;
}

function appendLog(line) {
  const div = document.createElement('div');
  div.textContent = line;
  log.appendChild(div);
  log.scrollTop = log.scrollHeight;
}

// Connection handlers

document.getElementById('connect').addEventListener('click', async () => {
  const port = portInput.value;
  const res = await window.pumpAPI.connect(port);
  appendLog('Connect: ' + JSON.stringify(res));
  updateStatus('Connected to ' + port);
});

document.getElementById('disconnect').addEventListener('click', async () => {
  await window.pumpAPI.disconnect();
  appendLog('Disconnect');
  updateStatus('Disconnected');
});

// File operations

document.getElementById('load-file').addEventListener('click', async () => {
  const result = await window.pumpAPI.load();
  if (result && !result.canceled) {
    try {
      const obj = JSON.parse(result.data);
      loadedFile = result.path;
      pumpCountInput.value = obj.pumpCount || 4;
      document.querySelectorAll('.step-inputs').forEach((el, idx) => {
        const step = obj.steps[idx] || {};
        el.querySelector('.time').value = step.time || '';
        el.querySelector('select').value = step.unit || 's';
        el.querySelector('.duty').value = step.duty || '';
        el.querySelectorAll('.pump').forEach((p, i) => {
          const data = (step.pumps || [])[i] || {};
          p.querySelector('.on').checked = data.on || false;
          const radios = p.querySelectorAll('input[type=radio]');
          (data.dir === 'r' ? radios[1] : radios[0]).checked = true;
          p.querySelector('.volt').value = data.volt || '';
          p.querySelector('.speed').value = data.speed || '';
        });
      });
      updateStatus('Loaded ' + result.path);
    } catch (e) {
      appendLog('Load error: ' + e.message);
    }
  }
});

document.getElementById('save-file').addEventListener('click', async () => {
  const data = {
    pumpCount: parseInt(pumpCountInput.value, 10),
    steps: gatherSteps()
  };
  const res = await window.pumpAPI.save(JSON.stringify(data, null, 2));
  if (res && !res.canceled) {
    loadedFile = res.path;
    updateStatus('Saved ' + res.path);
  }
});

document.getElementById('generate-cmd').addEventListener('click', async () => {
  const cmd = await window.pumpAPI.buildCommand(gatherSteps());
  appendLog('Command: ' + cmd);
});

document.getElementById('run-steps').addEventListener('click', async () => {
  const settings = {
    repeat: parseInt(repeatInput.value, 10) || 1,
    untilStop: untilStopCB.checked,
    live: liveCB.checked
  };
  const steps = gatherSteps();
  updateStatus('Running...');
  try {
    await window.pumpAPI.runSequence(steps, settings);
    updateStatus('Finished');
  } catch (e) {
    appendLog('Error: ' + e);
    updateStatus('Error');
  }
});

document.getElementById('stop').addEventListener('click', () => {
  window.pumpAPI.stop();
});

window.pumpAPI.onStatus((status) => {
  appendLog('Status: ' + JSON.stringify(status));
});
