# Use a specific version of the Jupyter notebook stack for reproducibility.
# Images are now hosted on quay.io
# 🛡️ Sentinel: Pinned to specific digest for supply chain security
FROM quay.io/jupyter/minimal-notebook:python-3.11.6@sha256:16a757e257d7d45f2e3a42491562e88a6da40142921cb51246c806ca264210fc

# Install PyTorch, torchvision, and other dependencies using conda.
# Using a specific CUDA version for consistency.
RUN conda install --yes pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia && \
    conda install --yes numpy matplotlib -c conda-forge && \
    conda clean -afy

# Set the working directory for the user.
WORKDIR /home/jovyan/

# Clone the minGPT repository directly into the container.
# This makes the Docker build self-contained and not reliant on local files.
# Checking out a specific commit for security and reproducibility
# Set the SHELL option -o pipefail before RUN with a pipe in it
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN git clone https://github.com/karpathy/minGPT.git && \
    cd minGPT && \
    git checkout 4050db60409b5bbaaa3302cee1e49847fc145c65

# Set the working directory to the cloned repo.
WORKDIR /home/jovyan/minGPT

# Download the required data file for the play_char.ipynb notebook.
# Adding sha256sum check for data integrity
RUN wget -q https://raw.githubusercontent.com/karpathy/char-rnn/master/data/tinyshakespeare/input.txt -O /home/jovyan/minGPT/input.txt && \
    echo "86c4e6aa9db7c042ec79f339dcb96d42b0075e16b8fc2e86bf0ca57e2dc565ed  /home/jovyan/minGPT/input.txt" | sha256sum -c -

# The container will start JupyterLab by default.
# To build this image, run:
# docker build -t docker-mingpt .
#
# To run the container:
# docker run -p 8888:8888 docker-mingpt
# Then open the URL printed in the console in your browser.
