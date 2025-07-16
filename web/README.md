# JT Pump Web Interface

This folder contains a Node.js based web application used to control the Fosca driver over a serial connection.

## Requirements
- Node.js 16 or later
- Access to the USB serial device of the pump

## Installation
```bash
cd web
npm install
```

## Running the Server
Start the server with:
```bash
npm start
```

### Environment variables
- `PORT` – HTTP port for the server (default: `3000`)
- `PUMP_PORT` – Serial device path to the pump (default: `/dev/ttyUSB0`)
- `BAUD_RATE` – Serial baud rate (default: `9600`)

Open `http://localhost:3000` in your browser once the server is running.

## Real‑time Features
The application uses WebSockets to stream pump status and command logs to the browser. Each command and response appears instantly in the log panel and the status area updates with the latest speed, direction and error information.

## UI and Branding
- Pure white background
- **Space Grotesk** bold headings and **Inter** body text
- Purple and lavender accent colours matching the project logo
- Flat styled buttons and inputs with rounded corners
- Responsive layout that works on desktop and tablet

## Command Presets
Common commands can be saved as presets in the browser. Presets can be added, edited, deleted and loaded back into the command box with a single click.

## Example Screenshots
Screenshots of the interface can be found in the `screenshots` directory (not included in this repository).

## Troubleshooting
- Ensure the correct serial port is configured in `PUMP_PORT`.
- Invalid commands will be rejected by the UI and the server.
- If the server cannot open the serial port, check permissions or whether another program is using it.
