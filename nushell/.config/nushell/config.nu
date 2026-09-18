$env.config = {
  edit_mode: vi
  completions: {
    algorithm: "fuzzy"
  }
  rm: {
    always_trash: true
  }
  show_banner: false,
}

# Generate a Bitwarden entry using rbw
def "rbw-gen" [
    --uri: string    # The URL for the entry (e.g., google.com)
    --length: int = 20 # Password length (defaults to 20)
    entry_name?: string # The name of the entry
    email?: string      # The email/username for the entry
] {
    # Interactive prompts if positional arguments are missing
    let name = if ($entry_name | is-empty) { 
        input "Entry Name (e.g., 'google'): " 
    } else { 
        $entry_name 
    }

    let user_email = if ($email | is-empty) { 
        input "Email/Username: " 
    } else { 
        $email 
    }

    let target_uri = if ($uri | is-empty) { 
        input "URI (e.g., 'google.com'): " 
    } else { 
        $uri 
    }

    # Execute the rbw command
    rbw gen --uri $target_uri $length $name $user_email
}

def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  ^yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != $env.PWD and ($cwd | path exists) {
    cd $cwd
  }
  rm -fp $tmp
}

alias journal = nvim +"Neorg journal today"

# Finally we have jobs
alias fg = job unfreeze
def kj [] { 
  job list | get id | each { job kill $in }
}

def --wrapped nix-portable [...args] {
    with-env { NP_RUNTIME: "bwrap" } {
        ^nix-portable ...$args
    }
}

source ~/.zoxide.nu

# Pyenv
$env.PYENV_ROOT = "~/.pyenv" | path expand
if (( $"($env.PYENV_ROOT)/bin" | path type ) == "dir") {
  $env.PATH = $env.PATH | prepend $"($env.PYENV_ROOT)/bin" }
$env.PATH = $env.PATH | prepend $"(pyenv root)/shims"

alias vim = nvim
