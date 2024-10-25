{
  config,
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      monitor = ["HDMI-A-1,1920x1080@75,0x0,1"];
      misc = {
        "vrr" = 1;
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

        "inactive_opacity" = 1;
        "active_opacity" = 1;
      };
      master = {
        # "new_is_master" = true;
        "mfact" = 0.50;
      };
      windowrulev2 = [
        "idleinhibit,fullscreen:0"
        "workspace special:discord, silent,class:(WebCord)"
        "workspace special:discord, silent,class:(vesktop)"
        "workspace 2, silent,class:(Spotify)"
        "workspace 2, silent,class:(Cider)"
        "workspace 5, silent,class:(steam)"
        "float,class:(clipse)"
        "size 622 652,class:(clipse)"
      ];
      layerrule = ["blur, waybar"];
      bind = [
        "$mod SHIFT, RETURN, exec, ${config.home.sessionVariables.terminal}"
        "$mod SHIFT, C, exec, ~/.scripts/closesteam"
        "$mod SHIFT, period, exec, ~/.scripts/rofiemoji"
        "$mod SHIFT, Q, exit,"
        "$mod, E, exec, nautilus"
        "$mod SHIFT, SPACE, togglefloating,"
        "$mod, SPACE, movefocus, mode_toggle"
        "$mod SHIFT, D, exec, rofi -show drun"
        "$mod CONTROL, D, exec, rofi -show run"
        "$mod ALT, D, exec, appil"
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
        "$mod, V, exec, kitty --class 'clipse' clipse"
        "$mod SHIFT, V, exec, clipse -clear"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      env = [
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
      ];
      exec-once = [
        "ssh-agent -D -a /run/user/1000/ssh-agent.socket"
        "waypaper --restore"
        "sway-audio-idle-inhibit"
        "clipse -listen"
        "localsend_app"
      ];
    };
    extraConfig = ''
      #
      # Resize:
      #

      bind = $mod, R, submap, resize(H, J, K, L)
      submap = resize(H, J, K, L)

      binde = , L, resizeactive, 10 0
      binde = , H, resizeactive, -10 0
      binde = , K, resizeactive, 0 -10
      binde = , J, resizeactive, 0 10

      bind=,escape,submap,reset

      submap=reset

      #
      # Screenshots:
      #

      bind = $mod, P, submap, scopy(A, S, O, R, W)
      submap = scopy(A, S, O, R, W)

      bind=,A,exec,grimshot --notify copy active
      bind=,S,exec,grimshot --notify copy screen
      bind=,O,exec,grimshot --notify copy output
      bind=,R,exec,grimshot --notify copy area
      bind=,W,exec,grimshot --notify copy window
      bind=,escape,submap,reset

      submap=reset

      bind = $mod SHIFT, P, submap, ssave(A, S, O, R, W)
      submap = ssave(A, S, O, R, W)

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

      bind = $mod, M, submap, media(K, J, X, H, T, I, U, O)
      submap = media(K, J, X, H, T, I, U, O)

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
  };
}
