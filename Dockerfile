FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ build-essential ca-certificates software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# install python
RUN add-apt-repository ppa:deadsnakes/ppa \
&& apt-get update && apt-get install -y python3-distutils \
&& apt-get install -y python3.8 \
&& wget -O ./get-pip.py https://bootstrap.pypa.io/get-pip.py \
&& python3.8 ./get-pip.py \
&& ln -s /usr/bin/python3.8 /usr/local/bin/python3 \
&& ln -s /usr/bin/python3.8 /usr/local/bin/python

# install common python packages
# JupyterLab関連のパッケージ（いくつかの拡張機能を含む）
# 必要に応じて、JupyterLabの拡張機能などを追加してください
RUN apt-get install -y python3-setuptools
RUN python3 -m pip install --upgrade pip \
&&  pip install --no-cache-dir \
    black \
    jupyterlab \
    jupyterlab_code_formatter \
    jupyterlab-git \
    lckr-jupyterlab-variableinspector \
    jupyterlab_widgets \
    ipywidgets \
    import-ipynb

# 基本パッケージ
# Pythonでよく利用する基本的なパッケージです
# JupyterLabの動作には影響しないので、必要に応じてカスタマイズしてください
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scipy \
    scikit-learn \
    pycaret \
    matplotlib \
    japanize_matplotlib \
    mlxtend \
    seaborn \
    plotly \
    requests \
    beautifulsoup4 \
    Pillow \
    opencv-python

# install pytorch

# set working directory
WORKDIR /root/user

# config and clean up
RUN ldconfig \
&& apt-get clean \
&& apt-get autoremove

