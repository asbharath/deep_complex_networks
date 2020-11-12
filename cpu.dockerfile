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
