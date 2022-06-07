sudo add-apt-repository-universe
sudo apt install python3-pip
pip install ipython
# Python work-flow

## Python
```bash
# Installation


# Python requirements
pip3 install pipreqs pip-tools
pipreqs --savepath=requirements.in && pip-compile

# PIPX: Install executable modules
python3 -m pip install --user pipx


# Environment
# VENV: Python module, is used to create lightweight virtual environments
$NAME="project_name"
$VERSION="3.6.15"
python3 -m venv .venv --prompt=$NAME
source .venv/bin/activate
python -c "import sys; print(sys.executable)"
deactivate

# VIRTUALENV: A wrapper around venv
python3 -m pipx install virtualenv


# PYENV: a python environment manager, allows to install and run off multiple installations
pyenv install --list
# https://github.com/pyenv/pyenv

# PYENV with VIRTUALENV
pyenv install $VERSION
pyenv virtualenv $VERSION $NAME
pyenv activate $NAME
source deactivate
# Plugin: https://github.com/pyenv/pyenv-virtualenv
# https://github.com/justinmayer/virtualfish



# Different versions

# Reference
# - https://docs.python.org/3/library/venv.html
# - https://pipenv-fork.readthedocs.io/en/latest/

```

## Vagrant: kvm, libvirt, VirtualBox
```bash
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
sudo dnf group install --with-optional virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
lsmod | grep kvm
# https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/index.html
# https://ostechnix.com/how-to-use-vagrant-with-libvirt-kvm-provider/


```


## Docker and Podman
```bash

```


## Nim Language


## SSH Server and NFS
