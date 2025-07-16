# JT Pump Driver

Program to control [evaluation kits](https://www.jobst-technologies.com/products/microfluidics/peristaltic-micropumps/#Evaluation_Kits) for [CPP1 micropumps](https://www.jobst-technologies.com/products/microfluidics/peristaltic-micropumps).

# Usage

To run pumps:
- Connect the pump driver to the PC.
- Click on the button *Connect Driver* and select the COM port of the pump driver.
- Either
  - set the properties you like.
  - load an action file via the menu *File → Load Action File* or by dropping a file into
   the program while the tab *Action Control* is open.
- Press *Run Action*.

To save a pump action:
- Only necessary when you have a pump action file loaded:
  - Click the button *Generate Command* to unlock its settings.
- Set the parameters in the different steps and then use the menu
  *File → Save Action File*.

## Pump driver Firmware Update

To update or upload a new firmware:
- Connect the pump driver to the PC.
- Use the menu *Miscellaneous → Firmware Update*.
- Follow the steps provided by the software.

You can get the latest firmware version as binary from [here](https://github.com/JobstTechnologies/JT-PumpDriver-Firmware/releases/latest).

# Copyrights

Copyright by Jobst Technologies.

JT Pump Driver uses the Arduino tool [**bossac**](https://github.com/arduino/arduino-flash-tools).

# Compilation

- Install the [**Lazarus** IDE](https://www.lazarus-ide.org/).
- Only for the first run of Lazarus:
  - Open the menu *Package → Online Package Manager* and install there the packages **LazSerial** and **Synapse**.
- Open the file *JTPumpDriver3.lpi* in Lazarus.
- Build the Lazarus project or run it.

# Electron Desktop Application

A cross-platform desktop app built with Electron is provided in the `desktop` folder. It communicates with the pump over a USB serial connection using the [`serialport`](https://serialport.io) library.

## Requirements
- Node.js 16 or later
- Pump connected via USB

## Installation
```bash
cd desktop
npm install
```

## Running the App
Start Electron in development mode with:
```bash
npm start
```
The application window will open and you can enter the serial port, send commands and see live status updates in the log panel.

## Building
To create a standalone portable executable for Windows run:
```bash
npm run dist
```
When building on Linux, ensure that Wine is installed because `electron-builder`
needs it to generate Windows binaries.
The output will be placed in the `dist` folder as `desktop-<version>-portable.exe`.

