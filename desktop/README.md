# Fosca Pump Desktop Application

This folder contains the Electron based user interface for controlling the Fosca Pump Driver.

## Usage

Run `npm install` once and then start the application with `npm start` from this directory.

## Serial Port Auto‑Detection

When the Connect view opens, or whenever you click **Refresh**, the app scans all serial ports using the `serialport` library. Detected pump drivers are listed in the dropdown as `Driver SN <serial> (COMx)`. Simply select the correct entry and press **Connect**.

If no entries appear and the dropdown shows *No pump detected*, check that the USB cable is attached and that your user has permission to access serial ports (on Linux this often means being in the `dialout` group). If the device appears but connecting fails, the pump firmware may be missing; use the firmware update function to reflash the driver.
