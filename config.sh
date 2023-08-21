PROJECT_NAME=wrizzle
TAILWIND=on

if [[ ! -f data/wordoftheday ]]; then
    touch data/wordoftheday
    touch data/guess
    shuf -n1 static/words > data/wordoftheday
fi
