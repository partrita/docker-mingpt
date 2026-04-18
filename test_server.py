import http.server
import socketserver

class RedirectHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('X-Content-Type-Options', 'nosniff')
        self.send_header('X-Frame-Options', 'DENY')
        self.send_header('Content-Security-Policy', "default-src 'self'")
        super().end_headers()

    def do_GET(self):
        if self.path == '/':
            self.send_response(302)
            self.send_header('Location', '/lab')
            self.end_headers()
        else:
            super().do_GET()

with socketserver.TCPServer(("127.0.0.1", 8000), RedirectHandler) as httpd:
    httpd.serve_forever()
