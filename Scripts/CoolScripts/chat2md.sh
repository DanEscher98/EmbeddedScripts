#!/usr/bin/bash

# Generate a readable md file from a Whatsapp chat txt
# 0. Remove:
#   - `<Media ommited>` lines
#   - Irrelevant sequences and its variants ("jajaja", xD)
# 1. Group lines by day
# 2. One block per each dialogue turn of character
# 3. Output in dialogue format (Keept just first name)
# 4. Take care formating lists blocks
# 5. Feed each block day to ChatGPT to summarize the
#   dialogue and label its contents
#
