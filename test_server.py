import http.server
import socketserver

class RedirectHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(302)
        self.send_header('Location', '/lab')
        self.end_headers()

with socketserver.TCPServer(("", 8000), RedirectHandler) as httpd:
    httpd.serve_forever()
