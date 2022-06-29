function newpy --argument NAME
    if not count $argv >/dev/null
        return 1
    end

    set WORKDIR "$NAME""_py"
    mkdir $WORKDIR
    cd $WORKDIR

    python3 -m venv .venv --prompt=$NAME
    source .venv/bin/activate.fish

    mkdir $NAME tests docs

    echo '__version__ = "0.1.0"' >$NAME/__init__.py
    echo "from $NAME.cli import get_args
def main():
	args = get_args()

if __name__ == '__main__':
	main()" >$NAME/__main__.py

    echo "from argparse import ArgumentParser, Namespace

def get_args() -> Namespace:
	parser = ArgumentParser(prog='$NAME')
	return parser.parse_args()
	" >$NAME/cli.py

    echo "NAME = $NAME" >Makefile
    echo 'FLAGS ?= --help

init: .venv/bin/activate.fish
	source $(PWD)/.venv/bin/activate.fish

compile: $(NAME)/__main__.py
	pyinstaller $(NAME)/__main__.py --name=$(NAME) --onefile

run: $(NAME)/__main__.py
	@python -m $(NAME) $(FLAGS)

clean:
	rm -rdf build dist $(NAME)/__pycache__/ $(NAME).spec' >>Makefile
end
