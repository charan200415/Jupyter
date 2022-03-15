#!/bin/bash
#jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''
wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
dpkg -i cloudflared-linux-amd64.deb
echo installed cloud
/etc/init.d/ssh start
echo SSH Started
cloudflared tunnel --origincert scripts/cert.pem --config scripts/config.yml run ssh > /dev/null &
echo ssh server started
jupyter notebook --ip=0.0.0.0 --port=$PORT --config=./conf/jupyter.py
