set shell := ["nushell", "-c"]

# Print contents of `~/Justfile`
self:
  @bat --plain -n --language=make ~/Justfile.nu

# Generate a random DNA secuence
dna:
  @SAMPLE=`cat /dev/urandom | tr -dc 'AGCT' | fold -w 32 | head -n 5`;\
    declare -a TARGETS=("TTAGGG" "AA" "CAAT" "GATA" "TATA");\
    red=$(printf '\033[0;32m'); reset=$(printf '\033[0m');\
    for target in ${TARGETS[@]}; do \
      SAMPLE=`cat <<< $SAMPLE | sed "s/${target}/${red}&${reset}/g"` ;\
    done;\
    echo -ne "$(cat <<< "$SAMPLE" | sed 's/^/\\033\\a/')"



# Get a random quote with a playful display
fortune:
  @fortune -s \
    | tee >(cowsay -f "$(ls /usr/share/cowsay/cows | sort -R | head -1)" | lolcat --random >/dev/tty) \
    | trans --brief en:es | espeak -v spanish -k20

# As tldr, gives a summarized man-page
cheats CMD:
	@curl -sS cheat.sh/{{CMD}} | bat --style=plain

# Returns all files called when CMD executed
fileuse CMD SECS="2" PATH="$HOME":
  @mkdir -p /tmp/usefile; cmd="{{CMD}}";\
  FILE="`date +'%Y:%m:%d-%H:%M:%S'`-${cmd//[^[:alnum:]]/}";\
  timeout {{SECS}} strace -o /tmp/usefile/$FILE.txt {{CMD}} >/dev/null 2>&1 & sleep {{SECS}};\
  grep "^openat.*{{PATH}}" /tmp/usefile/$FILE.txt | sed 's/.*"\(.*\)".*/\1/'

# Search through the history with fzf
dejavu WORD:
  @# history | awk '{$1=""; print $0}' | sort | uniq
  @nushell -c "history" -m light | awk '{$1=""}1' | sort | uniq \
    | fzf --tac --layout=reverse --height=40% +s -e -q "{{WORD}}"

# Use ChatGPT from the command line
gpt PROMPT:
  @sgpt "Format the answer as a MARKDOWN file (title, subsections). REQUEST: '{{PROMPT}}'" \
    | fold -s -w100

# Get the average temperature of this PC
pc_temp:
  @TEMPS=`sensors -u | grep -E 'temp.*input' | awk -F: '{ print $2 }'`;\
  SUM=`paste -sd+ <<< $TEMPS | bc`;\
  CNT=`wc --words <<< $TEMPS`;\
  AVG=`bc <<< "scale=2;$SUM/$CNT"`;\
  printf "💻 \e[1;32m`hostname`\e[0m has \e[1;31m$AVG°C\e[0m on average\n"

# Get the weather of your local city
weather:
  @GLOBALIP=`curl -sS https://api.ipify.org`;\
  CITY=`curl -s "https://ipapi.co/$GLOBALIP/city/" | sed -e 's/ /%20/g'`;\
  curl -sS wttr.in/"$CITY" | less -r

# Download a single file or directory from a Github url
gitfile URL DIR='~/Downloads':
  @FMTURL=`echo {{URL}} | sed 's/\/\(blob\|tree\)\/[^\/]*\//\/trunk\//g'`;\
  FILE=`basename $FMTURL`;\
  svn export --force $FMTURL {{DIR}}/$FILE

# Read a literate rust file with highlighted syntax
liters PWD FILE:
  grep '^//!' {{PWD}}/{{FILE}} | cut -c 5- | glow --pager -
  
# Remame files recursively, removing spaces and special characters
sane_name PATH:
  @find {{PATH}} -name "* *" -print0 \
  | awk -v RS='\0' '{ print length(), $0 }' | sort -nr | cut -d ' ' -f 2-  \
  | while IFS= read -r file; do \
    path=`dirname "$file"`;\
    newname=$(echo `basename "$file"` | tr -s ' ' '_' | tr -d "\"\`*\'");\
    echo "$newname";\
    mv "$file" "$path/$newname";\
  done

tinyurl URL:
  curl --location --request POST 'https://tlyurl.com/api/domain/add' \
  --header "Authorization: Bearer $(nushell -c '$env.TLY_TOKEN')" \
  --header 'Content-Type: application/json' \
  --data-raw '{"domain": "{{URL}}"}'

clean_history:
  @echo "unimplemented!"
