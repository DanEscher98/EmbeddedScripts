
# Clean compile messages
pdflatex --interaction=nonstopmode --shell-escape main.tex | awk 'BEGIN{IGNORECASE = 1}/warning|!/,/^$/;'

# Clean cache files
find . -maxdepth 1 -type f | grep -v "tex\|pdf" | xargs rm

# Count and sort files by number of word
ls -ap | grep -v / | xargs wc | sort --key=2n | tee /dev/tty | wc -l | xargs -I % echo "There are % files."

