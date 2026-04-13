import http.server
import socketserver

class RedirectHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(302)
            self.send_header('Location', '/lab')
            self.end_headers()
        else:
            super().do_GET()

with socketserver.TCPServer(("127.0.0.1", 8000), RedirectHandler) as httpd:
    httpd.serve_forever()
