# JT Pump Web Interface

This folder contains a small web server and frontend to send serial commands to the JT Pump device using Node.js and Express.

## Requirements
- Node.js (version 16 or later is recommended)
- Access to the USB serial device of the pump

## Installation
1. Open a terminal in this `web` directory.
2. Install dependencies:
   ```bash
   npm install
   ```

## Running the server and frontend
Start the server with:
```bash
npm start
```

Environment variables:
- `PORT` – Port for the web server (default: `3000`)
- `PUMP_PORT` – Serial device path (default: `/dev/ttyUSB0`)
- `BAUD_RATE` – Serial baud rate (default: `9600`)

Once started, open `http://localhost:3000` (or the port you specified) in your browser to access the frontend.

## Sending commands to the pump
1. Connect the pump driver to the computer and note the serial port path.
2. Start the server with the correct `PUMP_PORT` environment variable, e.g.:
   ```bash
   PUMP_PORT=/dev/ttyACM0 npm start
   ```
3. In the web interface, type a command supported by the pump and click **Send**.
4. The response from the pump will be displayed in the page.

## Troubleshooting
- If the server cannot open the serial port, check that the path in `PUMP_PORT` is correct and that you have permission to access it.
- Invalid or malformed commands will result in an error response.
- Ensure no other program is using the pump's serial port while running this web interface.
