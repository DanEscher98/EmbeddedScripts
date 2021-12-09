# Defined in /tmp/fish.3hFoAI/newc.fish @ line 2
function newc --argument name
    if not count $argv >/dev/null
        return 1
    end

    if git rev-parse >>/dev/null
        git checkout -b $name
        mkdir $name && cd $name
    else
        mkdir $name && cd $name
        git init
    end
    mkdir lib target
    echo '#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	printf("Hello %s!\n", argv[1]);
	return EXIT_SUCCESS;
}' >main.c

    echo 'TARGET = main
FLAGS = -Wall -pedantic -std=c99
HEADERS =

$(TARGET).out: $(TARGET).c
	clang $(TARGET).c $(FLAGS) $(HEADERS) -o target/$(TARGET).out

run: $(TARGET).out
	./target/$(TARGET).out $(USER)	

clear:
	rm -f target/*.out
	clear && ls' >Makefile

    echo "# $name" >README.md

    echo "target/" >.gitignore

    git add . && git commit -am "$name first commit"
    git push --set-upstream origin $name
end
