## 2024-05-24 - [Unpinned External Dependencies in Docker Build]
**Vulnerability:** The `Dockerfile` downloaded external dependencies (`git clone` of a repository and `wget` of a data file) without pinning specific versions or verifying their integrity using checksums. This presents a risk of supply chain attacks or unexpected build failures if the upstream files are modified.
**Learning:** Even in educational or seemingly low-risk projects, external dependencies should be verified. Without verification, an attacker compromising the upstream source could inject malicious code or data that executes during the Docker build or when the container is run. The lack of checksums for downloaded files is a common pattern that can lead to compromised environments.
**Prevention:** Always pin specific commits or tags when cloning repositories in `Dockerfile`s. Always use checksum validation (e.g., `sha256sum`) when downloading external files using tools like `wget` or `curl`.

## 2024-05-24 - [Insecure Docker Port Binding]
**Vulnerability:** The documentation instructed users to run the container using `docker run -p 8888:8888`. This binds the port to `0.0.0.0`, exposing the JupyterLab server (which allows remote code execution) to the entire local network, bypassing host firewalls like UFW. This poses a direct risk to the host infrastructure.
**Learning:** Docker bypasses UFW by default. Binding to `0.0.0.0` is dangerous for development servers, especially those offering remote code execution like JupyterLab.
**Prevention:** Always explicitly bind to localhost (`127.0.0.1`) when running containers intended for local access only, e.g., `docker run -p 127.0.0.1:8888:8888`.
