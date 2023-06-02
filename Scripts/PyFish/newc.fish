#!/usr/share/fish
# Defined in /tmp/fish.24iTBc/newc.fish @ line 2
function newc --argument name
    if not count $argv >/dev/null
        return 1
    end

    # INITIAL SETUP
    if git rev-parse >>/dev/null
        git checkout -b $name
        mkdir $name && cd $name
    else
        mkdir $name && cd $name
        git init
    end
    mkdir src target test

    # TEMPLATES
    echo '#include "lib.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	printf("Hello %s!\n", argv[1]);
	return EXIT_SUCCESS;
}' >src/main.c

    echo '#include "lib.h"

int shift(int n) {
	return n << 1;
}' >src/lib.c

    echo 'int shift(int);' >src/lib.h

    echo '#include "../src/lib.h"
#include <clove.h>

CLOVE_TEST(FirstTest)
{
	int a = shift(1);
	CLOVE_INT_EQ(a, 2);
}

CLOVE_RUNNER(FirstTest)' >test/test.c

    echo 'CC = clang
TARGET	= main
FLAGS	= -Wall -pedantic -std=c99
HEADERS = src/lib.c

$(TARGET).out: src/$(TARGET).c
	$(CC) src/$(TARGET).c $(FLAGS) $(HEADERS) -o target/$(TARGET).out

run: $(TARGET).out
	./target/$(TARGET).out $(USER)	

test.out: test/tests.c
	$(CC) test/tests.c $(HEADERS) -g -o target/tests.out

test: test.out
	valgrind -s --leak-check=full target/tests.out 2> target/mem_analysis.log
	cat target/mem_analysis.log | cut --complement -d' ' -f1 | uniq

clear:
	rm -f target/*.out
	clear && ls' >Makefile

    echo "# $name" >README.md

    echo "target/" >.gitignore

    git add . && git commit -am "$name first commit"
    git push --set-upstream origin $name
end
