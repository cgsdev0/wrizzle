# sse

topic() {
  echo "game"
}

if [[ ! -f "data/conns" ]]; then
  touch data/conns
  echo "0" > data/conns
fi

conns() {
  echo "$(cat data/conns) player(s) connected"
}
on_open() {
  awk '{$1=$1+1}1' data/conns | sponge data/conns
  event conns "$(conns)" | publish game
}

on_close() {
  awk '{$1=$1-1}1' data/conns | sponge data/conns
  event conns "$(conns)" | publish game
}
