{ config, pkgs, lib, ... }:

let
  makoStatus = pkgs.writeShellScriptBin "makoStatus" ../scripts/makoStatus;
  makoAction = pkgs.writeShellScriptBin "makoAction" ../scripts/makoAction;
  appil = pkgs.writeShellScriptBin "appil" ../scripts/appil;
  hprop = pkgs.writeShellScriptBin "hprop" ../scripts/hprop;
  changeTheme = pkgs.writeShellScriptBin "changeTheme" ../scripts/changeTheme;
in {
  imports = [ ../hypr/hyprland.nix ];

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
  };

  home.sessionVariables = {
    terminal = "wezterm";
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
    gnome.nautilus
    gnome.gnome-calendar
    gnome.gnome-calculator
    xdg-user-dirs
    floorp 
    sway-audio-idle-inhibit
    stow
    pavucontrol
    webcord
    heroic
    gamemode
    trash-cli
    bitwarden-cli
    ripgrep
    itch
    vivid
    ani-cli
    # writeShellScript bins:
    hprop
    makoStatus
    makoAction
    changeTheme
  ];

  i18n.inputMethod = { 
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ 
      fcitx5-hangul
      fcitx5-rime
      fcitx5-material-color
    ];
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
      size = 11;
    };
  };

  services.mako = {
    enable = true;
    anchor = "top-right";
    backgroundColor = "#282828";
    borderColor = "#b8bb26";
    borderSize = 2;
    defaultTimeout = 5000;
    extraConfig = 
    ''
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
    enable = true;
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
    settings = [{
      layer = "top";
      position = "top";
      height = 10;
      output = [ "HDMI-A-1" ];
      ipc = true;
      modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
      modules-center = [ "mpris" ];
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
        player-icons = {
          default = "🎵";
          spotify = "";
        };
        status-icons = {
          paused = "";
          plaaying = "";
        };
        ignored-players = [ "firefox" ];
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
            months   = "<span color='#ffead3'><b>{}</b></span>";
            days     = "<span color='#ecc6d9'><b>{}</b></span>";
            weeks    = "<span color='#99ffdd'><b>W{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today    = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
      };

      "wireplumber" = {
        format = "{icon} {volume}%";
        format-muted = " Muted";
        on-click = "${pkgs.pamixer}/bin/pamixer -d 10";
        on-click-middle = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
        on-click-right = "${pkgs.pamixer}/bin/pamixer -i 10";
        format-icons = [ "" "" "" ];
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
          locked =  "";
          unlocked =  "";
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

      "custom/mako" =  {
        exec = "makoStatus";
        on-click = "makoAction";
        format = "{}";
        interval = 10;
        signal = 1;
        tooltip = false;
      };
    }];
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
      EDITOR = "nvim";
    };
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
    enable = false;
    font = {
      name = "SauceCodePro NFM";
      size = 10.0;
    };
    settings = {
       font_family =      "SauceCodePro NFM";
       bold_font =        "SauceCodePro NFM Bold";
       italic_font =      "SauceCodePro NFM Italic";
       bold_italic_font = "SauceCodePro NFM Bold Italic";
       background_opacity = "0.9";
    };
    theme = "Gruvbox Dark";
  };

  programs.swaylock = {
    enable = true;
    settings = {
      show-keyboard-layout = true;
      indicator-caps-lock = true;
      color = "282828";
      font = "SauceCodePro NFM";
    };
  };

  programs.wezterm = {
    enable = true;
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
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
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

  services.blueman-applet.enable = true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

}
