#!/bin/bash

mkdir stage23 && cp -r /workspaceblobstore/xin/stage/* ~/stage23/
cp -r /workspaceblobstore/xin/.deepspeed_env ~/

conda create -n bony python=3.9 -y
conda init bash
source ~/.bashrc
conda activate bony

pip install -r requirements.txt

## set deepseed for sudo

sudo rm -rf /root/.ssh
cp -r ~/.ssh /root/.ssh
sudo chown root:root -R /root/.ssh

sed -i "84s/            exports, f\"cd {os.path.abspath('.')};\", sys.executable, \"-u\", \"-m\", \"deepspeed.launcher.launch\",/            exports, f\"cd {os.path.abspath('.')};\", \"sudo\", sys.executable, \"-u\", \"-m\", \"deepspeed.launcher.launch\",/"/home/xinzhang3/.conda/envs/bony/lib/python3.9/site-packages/deepspeed/launcher/multinode_runner.py
