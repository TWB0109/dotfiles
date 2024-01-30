$env.config = {
  edit_mode: vi
  completions: {
    algorithm: "fuzzy"
  }
  rm: {
    always_trash: true
  }
}
def vim [ file: string = "." ] {
  if $file == "." { nvim . } else { nvim $file }
}
def pget [ service: string ] {
  let session = (bw unlock | tail -n 1 | sed 's/$//g' | awk '{print $6}')
  bw get password $service --session $session | wl-copy
  echo $"(ansi green)The password was coppied to your clipboard.(ansi reset) (ansi red)The clipboard will be cleared din 10 seconds(ansi reset)"
  sleep 10sec
  wl-copy -c
  bw lock --quiet
  echo $"(ansi green)Your clipboard has been cleared and your vault locked.(ansi reset)"
