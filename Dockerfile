# Use a specific version of the Jupyter notebook stack for reproducibility.
# Images are now hosted on quay.io
FROM quay.io/jupyter/minimal-notebook:python-3.11.6

# Install PyTorch, torchvision, and other dependencies using conda.
# Using a specific CUDA version for consistency.
RUN conda install --yes pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia && \
    conda install --yes numpy matplotlib -c conda-forge && \
    conda clean -afy

# Set the working directory for the user.
WORKDIR /home/jovyan/

# Clone the minGPT repository directly into the container.
# This makes the Docker build self-contained and not reliant on local files.
RUN git clone https://github.com/karpathy/minGPT.git

# Download the required data file for the play_char.ipynb notebook.
RUN wget https://raw.githubusercontent.com/karpathy/char-rnn/master/data/tinyshakespeare/input.txt -P /home/jovyan/minGPT/

# Set the working directory to the cloned repo.
WORKDIR /home/jovyan/minGPT

# The container will start JupyterLab by default.
# To build this image, run:
# docker build -t docker-mingpt .
#
# To run the container:
# docker run -p 8888:8888 docker-mingpt
# Then open the URL printed in the console in your browser.
