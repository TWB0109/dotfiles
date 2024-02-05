{ config, pkgs, ... }:

let
  makoStatus = pkgs.writeShellScriptBin "makoStatus" ''
    state=$(makoctl mode)
    [[ $state == "default" ]] && echo "" || echo ""
  '';
  makoAction = pkgs.writeShellScriptBin "makoAction" ''
    [[ $(makoctl mode) == "default" ]] && makoctl mode -s do-not-disturb || makoctl mode -s default
    pkill -RTMIN+1 waybar
  '';

in {
  home.username = "brandon";

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
    fcitx5
    sway-audio-idle-inhibit
    stow
    pavucontrol
    webcord
    heroic
    gamemode
    trash-cli
    cider
    bitwarden-cli
    ripgrep
    makoStatus
    makoAction
    itch
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  programs.zathura.enable = true;

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    monitor = [ "HDMI-A-1,1920x1080@75,0x0,1" ];
    misc = {
      "vrr" = 1;
      "force_hypr_chan" = true;
    };
    general = {
      "gaps_in" = 5;
      "gaps_out" = 10;
      "border_size" = 4;
      "col.active_border" = "rgba(b8bb26ff)";
      "col.inactive_border" = "rgba(282828ff)";

      "layout" = "master";
    };
    input = {
      "kb_layout" = "us,latam";
      "kb_options" = "grp:alt_shift_toggle";
      "follow_mouse" = 1;
      "mouse_refocus" = false;
      "sensitivity" = 0;
      "accel_profile" = "flat";
      "repeat_rate" = 50;
    };
    decoration = {
      "rounding" = 10;
      blur = {
        "enabled" = true;
        "size" = 1;
        "passes" = 2;
        "new_optimizations" = true;
        "ignore_opacity" = true;
        "noise" = 0;
        "brightness" = 1;
        "special" = true;
      };
      
      "drop_shadow" = true;
      "shadow_range" = 10;
      "shadow_render_power" = 3;
      "col.shadow" = "rgba(000000ff)";
      "col.shadow_inactive" = "rgba(000000ee)";

      "inactive_opacity" = 0.90;
      "active_opacity" = 1;
    };
    master = {
      "new_is_master" = true;
      "mfact" = 0.50;
    };
    windowrulev2 = [
      "idleinhibit,fullscreen:0"
      "workspace special:discord, silent,class:(WebCord)"
      "workspace 2, silent,class:(Spotify)"
      "workspace 2, silent,class:(Cider)"
      "workspace 5, silent,class:(steam)"
    ];
    layerrule = [ "blur, waybar" ];
    bind = [
      "$mod SHIFT, RETURN, exec, kitty"
      "$mod SHIFT, C, exec, ~/.scripts/closesteam"
      "$mod SHIFT, period, exec, ~/.scripts/rofiemoji"
      "$mod SHIFT, Q, exit,"
      "$mod, E, exec, nautilus"
      "$mod SHIFT, SPACE, togglefloating,"
      "$mod, SPACE, movefocus, mode_toggle"
      "$mod SHIFT, D, exec, rofi -show drun"
      "$mod CONTROL, D, exec, rofi -show run"
      "$mod ALT, D, exec, ~/.scripts/appil"
      "$mod, Q, exec, hyprctl reload && killall -SIGUSR2 waybar"
      "$mod, K, layoutmsg, cycleprev"
      "$mod, J, layoutmsg, cyclenext"
      "$mod SHIFT, K, layoutmsg, swapprev"
      "$mod SHIFT, J, layoutmsg, swapnext"
      "$mod, RETURN, layoutmsg, swapwithmaster"
      "$mod, F, fullscreen, 0"
      "$mod SHIFT, F, fullscreen, 1"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod SHIFT, 1, movetoworkspacesilent, 1"
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      "$mod, tab, focusCurrentOrLast"
      "$mod SHIFT, minus, movetoworkspace, special:default"
      "$mod, minus, togglespecialworkspace, default"
    ];
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
    exec-once = [
      "ssh-agent -D -a /run/user/1000/ssh-agent.socket"
      "wpaperd"
      "sway-audio-idle-inhibit"
    ];
  };
  wayland.windowManager.hyprland.extraConfig = 
  ''
    #
    # Resize:
    #
    
    bind = $mod, R, submap, resize
    submap = resize
    
    binde = , L, resizeactive, 10 0
    binde = , H, resizeactive, -10 0
    binde = , K, resizeactive, 0 -10
    binde = , J, resizeactive, 0 10
    
    bind=,escape,submap,reset 
    
    # will reset the submap, meaning end the current one and return to the global one
    submap=reset

    #
    # Screenshots:
    #
    
    bind = $mod, P, submap, scopy
    submap = scopy
    
    bind=,A,exec,grimshot --notify copy active
    bind=,S,exec,grimshot --notify copy screen
    bind=,O,exec,grimshot --notify copy output
    bind=,R,exec,grimshot --notify copy area
    bind=,W,exec,grimshot --notify copy window
    bind=,escape,submap,reset
    
    submap=reset
    
    bind = $mod SHIFT, P, submap, ssave
    submap = ssave
    
    bind=,A,exec,grimshot --notify save active
    bind=,S,exec,grimshot --notify save screen
    bind=,O,exec,grimshot --notify save output
    bind=,R,exec,grimshot --notify save area
    bind=,W,exec,grimshot --notify save window
    bind=,escape,submap,reset
    
    submap=reset

    #
    # Volume:
    #
    
    bind = $mod, M, submap, media
    submap = media
    
    binde=,K,exec,pamixer -i 10
    binde=,J,exec,pamixer -d 10
    bind= ,X,exec,pamixer --set-volume 100
    bind= ,H,exec,pamixer --set-volume 50
    bind= ,T,exec,pamixer --toggle-mute 
    bind= ,I,exec,playerctl play-pause
    bind= ,U,exec,playerctl previous
    bind= ,O,exec,playerctl next
    bind=,escape,submap,reset

    submap = reset

    #
    # Scratchpads
    #

    bind = $mod,S,submap,scratchpads(P,D,1,2,3)
    submap = scratchpads(P,D,1,2,3)

    bind = SHIFT,P,movetoworkspace,special:private
    bind = ,P,togglespecialworkspace,private

    bind = SHIFT,D,movetoworkspace,special:discord
    bind = ,D,togglespecialworkspace,discord

    bind = SHIFT,1,movetoworkspace,special:default1
    bind = ,1,togglespecialworkspace,default1

    bind = SHIFT,2,movetoworkspace,special:default2
    bind = ,2,togglespecialworkspace,default2

    bind = SHIFT,3,movetoworkspace,special:default3
    bind = ,3,togglespecialworkspace,default3

    bind = ,escape,submap,reset

    submap = reset

  '';

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

  services.darkman = {
    enable = true;
    darkModeScripts = {
      gtk-theme = pkgs.writeScript "gtk-theme-dark" ''
        #!/usr/bin/env -S nix shell nixpkgs#bash nixpkgs#dconf --command bash
        dconf write \
        /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      '';
    };
    lightModeScripts = {
      gtk-theme = pkgs.writeScript "gtk-theme-light" ''
        #!/usr/bin/env -S nix shell nixpkgs#bash nixpkgs#dconf --command bash
        dconf write \
        /org/gnome/desktop/interface/color-scheme "'prefer-light'"
      '';
    };
    settings = {
      usegeoclue = true;
    };
  };

  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    temperature = {
      day = 6500;
      night = 4000;
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
    style = ../styles/waybar/style.css;
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
    enable = true;
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

}
