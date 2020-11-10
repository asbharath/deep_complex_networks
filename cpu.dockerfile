

# Theano GPU 
FROM ubuntu:18.04

# Install build-essential, git, wget, python-dev, pip, BLAS + LAPACK and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  gfortran \
  git \
  wget \
  liblapack-dev \
  libopenblas-dev \
  python3-dev \
  python3-pip \
  python-nose \
  python-numpy && \
  pip3 install --upgrade pip \
  --no-deps git+git://github.com/Theano/Theano.git \
  scipy \
  keras==2.2.5
  

# # Install bleeding-edge Theano
# RUN pip install --upgrade pip
# RUN pip install --upgrade six
# RUN pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git
# RUN pip install scipy keras==2.2.5

# COPY scripts /opt/src
# COPY scripts/training.py /opt/src/training.py
# WORKDIR /opt
# CMD python /opt/src/training.py