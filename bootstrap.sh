#!/bin/bash -ex

sudo apt-get update &&
sudo apt-get install python3-venv

PROJECT=${1:-ansible-local-test}

git clone https://github.com/neilramsay/${PROJECT}.git &&
cd ${PROJECT} &&
python3 -m venv .venv &&
source .venv/bin/activate &&
pip install --require-virtualenv --requirement requirements.txt

ansible-playbook --connection=local --inventory-file inventory.yaml playbook.yaml
