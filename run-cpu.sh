#!/bin/bash

# docker container deamonで起動
docker run -p 8888:8888 -d -v /home/workspace:/root/user/workspace --name kaggle kaggle /sbin/init

# jupyterlab起動 localhost:8888/lab
docker exec -it kaggle jupyter-lab  --allow-root --port=8888 --no-browser --NotebookApp.token='' --ip=0.0.0.0 --notebook-dir=/root/user/workspace/jupyterlab
