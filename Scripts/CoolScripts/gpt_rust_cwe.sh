#!/usr/bin/bash

API_KEY="YOUR_API_KEY"

function loading() {
  step="$1"; total="$2"; SIZE=50

  percentage=$((step * 100 / total))
  filled_length=$((percentage * SIZE / 100))
  progress=$(printf "[\e[1;34m%-${SIZE}s\e[0m]" $(printf "%0.s#" $(seq $filled_length)))

  printf "%s %3d%%\033[0K\r" "$progress" "$percentage"
}

function gen_name() {
  words_json=$(curl -sS "https://random-word-api.herokuapp.com/word?length=4&number=2&lang=en")
  echo "$words_json" | sed 's/[][]//g; s/"//g; s/,/ /g' | tr ' ' '_' 
}

function prompt() {
  echo 'TITLE[CWE-'$1': C17 vs C++20 vs Rust]
INTRO[brief explanation of the CWE-'$1'; code blocks with comments]
NOTE[AVOID introducing each language, OMIT it; straight to the point]
NOTE[languages of interest: C17, C++20, Rust (use modern features for C/C++)]
NOTE[DONT be biased towards Rust]
BODY[for EACH language discuss how they handle the CWE-'$1' idiomatically]
BODY[using modern features the CWE is eradicated or mitigate? how?]
CODE[for EACH language add an IDIOMATIC example in a code block; look for EDGE cases]
CODE[include COMMENTS explaining each LINE of code]
CODE[rely on language FEATURES more than coding patterns; look for weaknesses]
CODE[write all the code in a single main function, use scopes if needed]
CODE[ENSURE the CORRECTNESS of the examples; ENSURE they are related with BODY]
BODY[add a short conclusion summarizing the cases and giving insights]
STYLE[be brief and concise]
FORMAT[answer as a MARKDOWN file, title h1 and subsections]'
}

name=$(gen_name)
mkdir -p output/"$name"
prompt '#' > output/"$name"/prompt-$(date +%Y%m%d_%H%M%S).txt

declare -a CWE=(119 120 121 122 125 126 190 191 401 415 416 476 502 676 762 943)
len=${#CWE[@]}
counter=0
start_time=$(date +%s)

loading 0 $len
for id in ${CWE[@]}; do
  podman run --rm \
    --env OPENAI_API_KEY="$API_KEY" \
    --volume gpt-cache:/tmp/shell_gpt \
    ghcr.io/ther1d/shell_gpt --chat cwe --temperature 0.2 "$(prompt $id)" 2>/dev/null \
    | fold -s -w100 > output/"$name"/cwe-$id.md

  ((counter++))
  loading $counter $len
done

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))
errors=$(find ./output/$name -type f -empty | wc -l)
find ./output/$name -type f -empty -delete

printf "\nQuery \'\e[1;32m$name\e[0m\' finished in \e[1;32m%s\e[0m - ERRORS: \e[1;31m$errors\e[0m\n\n" \
  $(date -d@$elapsed_time -u +%H:%M:%S)
