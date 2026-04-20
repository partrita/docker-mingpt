import http.server
import socketserver
import http

class RedirectHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('X-Content-Type-Options', 'nosniff')
        self.send_header('X-Frame-Options', 'SAMEORIGIN')
        self.send_header('Content-Security-Policy', "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; connect-src 'self' ws: wss:")
        super().end_headers()

    def do_GET(self):
        if self.path == '/':
            self.send_response(302)
            self.send_header('Location', '/lab')
            self.end_headers()
        else:
            super().do_GET()

    def list_directory(self, path):
        self.send_error(http.HTTPStatus.FORBIDDEN, "Directory listing is disabled")
        return None

with socketserver.TCPServer(("127.0.0.1", 8000), RedirectHandler) as httpd:
    httpd.serve_forever()
