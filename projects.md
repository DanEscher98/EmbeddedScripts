# TODO

- join **png** and **jpg** as pdf
- compile a file by his extension
- list and kill problematic processes
- comando lspdf: CreationDate, Pages
- convert latex to png

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
    `
  > convert image.png \
  >       -bordercolor white -border 1x1 -alpha set \
  >       -channel rgba -fill none -floodfill +0+0 white \
  >       -shave 1x1 -trim icon.png`
- Remove all file but save certain extensions
    `find . -maxdepth 1 -type f | grep -v -E "*.md|*.sh|*.tex" | xargs rm
  > find . -maxdepth 1 ! -type d`

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

- Weather: "https://wttr.i/:help"
- An online man
  > cheat.sh/cmd
- My global ip: "https://ifconfig.me/all.json"
- Online dictionary
  > dict://dict.org/d:word
- Cryptocurrencies plot
  > rate.sx/coin@time
- Encapsulate an address
    `curl -F 'shorten=https://www.google.com' https://0x0.st`
- A little news paper
    `getnews.tech/linux`

---

```json
{
    "Refreshed commands": {
        "find": "fd-find (fd)",
        "cat":  "bat", "ls":   "exa",
        "top":  "htop",
        "du":   ["gud", "dua"],
        "rm":   "trash"
    },
    "Novel tools": {
        "jq": "json parser",
        "asciinema": "record a terminal",
        "asciicast2gif": "convert .cast to .gif",
        "svg-term": "convert .cast to .svg for web",

    },
    "Fundamental":  ["ls", "cd", "pwd", "find", "tree", "clear"],
    "DirsFiles":    ["mv", "cp", "rm", "touch", "mkdir", "rename"],
    "System":       ["top", "psensors", "ps"],
    "textstreams":  ["grep", "tr", "echo", "cat", "jq", "sed", "wc",
                    "column"],
    "users":        ["whoami", "chmod", "chown", "whereis", "sudo"],
    "Swiss tools":  ["awk", "gs"],
    "Network Admin":["ip", "nmcli"],
    "Security":     ["iptables", "selinux", "lynis", "clamav"],
    "Funny ones":   ["cowsay", "spark"],
    "Work tools":   ["docker", "git"]
}
```

```sh
find ~/.local/share/nvim/swap/ -type f -name "*.sw[klmnop]" -delete
ps -A | grep -i evince | tee /dev/tty | awk '{ print  }' | xargs -I %
kill --verbose --signal QUIT % find ~/.local/share/nvim/swap/ -type f \
    -name "*.sw[a-z]" -delete
find ~/.local/share/nvim/swap/ -type f -name "*.sw[a-z]" -delete man \
    -t <cmd> | ps2pdf - <cmd>.pdf
```