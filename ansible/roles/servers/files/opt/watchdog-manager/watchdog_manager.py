from http.server import SimpleHTTPRequestHandler, HTTPServer
import json
import subprocess
import threading
from typing import Any, override
from datetime import datetime

import io

# FIXME: THIS COMPONENT SHOULD BE RELEASED IN A REAL GITHUB PROJECT, IDEALLY DEVELOPED IN GOLANG OR RUST


LAST_CALL_MOMENT: float = datetime.now().timestamp()

# WARNING: Must always be greater that the 'for' configured in the Prometheus Watchdog alert
MAX_WAIT_TIME: int = 60 * 20  # 20 minutes

def check_time_diff() -> None:
    global LAST_CALL_MOMENT

    print("Checking time difference...")
    current_time: float = datetime.now().timestamp()

    if current_time - LAST_CALL_MOMENT > MAX_WAIT_TIME:
       subprocess.run(
           [
               "notify-send",
               "-u",
               "normal",
               "-t",
               "10000",
               "Prometheus Watchdog problem!", "The Watchdog alert stopped receiving heartbeats!"
           ],
           check=True
       )

def background_timer(interval: int) -> None:
    while True:
        check_time_diff()
        threading.Event().wait(interval)

# @see https://pychao.com/2021/03/01/sending-desktop-notification-in-linux-with-python-with-d-bus-directly/
# @see https://gist.github.com/mobeigi/5a96f326bc06c7d6f283ecb7cb083f2b
class Handler(SimpleHTTPRequestHandler):

    @override
    def __init__(self, *args, **kwargs) -> None:

        super().__init__(*args, directory=".", **kwargs)

    @override
    def list_directory(self, path: StrPath) -> io.BytesIO | None:
        self.send_error(403, "Directory listing is not allowed")

    @override
    def do_GET(self) -> None:
        if self.path == '/status':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            self.wfile.write(b'{"status": "ok"}')
        else:
            self.send_response(404)
            self.end_headers()

    def do_POST(self) -> None:
        global LAST_CALL_MOMENT

        if self.path == '/':
            content_length = int(self.headers['Content-Length'])
            post_data: bytes = self.rfile.read(content_length)

            str_payload: str = post_data.decode('utf-8')
            payload: dict[str, Any] = json.loads(str_payload)
            print(payload["alerts"][0]["labels"])

            LAST_CALL_MOMENT = datetime.now().timestamp()

            # Here you would process the post_data as needed
            self.send_response(200)
            self.end_headers()
            self.wfile.write(post_data)
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == "__main__":
    interval: int = 15
    timer_thread = threading.Thread(target=background_timer, args=(interval,))
    timer_thread.daemon = True
    timer_thread.start()

    port: int = 9094
    server_address = ('', port)
    httpd = HTTPServer(server_address, Handler)
    print(f"Starting httpd server on port {port}")
    httpd.serve_forever()
