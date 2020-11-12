#TODO consolidate the RUNS and reduce creating layers. 
FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

# Install build-essential, git, wget, python-dev, pip, BLAS + LAPACK and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  software-properties-common \
  gfortran \
  git \
  wget \
  liblapack-dev \
  libopenblas-dev \
  python3-dev \
  python3-pip && \
  add-apt-repository universe && \ 
  apt update && \ 
  apt install -y graphviz && \
  rm -rf /var/lib/apt/lists/* && \
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  && mkdir /root/.conda \
  && bash Miniconda3-latest-Linux-x86_64.sh -b \
  && rm -f Miniconda3-latest-Linux-x86_64.sh && \
  conda --version && \
  conda install pygpu theano && \
  pip install keras==2.2.5 scipy numpy pydot 

# Set up .theanorc for CUDA
RUN echo "[global]\ndevice=cuda\nfloatX=float32\noptimizer_including=cudnn\n[lib]\ncnmem=0.1\n[nvcc]\nfastmath=True" > /root/.theanorc

# keras backend setup for theano and channels first
RUN mkdir -p /root/.keras
RUN echo '{\n "floatx": "float32",\n"epsilon": 1e-07,\n"backend": "theano",\n"image_data_format": "channels_first"\n}' > /root/.keras/keras.json