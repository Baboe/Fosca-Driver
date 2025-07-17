/*
  Fosca Driver
  Licensed under the GNU LGPLv3. See the LICENSE file in this repository.
*/
const { app, BrowserWindow, ipcMain, dialog } = require('electron');
const fs = require('fs');
const path = require('path');
const pump = require('./serial/pumpDriver');

let mainWindow;

function createWindow () {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,
      nodeIntegration: false
    }
  });

  mainWindow.loadFile(path.join(__dirname, 'renderer/index.html'));
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

// IPC handlers for pump commands
ipcMain.handle('pump-connect', async (_, port) => pump.connect(port));
ipcMain.handle('pump-send', async (_, cmd) => pump.send(cmd));
ipcMain.handle('pump-disconnect', () => pump.disconnect());
ipcMain.handle('pump-run-sequence', (_, steps, opts) => pump.runSequence(steps, opts));
ipcMain.handle('pump-stop', () => pump.stopSequence());
ipcMain.handle('pump-build-command', (_, steps) => pump.buildCommand(steps));
ipcMain.handle('pump-load', async () => {
  const res = await dialog.showOpenDialog({
    filters: [{ name: 'Pump files', extensions: ['json','pdd'] }],
    properties: ['openFile']
  });
  if (res.canceled || !res.filePaths[0]) return { canceled: true };
  const data = fs.readFileSync(res.filePaths[0], 'utf8');
  return { canceled: false, path: res.filePaths[0], data };
});
ipcMain.handle('pump-save', async (_, data) => {
  const res = await dialog.showSaveDialog({
    filters: [{ name: 'Pump files', extensions: ['json','pdd'] }]
  });
  if (res.canceled || !res.filePath) return { canceled: true };
  fs.writeFileSync(res.filePath, data, 'utf8');
  return { canceled: false, path: res.filePath };
});

// push live status updates to renderer
pump.onStatus((status) => {
  if (mainWindow) {
    mainWindow.webContents.send('pump-status', status);
  }
});
