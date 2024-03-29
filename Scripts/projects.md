---
title: Useless Tricks in Bash
author: Danyiel Colin
toc: true
---

# TODO

- join **png** and **jpg** as pdf
- compile a file by his extension
- list and kill problematic processes
- comando lspdf: CreationDate, Pages
- convert latex to png

## Documentations

- (Check unit testing for C)[https://libcheck.github.io/check/doc/check_html/check_4.html#index-ck_005fassert_005fint_005feq-1]

## Cool commands

- man file to pdf
    `man -t $cmd | ps2pdf - man_$cmd.pdf`
- List all users
    `cut -d: -f1 < /etc/passwd | sort`
- Set default application to open a file
    `mimeopen -d file.ext`
- Distro information
    `lsb_release -a`
- Image to icon
    ```bash
    convert image.png \
    -bordercolor white -border 1x1 -alpha set \
    -channel rgba -fill none -floodfill +0+0 white \
    -shave 1x1 -trim icon.png`
    ```
- Remove all file but save certain extensions
    `find . -maxdepth 1 -type f | grep -v -E "*.md|*.sh|*.tex" | xargs rm
    > find . -maxdepth 1 ! -type d`
- Send message to user from Telegram bot
    [Telegram API](https://core.telegram.org/bots/api)
    ```bash
    curl "https://api.telegram.org/bot<token>/sendMessage" \
    -H "Content-Type: application/json" --request POST \
    --data '{"chat_id":0123, "text":"Hello World!"}' 2> /dev/null | jq
    ```

## File manipulation

- cut pdf
    `gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dSAFER -sPageList=1-
    -sOutputFile=myPDF_out.pdf myPDF.pdf`
- join pdf
    `gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -q -dAutoRotatePages=/None
    -sOutputFile=myPDF_out file1.pdf file2.pdf`
    `convert filein fileout`
- `tex` to `png`
    `texi2dvi file.txt && dvips -E file.dvi &&
    gs -dSAFER -dEPSCrop -r600 -sDEVICE=pngalpha -o foo.png file.ps`
- `png` to icon
    `convert image.png \
    -bordercolor white -border 1x1 -alpha set \
    -channel rgba -fill none -floodfill +0+0 white \
    -shave 1x1 -trim icon.png`

## Pages for curl

- [Weather](https://wttr.i/:help)
- [An online man](cheat.sh/man)
- [My global ip](https://ifconfig.me/all.json)
- [Online dictionary](dict://dict.org/d:word)
- [Cryptocurrencies plot](rate.sx/coin@time)
- [A little news paper](getnews.tech/linux)
- Encapsulate an address
    `curl -F 'shorten=https://www.google.com' https://0x0.st`

## APIs
- [StarWars](https://swapi.dev/)
- [Weather](https://openweathermap.org/api)
- [Fake API](https://jsonplaceholder.typicode.com/)
- [Generate data](https://generatedata.com/generator)
- [Mocking data](https://www.mockaroo.com/)
- [Rick and Morty](https://rickandmortyapi.com)

    ---

    ```json
    {
    "Refreshed commands": {
    "find": "fd-find (fd)",
    "cat":  ["bat", "glow"],
    "ls":   "exa",
    "top":  ["htop", "glances"],
    "du":   ["gud", "dua"],
    "rm":   "trash",
    "cd":   "exa"
    },
    "Novel tools": {
    "jq": "json parser",
    "asciinema": "record a terminal",
    "asciicast2gif": "convert .cast to .gif",
    "svg-term": "convert .cast to .svg for web",
    "trans": "wrapper to Google Translate",
    "fswatch": "notify about changes in file system"
    },
    "Developer":    ["strip", "upx", "gdb", "lldb", "objdump"],
    "Fundamental":  ["ls", "cd", "pwd", "find", "tree", "clear"],
    "DirsFiles":    ["mv", "cp", "rm", "touch", "mkdir", "rename"],
    "System":       ["top", "psensors", "ps", "jobs", "fg", "bg"],
    "textstreams":  ["grep", "tr", "echo", "cat", "jq", "sed", "wc",
    "column", "rev"],
    "users":        ["whoami", "chmod", "chown", "whereis", "sudo"],
    "conversion":   ["pandoc", "ssconvert"],
    "Swiss tools":  ["awk", "gs"],
    "Network Admin":["ip", "nmcli"],
    "Security":     ["iptables", "selinux", "lynis", "clamav"],
    "Funny ones":   ["cowsay", "spark", "fortune", "figlet", "espeak",
    "oneko", "toilet", "rig", "factor", "cmatrix",
    "asciiview", "factor"],
    "WebWrappers":  ["ani-cli", "wikit", "howdoi"],
    "Work tools":   ["docker", "git"]
    }
    ```

    ```bash
    find ~/.local/share/nvim/swap/ -type f -name "*.sw[klmnop]" -delete
    find -name "*.py" | xargs cat | awk '!/^$/{ print }' | wc -l
    ps -A | grep -i evince | tee /dev/tty | awk '{ print  }' | \
        xargs -I % kill --verbose --signal QUIT %
    find ~/.local/share/nvim/swap/ -type f -name "*.sw[a-z]" -delete man \
    -t <cmd> | ps2pdf - <cmd>.pdf
    figlet -f smscript "Good Morning!" | lolcat
    cat /dev/urandom | tr -dc 'AGCT' | fold -w 32 | head -n 10
    fortune | trans en:es --brief | espeack -v en:es
    sudo udevadm control --reload-rules
    grep --include=\*.{c,h} -winr ./ -e "transpose"
    man -k "word"

    ffmpeg -i movie.gif -movflags faststart -pix_fmt yuv420p \
        -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" movie.mp4 -r 30
    strace nvim +:q 2>&1 | grep "^openat.*$HOME" | sed 's/.*"\(.*\)".*/\1/'
    strace fish exit 2>&1 | grep "^openat.*$HOME" | sed 's/.*"\(.*\)".*/\1/'

    python3 -m pipx install git-filter-repo
    git filter-repo --invert-paths --path "<path to file>" --force
    curl -sS "ifconfig.me/ip" | xargs -I% curl -sS "ipinfo.io/%?token=$IPINFOTOKEN"
    ```

## Shortcuts
- In Vim or Less pager:
    - "/pattern", "n" (next), "&/pattern" (only show that lines)

## Worthy Projects
- [A native notebook](https://nteract.io/)
- [Markdown reader (Go)](https://github.com/charmbracelet/glow)
- [Exercises on demand](https://exercism.org/)
- [Futhark language](https://futhark-lang.org/)
- [UML compiler](https://planttext.com/)
- [GDB colors](https://stackoverflow.com/a/17341335)

## Must have Github repos
- `gh repo clone miguelraz/JuliaTutorials`


## References 
- [Regex in GREP](https://linuxize.com/post/regular-expressions-in-grep/)
- [gitignore the right way](https://labs.consol.de/development/git/2017/02/22/gitignore.html)
