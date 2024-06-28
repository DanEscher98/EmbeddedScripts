#!/usr/bin/bash

FILE=$1
DIR=$2

DIR=${DIR:-~/.secrets}
FILE_ENC="$DIR/$FILE"

function encrypt() {
  local MODE="$1"
  local KFILE="$2"
  local FIN="$3"
  local FOUT="$4"

  openssl enc -aes-256-cbc -$MODE -pbkdf2 -kfile "$KFILE" \
    -in "$FIN" -out "$FOUT"
}

# try to decrypt the file
read -p "pswd: " pswd; echo "$pswd" > /tmp/enc_pswd
encrypt d "/tmp/enc_pswd" "$FILE_ENC" "/tmp/$FILE" 2>/dev/null

# if success, get file extension, edit and then encrypt
if [[ $? -eq 0 ]]; then
  EXT=`file --mime-type -b "/tmp/$FILE" | cut -d '/' -f2-`
  mv "/tmp/$FILE" "/tmp/$FILE.$EXT"
  lvim "/tmp/$FILE.$EXT"
  encrypt e "/tmp/enc_pswd" "/tmp/$FILE.$EXT" "$FILE_ENC"
  rm "/tmp/$FILE.$EXT"
else
  echo "INVALID PASSWORD"
fi
rm /tmp/enc_pswd
