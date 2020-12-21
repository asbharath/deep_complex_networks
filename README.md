Deep Complex Networks
=====================

This repository contains code which reproduces experiments presented in
the paper [Deep Complex Networks](https://arxiv.org/abs/1705.09792).

The code is updated to run with python3. For ease of use, run the docker as per the instruction in the section Installation

music experiments (Not supported yet):
```
pip install scipy sklearn intervaltree resampy
pip install git+git://github.com/bartvm/mimir.git
```

Depending on your Python installation you might want to use anaconda or other tools.


Installation
------------

from root directory(deep_complex_networks)

For GPU trainig 
```
make build 
make run
```

For CPU
```
make build_cpu
make run_cpu
```

Experiments
-----------

### Computer vision

1. Get help:

    ```
    python scripts/run.py train --help
    ```

2. Run models:

    ```
    python scripts/run.py train -w WORKDIR --model {real,complex} --sf STARTFILTER --nb NUMBEROFBLOCKSPERSTAGE
    ```

    ```
    # wide shallow real
    python scripts/run.py train -w WORKDIR --model real --sf 18 --nb 14

    # wide shallow complex
    python scripts/run.py train -w WORKDIR --model complex --sf 12 --nb 16

    # deep narrow real 
    python scripts/run.py train -w WORKDIR --model real --sf 14 --nb 23

    # deep narrow complex 
    python scripts/run.py train -w WORKDIR --model complex --sf 10 --nb 23

    # in between real 
    python scripts/run.py train -w WORKDIR --model real --sf 16 --nb 18

    # in between complex 
    python scripts/run.py train -w WORKDIR --model complex --sf 11 --nb 19
    ```

    Other arguments may be added as well; Refer to run.py train --help for
    
      - Optimizer settings
      - Dropout rate
      - Clipping
      - ...


### MusicNet

0. Download the dataset from [the official page](https://homes.cs.washington.edu/~thickstn/musicnet.html)

    ```
    mkdir data/
    wget https://homes.cs.washington.edu/~thickstn/media/musicnet.npz -P data/
    ```

1. Resample the dataset with 

    ```
    resample.py data/musicnet.npz data/musicnet_11khz.npz 44100 11000
    ```

2. Run shallow models

    ```
    train.py shallow_model --in-memory --model=shallow_convnet --local-data data/musicnet_11khz.npz
    train.py shallow_complex_model --in-memory --model=complex_shallow_convnet --complex --local-data data/musicnet_11khz.npz
    ```

3. Run deep models

    ```
    train.py deep_model --in-memory --model=deep_convnet --fourier --local-data data/musicnet_11khz.npz
    train.py deep_complex_model --in-memory --model=complex_deep_convnet --fourier --complex --local-data data/musicnet_11khz.npz
    ```

4. Visualize with jupyter notebook

    Run the notebook `notebooks/visualize_musicnet.ipynb`.

    ![precision-recall](imgs/precision_recall.png "Precision-recall curve")
    ![predicitons](imgs/pred_gt.png "Prediction example")


Citation
--------

Please cite our work as 

```
@ARTICLE {,
    author  = "Chiheb Trabelsi, Olexa Bilaniuk, Ying Zhang, Dmitriy Serdyuk, Sandeep Subramanian, João Felipe Santos, Soroush Mehri, Negar Rostamzadeh, Yoshua Bengio, Christopher J Pal",
    title   = "Deep Complex Networks",
    journal = "arXiv preprint arXiv:1705.09792",
    year    = "2017"
}
```
