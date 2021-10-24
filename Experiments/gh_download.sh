# ramboxapp/community-edition

curl --silent https://api.github.com/repos/$1/releases/latest \
    | jq -r '.assets[].browser_download_url' \
    | grep -E "64.*rpm|64" \
    | wget -i -

