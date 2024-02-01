def create_left_prompt [] {
  let home =  $nu.home-path

  let dir = (
    if ($env.PWD | path split | zip ($home | path split) | all { $in.0 == $in.1 }) {
        ($env.PWD | str replace $home "~")
    } else {
      $env.PWD
    }
  )

  let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
  let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
  let path_segment = $"(ansi green_bold)[(whoami)(ansi yellow_bold)@(ansi red_bold)(hostname)](ansi reset)(ansi green) @ ($path_color)($dir)(ansi reset)"

  $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

$env.PROMPT_INDICATOR_VI_INSERT = {|| $"(ansi green_bold) [I] (ansi light_blue)~> (ansi reset)"}
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"(ansi blue_bold) [N] (ansi light_blue)~> (ansi reset)"}
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.scripts')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.local/bin')
$env.SSH_AUTH_SOCK = $"($env.XDG_RUNTIME_DIR)/ssh-agent.socket"
