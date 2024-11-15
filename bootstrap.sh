#!/bin/bash -ex

PROJECT=${1:-ansible-local-test}

sudo apt-get update &&
sudo apt-get install python3-venv

git clone https://github.com/neilramsay/${PROJECT}.git &&
cd ${PROJECT} &&
python3 -m venv .venv &&
source .venv/bin/activate &&
pip install --require-virtualenv --requirement requirements.txt

ansible-playbook --inventory-file inventory.yaml playbook.yaml
