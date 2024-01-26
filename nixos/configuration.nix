# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Costa_Rica";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brandon = {
    isNormalUser = true;
    description = "Brandon S";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
    ];
  };

  # Enable Hyprland
  programs.hyprland.enable = true;
  programs.dconf.enable = true;

  # Hint Electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Home Manager
  home-manager.users.brandon = { pkgs, ... }: {
    home.packages = with pkgs; [
	sway-contrib.grimshot
	pamixer
	playerctl
        appimage-run
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
	swww
	fcitx5
	swayidle
	sway-audio-idle-inhibit
	stow
	pavucontrol
	neovim
	webcord
    ];

    # Enable Nushell

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
	"shadow_range" = 15;
	"shadow_render_power" = 2;
	"col.shadow" = "rgba(b8bb26ff)";
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
        "workspace special, silent,class:(WebCord)"
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
	"$mod SHIFT, minus, movetoworkspace, special"
	"$mod, minus, togglespecialworkspace"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      exec-once = [
        "~/.config/hypr/sidle"
	"swww init"
	"ssh-agent -D -a /run/user/1000/ssh-agent.socket"
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
      font = "fixed 10";
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
	gtk-theme = ''
  	  ${pkgs.dconf}/bin/dconf write \
	  /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
	'';
      };
      lightModeScripts = {
	gtk-theme = ''
  	  ${pkgs.dconf}/bin/dconf write \
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

    programs.nushell = {
      enable = true;
      configFile = {
        text = ''
	  $env.config = {
	    edit_mode: vi
	    completions: {
	      algorithm: "fuzzy"
	    }
	    rm: {
	      always_trash: true
	    }
	  }
	'';
      };
      envFile = {
        text = ''
	  $env.PROMPT_INDICATOR_VI_INSERT = {|| $"(ansi green_bold) [I] > (ansi reset)"}
	  $env.PROMPT_INDICATOR_VI_NORMAL = {|| $"(ansi red_bold) [N] > (ansi reset)"}
	  $env.PATH = ($env.PATH | split row (char esep) | prepend '~/.scripts')
	  $env.SSH_AUTH_SOCK = $"($env.XDG_RUNTIME_DIR)/ssh-agent.socket"
	'';
      };
      shellAliases = {
        vim = "nvim";
      };
      environmentVariables = {
        EDITOR = "nvim";
      };
    };

    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

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

    programs.home-manager.enable = true;
    home.stateVersion = "24.05";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim
     kitty
     gnome.gnome-tweaks
     git
     polkit_gnome
     gnome-text-editor
     bash
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-hyprland ];
  xdg.portal.config.common.default = "gtk";

  # Enable ratbagd
  services.ratbagd.enable = true;

  # Enable geoclue
  services.geoclue2.enable = true;

  # Enable Automatic Upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Gaming
  ## Java
  programs.java.enable = true;

  ## Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Polkit
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
   polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    })
  '';

  systemd = {
    user.services = {
      polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
  	  ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
	  Restart = "on-failure";
	  RestartSec = 1;
	  TimeoutStopSec = 10;
        };
      };
      mpris-proxy = {
        description = "Mpris proxy";
	after = [ "network.target" "sound.target" ];
	wantedBy = [ "default.target" ];
	serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
      };
    };
  };

  services.gnome.evolution-data-server.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.gnome-keyring.enable = true;


  # Nix

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
