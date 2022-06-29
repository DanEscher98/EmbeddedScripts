sudo add-apt-repository-universe
sudo apt install python3-pip
pip install ipython
# Python work-flow

## Python
```bash
# Installation

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
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'set -gx PYENV_ROOT "$HOME/.pyenv"' >> $HOME/.config/fish/config.fish
echo 'set -gx PATH $PATH $PYENV_ROOT/bin' >> $HOME/.config/fish/config.fish
git clone https://github.com/pyenv/pyenv-virtualenv.git (pyenv root)/plugins/pyenv-virtualenv
pyenv install --list
# http s://github.com/pyenv/pyenv


# PYENV with VIRTUALENV
pyenv install $VERSION
pyenv virtualenv $VERSION $NAME
pyenv activate $NAME
pyenv deactivate
# Plugin: https://github.com/pyenv/pyenv-virtualenv
# https://github.com/justinmayer/virtualfish


# Python requirements
pip3 install pipreqs pip-tools
pipreqs --savepath=requirements.in && pip-compile
python -m pip freeze requirements.txt


# PIPX: Install executable modules
python3 -m pip install --user pipx


# PYLINT
python3 -m pipx install pylint
python3 -m pip install perflint
pylint --disable=invalid-name,missing-docstring \
	--load-plugins=perflint \
	--generate-rcfile > $HOME/.pylintrc
# References
# - https://jdhao.github.io/2018/09/20/disable_warning_neomake_pylint/
# - https://github.com/tonybaloney/perflint
# - https://github.com/tonybaloney/anti-patterns


# COMPILE PYTHON
python3 -m pipx install pyinstaller
dnf install python3-devel python3-devtools
pyinstaller "<path to script>" --name $NAME --onefile



# Different versions

# Reference
# - https://docs.python.org/3/library/venv.html
# - https://pipenv-fork.readthedocs.io/en/latest/

```
