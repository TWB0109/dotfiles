import subprocess


def get_color_scheme_preference():
    try:
        result = subprocess.run(
            ["gsettings", "get", "org.gnome.desktop.interface", "color-scheme"],
            capture_output=True,
            text=True,
            check=True,
        )
        scheme = result.stdout.strip().replace("'", "")
        if scheme == "prefer-dark":
            return "dark"
        elif scheme == "prefer-light":
            return "light"
        else:
            return "unknown"

    except FileNotFoundError:
        print("Error: 'gsettings' command not found. Ensure GNOME/GTK is installed.")
        return "unknown"
    except subprocess.CalledProcessError as e:
        print(f"Error executing gsettings command: {e}")
        print(f"Stderr: {e.stderr}")
        return "unknown"
    except Exception as e:
        print(f"An Unexpected error occurred: {e}")
        return "unknown"


config.load_autoconfig(False)

c.aliases = {"q": "quit", "w": "session-save", "wq": "quit --save"}

c.auto_save.session = True
config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")

config.set("content.headers.accept_language", "", "https://matchmaker.krunker.io/*")

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
    "https://*.slack.com/*",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://docs.google.com/*",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://drive.google.com/*",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:136.0) Gecko/20100101 Firefox/139.0",
    "https://accounts.google.com/*",
)

# Load images automatically in web pages.
# Type: Bool
config.set("content.images", True, "chrome-devtools://*")

# Load images automatically in web pages.
# Type: Bool
config.set("content.images", True, "devtools://*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "chrome-devtools://*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "devtools://*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "chrome://*/*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "qute://*/*")

# Allow locally loaded documents to access remote URLs.
# Type: Bool
config.set(
    "content.local_content_can_access_remote_urls",
    True,
    "file:///home/brandon/.local/share/qutebrowser/userscripts/*",
)

# Allow locally loaded documents to access other local URLs.
# Type: Bool
config.set(
    "content.local_content_can_access_file_urls",
    False,
    "file:///home/brandon/.local/share/qutebrowser/userscripts/*",
)

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set("content.notifications.enabled", True, "https://www.reddit.com")
config.set("content.notifications.enabled", True, "https://www.youtube.com")
config.set("content.notifications.enabled", True, "https://web.whatsapp.com")

c.downloads.location.directory = "/home/brandon/Downloads"

c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "history",
    "filesystem",
]
c.statusbar.show = "always"

c.tabs.position = "left"

c.tabs.show = "multiple"

c.tabs.width = "15%"

c.url.default_page = "startpage.brandonsp.com"

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/search?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "g": "https://www.google.com/search?q={}",
    "yt": "https://youtube.com/results?search_query={}",
    "gh": "https://github.com/search?q={}",
    "fh": "https://flathub.org/apps/search?q={}",
    "bv": "https://search.brave.com/search?q={}",
}

c.url.start_pages = ["startpage.brandonsp.com"]
c.window.transparent = False

c.zoom.default = "100%"

c.fonts.default_family = '"Adwaita Sans"'

c.fonts.default_size = "11pt"

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = f"11pt {c.fonts.default_family}"

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = f"11pt {c.fonts.default_family}"

# Font used for prompts.
# Type: Font
c.fonts.prompts = f"11pt {c.fonts.default_family}"

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = f"11pt {c.fonts.default_family}"

# Bindings for normal mode
config.bind("<Ctrl+e>", "cmd-set-text -s :open -p")
config.bind("E", "cmd-set-text -s :open -t")
config.bind("F", "hint links spawn flatpak run app.zen_browser.zen {hint-url}")
config.bind("M", "hint links spawn mpv {hint-url} --hwdec=auto")
config.bind("P", "hint links spawn mpv {hint-url} --no-video")
config.bind("Z", "hint links spawn ghostty -e ytdlp {hint-url}")
config.bind("e", "cmd-set-text -s :open")
config.bind("xb", "config-cycle statusbar.show in-mode always")
config.bind("xt", "config-cycle tabs.show multiple always")
config.bind(
    "xx",
    "config-cycle statusbar.show in-mode always;;config-cycle tabs.show multiple always",
)
config.bind("<Ctrl+l>", "edit-url")

color_scheme = get_color_scheme_preference()

if color_scheme == "dark":
    config.source("themes/minimal/base16-gruvbox-dark-hard.config.py")
elif color_scheme == "light":
    config.source("themes/minimal/base16-gruvbox-light-hard.config.py")
else:
    print("Dark mode preference could not be determined or is not set.")

c.editor.command = ["neovide", "{file}", "+:normal {line}G{column0}l"]
