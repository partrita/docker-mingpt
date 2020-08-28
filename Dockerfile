# https://github.com/jupyter/docker-stacks
FROM jupyter/minimal-notebook:latest
# Install in the default python3 environment
RUN conda install --yes pytorch torchvision cudatoolkit=10.2 -c pytorch
# copy minigpt repo
COPY miniGPT .
# build a new images
# docker build --rm -t jupyter/my-datascience-notebook .
