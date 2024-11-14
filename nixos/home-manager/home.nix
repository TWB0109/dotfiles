{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  makoStatus = pkgs.writeShellScriptBin "makoStatus" ../scripts/makoStatus;
  makoAction = pkgs.writeShellScriptBin "makoAction" ../scripts/makoAction;
  appil = pkgs.writeShellScriptBin "appil" ../scripts/appil;
  hprop = pkgs.writeShellScriptBin "hprop" ../scripts/hprop;
  changeTheme = pkgs.writeShellScriptBin "changeTheme" ../scripts/changeTheme;
  onResume = pkgs.writeShellScriptBin "onResume" ../scripts/onResume;
in {
  imports = [../hypr/hyprland.nix];

  home.username = "brandon";
  home.file = {
    "${config.xdg.configHome}/waybar/style-light.css" = {
      enable = true;
      source = ../styles/waybar/style-light.css;
    };
    "${config.xdg.configHome}/waybar/style-dark.css" = {
      enable = true;
      source = ../styles/waybar/style-dark.css;
    };
    "${config.xdg.configHome}/ignis/config.py" = {
      enable = false;
      source = ../ignis/config.py;
    };
    "${config.xdg.dataHome}/backgrounds" = {
      enable = true;
      recursive = true;
      source = ../wallpapers;
    }; 
  };

  home.sessionVariables = {
    terminal = "kitty";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE  = "fcitx";
    XMODIFIERS    = "@im=fcitx";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "x-scheme-handler/http" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "x-scheme-handler/https" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "x-scheme-handler/chrome" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "text/html" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-htm" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-html" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-shtml" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/xhtml+xml" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-xhtml" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-xht" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/pdf" = "org.pwmt.zathura.desktop";
      "text/plain" = "org.gnome.evolution-data-server.OAuth2-handler.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/jpg" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "application/epub+zip" = "com.github.johnfactotum.Foliate.desktop";
      "video/mp4" = "io.github.celluloid_player.Celluloid.desktop";
      "video/mpeg" = "io.github.celluloid_player.Celluloid.desktop";
    };
    defaultApplications = {
      "x-scheme-handler/http" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "x-scheme-handler/https" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "x-scheme-handler/chrome" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "text/html" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-htm" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-html" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-shtml" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/xhtml+xml" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-xhtml" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "application/x-extension-xht" = ["floorp.desktop" "org.gnome.Epiphany.desktop" "com.vivaldi.Vivaldi.desktop" "com.google.Chrome"];
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/jpg" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "application/epub+zip" = "com.github.johnfactotum.Foliate.desktop";
      "video/mp4" = "io.github.celluloid_player.Celluloid.desktop";
      "video/mpeg" = "io.github.celluloid_player.Celluloid.desktop";
    };
  };

  home.packages = with pkgs; [
    sway-contrib.grimshot
    pamixer
    playerctl
    slurp
    grim
    wl-clipboard
    jq
    libnotify
    rofi-wayland
    nautilus
    gnome-calendar
    gnome-calculator
    xdg-user-dirs
    floorp
    sway-audio-idle-inhibit
    stow
    pavucontrol
    webcord
    vesktop
    heroic
    lutris
    wine
    gamemode
    trash-cli
    bitwarden-cli
    ripgrep
    vivid
    ani-cli
    adw-gtk3
    spot
    dialect
    foliate
    komikku
    gnome-decoder
    google-chrome
    stremio
    fragments
    mission-center
    protonup-qt
    pcsx2
    airshipper
    piper
    epiphany
    gnome-podcasts
    cheese
    gnome-solanum
    gnome.gnome-sound-recorder
    citations
    pika-backup
    gnome-font-viewer
    video-trimmer
    apostrophe
    retroarch
    cavalier
    pitivi
    telegram-desktop
    zotero
    celluloid
    swww
    mpvpaper
    waypaper
    blender
    crunchy-cli
    ffmpeg
    bottles
    localsend
    clipse
    session-desktop
    inputs.ignis.packages.${system}.ignis
    # writeShellScript bins:
    hprop
    makoStatus
    makoAction
    changeTheme
    appil
    onResume
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-hangul
      fcitx5-rime
      fcitx5-material-color
      fcitx5-mozc
    ];
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
      size = 11;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    gtk3.extraConfig = {
      gtk-decoration-layout = "menu:close";
    };
    gtk4.extraConfig = {
      gtk-decoration-layout = ":close";
    };
  };

  services.mako = {
    enable = true;
    anchor = "top-right";
    backgroundColor = "#282828";
    borderColor = "#b8bb26";
    borderSize = 2;
    defaultTimeout = 5000;
    extraConfig = ''
      [urgency=low]
      border-color=#8ec07c

      [urgency=normal]
      border-color=#b8bb26

      [urgency=high]
      border-color=#fb4934

      [mode=do-not-disturb]
      invisible=1
    '';
    height = 110;
    width = 310;
    layer = "overlay";
    maxIconSize = 128;
    textColor = "#f2e5bc";
    font = "SauceCodePro NFM 10";
  };

  services.gammastep = {
    enable = true;
    tray = true;
    provider = "geoclue2";
    temperature = {
      day = 6500;
      night = 4000;
    };
  };

  programs.zathura.enable = true;

  programs.wpaperd = {
    enable = false;
    settings = {
      HDMI-A-1 = {
        path = "~/dotfiles/nixos/wallpapers";
        duration = "30m";
      };
    };
  };

  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      log = {
        enable = false;
      };
      manager = {
        sort_by = "alphabetical";
        sort_reverse = true;
        sort_dir_first = true;
        linemode = "size";
        show_symlink = true;
      };
    };
  };

  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 10;
        output = ["HDMI-A-1"];
        ipc = true;
        modules-left = ["hyprland/workspaces" "hyprland/submap"];
        modules-center = ["mpris"];
        modules-right = [
          "custom/audio_idle_inhibitor"
          "custom/mako"
          "gamemode"
          "network"
          "cpu"
          "memory"
          "wireplumber"
          "keyboard-state"
          "hyprland/language"
          "idle_inhibitor"
          "clock"
          "tray"
        ];

        "tray" = {
          icon_size = 21;
          spacing = 10;
        };

        "mpris" = {
          format = "{player_icon}: {status_icon} <b>{title} | {artist}</b>";
          format-paused = "{player_icon}: {status_icon} {title} | {artist}";
          max-length = 30;
          player-icons = {
            default = "🎵";
            spotify = "";
          };
          status-icons = {
            paused = "";
            plaaying = "";
          };
        };

        "hyprland/language" = {
          format = "{short} {variant}";
          on-click = "${pkgs.hyprland}/bin/hyprctl switchxkblayout 0.01-mechanical-keyboard next";
        };

        "clock" = {
          format = " {:%a, %b %d, %Y | %R}";
          format-alt = " {:%H:%M} ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          on-click-right = "gnome-calendar";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        "wireplumber" = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          on-click = "${pkgs.pamixer}/bin/pamixer -d 10";
          on-click-middle = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
          on-click-right = "${pkgs.pamixer}/bin/pamixer -i 10";
          format-icons = ["" "" ""];
        };

        "memory" = {
          interval = 30;
          format = " {used:0.1f}G/{total:0.1f}G";
        };

        "cpu" = {
          interval = 10;
          format = " {}%";
          max-length = 10;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          tooltip-format-deactivated = "Caffeine is {status}";
          tooltip-format-activated = "Caffeine is {status}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "󰈹";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "󰊴";
          };
          on-scroll-up = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e+1";
          on-scroll-down = "${pkgs.hyprland}/bin/hyprctl dispatch workspace e-1";
        };

        "gamemode" = {
          format = "{glyph}";
          format-alt = "{glyph} {count}";
          glyph = "";
          hide-not-running = true;
          use-icon = true;
          icon-name = "input-gaming-symbolic";
          icon-spacing = 4;
          icon-size = 20;
          tooltip = true;
          tooltip-format = "Games running: {count}";
        };

        "keyboard-state" = {
          numlock = false;
          capslock = false;
          format = {
            numlock = "Num {icon}";
            capslock = "Caps {icon}";
          };
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };

        "network" = {
          interface = "wlp9s0";
          format = "{ifname}";
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} 󰊗";
          format-disconnected = "";
          tooltip-format = "{ifname} via {gwaddr} 󰊗";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };

        "custom/audio_idle_inhibitor" = {
          format = "{icon}";
          exec = "${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit --dry-print-both-waybar";
          exec-if = "which sway-audio-idle-inhibit";
          return-type = "json";
          format-icons = {
            output = "";
            input = "";
            output-input = "  ";
            none = "";
          };
        };

        "custom/mako" = {
          exec = "makoStatus";
          on-click = "makoAction";
          format = "{}";
          interval = 10;
          signal = 1;
          tooltip = false;
        };
      }
    ];
    #style = ../styles/waybar/style.css;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };

  programs.nushell = {
    enable = true;
    configFile = {
      source = ../nushell/config.nu;
    };
    envFile = {
      source = ../nushell/env.nu;
    };
    shellAliases = {
      ":q" = "exit";
    };
    environmentVariables = {
      EDITOR = "'nvim'";
    };
  };
  
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      clang-tools
      vscode-langservers-extracted
      haskellPackages.haskell-language-server
      nodePackages.typescript-language-server
      lua-language-server
      marksman
      nil
      python312Packages.python-lsp-server
      rust-analyzer
      # typst-lsp
    ];
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        bufferline = "always";
        scrolloff = 8;
        cursorline = true;
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        statusline = {
          left = [ "mode" "spinner" "version-control" ];
          center = [ "file-name" ];
          right = [ "diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type" ];
          separator = "│";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        auto-pairs = {
          "("  = ")";
          "{"  = "}";
          "["  = "]";
          "\"" = "\"";
          "`"  = "`";
          "<"  = ">";
        };
        indent-guides = {
          render = true;
          character = "▏";
          skip-levels = 1;
        };
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  # programs.carapace = {
  #   enable = true;
  #   enableNushellIntegration = true;
  # };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com-twb0109" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/twb0109_ed25519";
      };
      "github.com-bsp0109" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/bsp0109_ed25519";
      };
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "SauceCodePro NFM";
      size = 10.0;
    };
    settings = {
      font_family = "SauceCodePro NFM";
      bold_font = "SauceCodePro NFM Bold";
      italic_font = "SauceCodePro NFM Italic";
      bold_italic_font = "SauceCodePro NFM Bold Italic";
      background_opacity = "0.9";
      allow_remote_control = "yes";
    };
    theme = "Gruvbox Dark";
  };

  programs.swaylock = {
    enable = false;
    settings = {
      show-keyboard-layout = true;
      indicator-caps-lock = true;
      color = "282828";
      font = "SauceCodePro NFM";
    };
  };

  programs.wezterm = {
    enable = false;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      function scheme_for_appearance(appearance)
        if appearance:find 'Dark' then
          return 'Gruvbox dark, medium (base16)'
        else
          return 'Gruvbox light, medium (base16)'
        end
      end

      wezterm.on('window-config-reloaded', function(window, pane)
        local overrides = window:get_config_overrides() or {}
        local appearance = window:get_appearance()
        local scheme = scheme_for_appearance(appearance)
        if overrides.color_scheme ~= scheme then
          overrides.color_scheme = scheme
          window:set_config_overrides(overrides)
        end
      end)

      config.font = wezterm.font 'SauceCodePro NFM'
      config.font_size = 10.0
      config.freetype_load_target = "Light"
      config.freetype_render_target = "HorizontalLcd"
      config.hide_tab_bar_if_only_one_tab = true
      config.hide_mouse_cursor_when_typing = false
      config.audible_bell = "Disabled"
      config.visual_bell = {
        fade_in_function = 'EaseIn',
        fade_in_duration_ms = 150,
        fade_out_function = 'EaseOut',
        fade_out_duration_ms = 150,
      }
      config.colors = {
        visual_bell = '#202020',
      }
      config.window_background_opacity = 0.9

      return config
    '';
  };

  services.swayidle = {
    enable = false;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
      {
        timeout = 600;
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
        resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      }
    ];
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 180;
          on-timeout = "hyprlock";
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume  = "onResume"; # This is an ugly workaround for hyprlock crashing waiting for it to be fixed, onResume is defined at the top.
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          path = "$HOME/.local/share/backgrounds/leaves.png";
          blur_size = 2;
          blur_passes = 2;
          # color = "rgba(282828ff)";
        }
      ];

      label = [
        # Layout
        {
          text = "Layout: $LAYOUT";
          color = "rgba(fbf1c7ff)";
          font_size = 10;
          font_family = "SauceCodePro NFM";
          position = "30, -30";
          halign = "left";
          valign = "top";
        }

        # Time
        {
          text = "$TIME";
          color = "rgba(fbf1c7ff)";
          font_size = 90;
          font_family = "SauceCodePro NFM";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }

      ];

      image = [
        {
          path = "$HOME/.local/share/backgrounds/highvern.jpg";
          size = 100;
          border_color = "rgba(b8bb26ff)";
          position = "0, 75";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          size = "300, 60";
          position = "0, -47";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_center = true;
          outer_color = "rgba(b8bb26ff)";
          inner_color = "rgba(282828ff)";
          font_color  = "rgba(fbf1c7ff)";
          fade_on_empty = false;
          placeholder_text = '' <span foreground="##fbf1c7"><i>󰌾 Logged in as </i><span foreground="##b8bb26">$USER</span></span> '';
          hide_input = false;
          check_color = "rgba(8ec07cff)";
          fail_color  = "rgba(fb4934ff)";
          fail_text   = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgba(fabd2fff)";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

  services.blueman-applet.enable = true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
