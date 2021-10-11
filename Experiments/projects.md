# TODO

- join **png** and **jpg** as pdf
- compile a file by his extension
- list and kill problematic processes
- comando lspdf: CreationDate, Pages
- convert latex to png


# Cool commands
- List all users
  > cut -d: -f1 < /etc/passwd | sort
- Image to icon
  > convert image.png \
  >       -bordercolor white -border 1x1 -alpha set \
  >       -channel RGBA -fill none -floodfill +0+0 white \
  >       -shave 1x1 -trim icon.png 
- Remove all file but save certain extensions
  > find . -maxdepth 1 -type f | grep -v "md\|sh\|tex" | xargs rm
  > find . -maxdepth 1 ! -type d 

# Pages for curl
- Weather
  > https://wttr.i/:help
- An online man 
  > cheat.sh/cmd
- My global ip
  > https://ifconfig.me/all.json
- Online dictionary
  > dict://dict.org/d:word
- Cryptocurrencies plot
  > rate.sx/coin@time
- Encapsulate an address
  > curl -F 'shorten=https://www.google.com' https://0x0.st
- A little news paper
  > getnews.tech/linux

---

```json
{
    "Refreshed commands": {
        "find": "fd-find (fd)",
        "cat":  "bat",
        "ls":   "exa",
        "top":  "htop",
        "du":   "dua"
    },
    "Novel tools": {
        "jq": "json parser",
        "asciinema": "record a terminal",
        "asciicast2gif": "convert .cast to .gif",
        "svg-term": "convert .cast to .svg for web",

    },
    "Fundamental":  ["ls, cd, pwd"]
    "Basic tools":  ["column"],
    "Swiss tools":  ["awk", "gs"],
    "Network Admin":["ip", "nmcli"],
    "Security":     ["iptables", "selinux", "lynis", "clamav"],
    "Funny ones":   ["cowsay", "spark"],
    "Work tools":   ["docker", "git"]
}
```
find ~/.local/share/nvim/swap/ -type f -name "*.sw[klmnop]" -delete
ps -A | grep -i evince | tee /dev/tty | awk '{ print  }' | xargs -I % kill --verbose --signal QUIT %
find ~/.local/share/nvim/swap/ -type f -name "*.sw[a-z]" -delete
find ~/.local/share/nvim/swap/ -type f -name "*.sw[a-z]" -delete
