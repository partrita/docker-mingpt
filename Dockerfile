FROM python:3.7-stretch

# Update to latest packages
RUN apt-get update && \
    apt-get install python-setuptools wget bzip2 git libc6 -y && \
    pip install ipython

# Install PyRosetta from source
# check the release number y
# TODO: 버전업이 되면 url이 변하기 때문에 확인하는 코드가 필요하다.
RUN wget https://levinthal:paradox@graylab.jhu.edu/download/PyRosetta4/archive/release/PyRosetta4.Release.python37.ubuntu/PyRosetta4.Release.python37.ubuntu.release-260.tar.bz2

# Extract
RUN tar -xvjf PyRosetta4.Release.python37.ubuntu.release-260.tar.bz2 && \
    rm PyRosetta4.Release.python37.ubuntu.release-260.tar.bz2 && \
    cd PyRosetta4.Release.python37.ubuntu.release-260/setup/ && \
    python setup.py install

# Last is the actual command to start up 
CMD ["bin/bash"]
