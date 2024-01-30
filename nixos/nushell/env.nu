$env.PROMPT_INDICATOR_VI_INSERT = {|| $"(ansi green_bold) [I] > (ansi reset)"}
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"(ansi red_bold) [N] > (ansi reset)"}
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.scripts')
$env.PATH = ($env.PATH | split row (char esep) | prepend '~/.local/bin')
$env.SSH_AUTH_SOCK = $"($env.XDG_RUNTIME_DIR)/ssh-agent.socket"
