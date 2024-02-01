$env.PROMPT_INDICATOR_VI_INSERT = {|| $"(ansi green_bold) [INSERT] (ansi light_blue)~> (ansi reset)"}
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"(ansi blue_bold) [NORMAL] (ansi light_blue)~> (ansi reset)"}
$env.PROMPT_COMMAND = {|| $"(ansi green_bold)[(whoami)(ansi yellow_bold)@(ansi red_bold)(hostname)](ansi reset)(ansi green):(pwd)(ansi reset)" }
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.scripts')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.local/bin')
$env.SSH_AUTH_SOCK = $"($env.XDG_RUNTIME_DIR)/ssh-agent.socket"
