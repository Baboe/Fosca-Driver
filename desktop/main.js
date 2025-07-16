const { app, BrowserWindow, ipcMain } = require('electron');
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
ipcMain.handle('pump-connect', async (_, port) => {
  return pump.connect(port);
});

ipcMain.handle('pump-send', async (_, cmd) => {
  return pump.send(cmd);
});

ipcMain.handle('pump-disconnect', () => {
  return pump.disconnect();
});

// push live status updates to renderer
pump.onStatus((status) => {
  if (mainWindow) {
    mainWindow.webContents.send('pump-status', status);
  }
});
