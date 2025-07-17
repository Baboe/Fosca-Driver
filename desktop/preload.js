/*
  Fosca Driver
  Licensed under the GNU LGPLv3. See the LICENSE file in this repository.
*/
const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('pumpAPI', {
  connect: (port) => ipcRenderer.invoke('pump-connect', port),
  send: (cmd) => ipcRenderer.invoke('pump-send', cmd),
  disconnect: () => ipcRenderer.invoke('pump-disconnect'),
  runSequence: (steps, opts) => ipcRenderer.invoke('pump-run-sequence', steps, opts),
  stop: () => ipcRenderer.invoke('pump-stop'),
  buildCommand: (steps) => ipcRenderer.invoke('pump-build-command', steps),
  load: () => ipcRenderer.invoke('pump-load'),
  save: (data) => ipcRenderer.invoke('pump-save', data),
  onStatus: (cb) => ipcRenderer.on('pump-status', (_, data) => cb(data))
});
