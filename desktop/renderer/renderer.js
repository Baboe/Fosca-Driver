const log = document.getElementById('log');
const portInput = document.getElementById('port');
const commandInput = document.getElementById('command');

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

function appendLog(line) {
  const div = document.createElement('div');
  div.textContent = line;
  log.appendChild(div);
  log.scrollTop = log.scrollHeight;
}
