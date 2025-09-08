# docker-minGPT

This repository provides a Docker environment for [minGPT](https://github.com/karpathy/minGPT), a minimal PyTorch re-implementation of GPT training by Andrej Karpathy.

The `Dockerfile` in this repository builds a self-contained JupyterLab environment with all the necessary dependencies and data to run the minGPT example notebooks.

## Getting Started

Follow these steps to build the Docker image and run the minGPT environment.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) must be installed on your system.
- An NVIDIA GPU with CUDA support is required to run the CUDA-enabled version of PyTorch in this Dockerfile.

### 1. Build the Docker Image

Open your terminal, navigate to the root directory of this project, and run the following command to build the Docker image. This may take a few minutes as it downloads the base image and installs the dependencies.

```bash
docker build -t docker-mingpt .
```

### 2. Run the Docker Container

Once the image is built, you can run it as a container with this command:

```bash
docker run -p 8888:8888 docker-mingpt
```

This command starts the JupyterLab server inside the container and maps port 8888 of the container to port 8888 on your local machine.

### 3. Access JupyterLab

When the container starts, it will print a URL to the console that looks something like this:

```
http://127.0.0.1:8888/lab?token=a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4
```

Copy and paste this URL into your web browser to open the JupyterLab interface.

## Usage

The Docker environment comes with the `minGPT` repository cloned and all example notebooks ready to run. In the JupyterLab file browser (on the left), you will find the `minGPT` directory.

The key example notebooks are:
- `play_char.ipynb`: Trains a character-level GPT on Shakespearean text.
- `play_image.ipynb`: Trains a GPT to generate images using the CIFAR-10 dataset.
- `play_math.ipynb`: Trains a GPT to solve addition problems.

Simply open any of these notebooks and run the cells to see `minGPT` in action.
