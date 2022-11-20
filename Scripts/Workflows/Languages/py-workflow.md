# Template of Workflow Guide

## Official Docs
- [PyTermGUI](https://ptg.bczsalba.com/)
- [PyTest Guide](https://realpython.com/pytest-python-testing/)
- [Deps management with Poetry](https://realpython.com/dependency-management-python-poetry/)
- [Poetry usage](https://python-poetry.org/docs/basic-usage/)

## Install toolchain
```sh
sudo add-apt-repository-universe
python3 -m ensurepip --upgrade
python3 -m pip install ipython
python3 -m pip install --user pipx
python3 -m pipx ensurepath

pipx install poetry black
poetry completions fish > ~/.config/fish/completions/poetry.fish
```

## Create a new project

### Using Poetry
```sh
poetry new <project> --name <project>
poetry add typer pytermgui # for rich terminal apps

# <project>/pyproject.toml
# [tool.poetry.scripts]
# <project> = "<project>.__main__:main"
poetry run <project>

poetry show --tree
poetry export -f requirements.txt
```

### Directory structure
```text
<project>/
├── pyproject.toml
├── README.md
├── <project>
│   ├── __init__.py # global vars
│   ├── __main__.py # main loop
│   └── cli.py      # cli interface
└── tests
    └── __init__.py
```

### Dependencies
```sh
pip3 install pipreqs pip-tools
pipreqs --savepath=requirements.in && pip-compile
python -m pip freeze requirements.txt
cat requirements.txt | grep -E '^[^# ]' | cut -d= -f1 | xargs -n 1 poetry add
```

### Compile Python
```sh
python3 -m pipx install pyinstaller
dnf install python3-devel python3-devtools
pyinstaller "<path to script>" --name $NAME --onefile
```

### Debugging Bytecode

## Environments

### With Venv
```sh
# VENV: Python module, is used to create lightweight virtual environments
$NAME="project_name"
$VERSION="3.6.15"
python3 -m venv .venv --prompt=$NAME
source .venv/bin/activate
python -c "import sys; print(sys.executable)"
deactivate
```

### Virtualenv: a wrapper around venv
```sh
python3 -m pipx install virtualenv
```

### PyEnv: manage different version
```sh
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'set -gx PYENV_ROOT "$HOME/.pyenv"' >> $HOME/.config/fish/config.fish
echo 'set -gx PATH $PATH $PYENV_ROOT/bin' >> $HOME/.config/fish/config.fish
git clone https://github.com/pyenv/pyenv-virtualenv.git (pyenv root)/plugins/pyenv-virtualenv
pyenv install --list
# http s://github.com/pyenv/pyenv
```

### Using Virtualenv and PyEnv
```
pyenv install $VERSION
pyenv virtualenv $VERSION $NAME
pyenv activate $NAME
pyenv deactivate
# Plugin: https://github.com/pyenv/pyenv-virtualenv
# https://github.com/justinmayer/virtualfish

# Reference
# - https://docs.python.org/3/library/venv.html
# - https://pipenv-fork.readthedocs.io/en/latest/
```

## IDE setup
```bash
# PYLINT
python3 -m pipx install pylint
python3 -m pip install perflint
python3 -m pip install --user mypy
pylint --disable=invalid-name,missing-docstring \
	--load-plugins=perflint \
	--generate-rcfile > $HOME/.pylintrc
# References
# - https://jdhao.github.io/2018/09/20/disable_warning_neomake_pylint/
# - https://github.com/tonybaloney/perflint
# - https://github.com/tonybaloney/anti-patterns
```
