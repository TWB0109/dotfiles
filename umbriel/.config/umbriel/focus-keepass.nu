#!/usr/bin/env nu

let id = (umbriel windows --json | from json | find KeePass | get id.0?)

if $id != null {
    umbriel msg $"window-focus-warp:($id)"
} else {
    try {
        # The caret (^) tells Nushell to run this as an external command,
        # which allows try/catch to properly capture "command not found" errors.
        ^keepassxc
    } catch {
        notify-send "Launch Failed" "KeePassXC is not installed or not in PATH." --urgency=critical
    }
}
