#!/usr/bin/bash

mkdir --parents renamed_files nomodified
counter=0

find -maxdepth 1 -type f -name "*.pdf" | while IFS= read -r file; do
  title=$(exiftool -title "$file" | awk -F': ' '{ print $2 }')
  author=$(exiftool -author "$file" | awk -F': ' '{ print $2 }')

  if [ -z "$title" ]; then
    mv "$file" nomodified
    echo "unsufficient information"
  else
    if [[ ! -z "$author" ]]; then
      title="$title - $author"
    fi
    if [ -f "renamed_files/$file.pdf" ]; then
      echo "repeated name file"
      continue
    fi
    mv "$file" renamed_files/"$title".pdf

    counter=$((counter+1))
    printf "$counter)\t$title\n"
  fi
done
