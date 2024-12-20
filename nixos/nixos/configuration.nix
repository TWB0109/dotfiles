# Editthis configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration-desktop-onSDD.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname. networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Costa_Rica"; # Select internationalisation properties.
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
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.epson_201207w ];
  };

  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [ epkowa utsushi ];
  };
  
  services.udev.packages = with pkgs; [ utsushi ];

  # Enable sound with pipewire.
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
    extraGroups = [ "networkmanager" "wheel" "input" "scanner" "lp" "libvirtd" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
    ];
  };

  # Enable Hyprland
  programs.hyprland.enable = true;
  programs.dconf.enable = true;

  # Hint Electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    vim
    kitty
    gnome-tweaks
    git
    polkit_gnome
    gnome-text-editor
    bash
    appimage-run
    loupe
    bluetuith
    wayvnc
    fd
    gcc
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    font-awesome
    babelstone-han
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

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = "true";
      };
    };
  };
  services.blueman.enable = true;

  # Gaming
  ## Java
  programs.java.enable = true;

  ## Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
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
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Running generic binaries

  programs.nix-ld = {
    enable = true;
    libraries = pkgs.steam-run.fhsenv.args.multiPkgs pkgs;
  };

  # # Nixvim
  # programs.nixvim = {
  #   enable = false;
  #   enableMan = true;
  #   options = {
  #     number = true;
  #     relativenumber = true;
  #     cursorline = true;
  #     showcmd = true;
  #     wrap = false;
  #     splitbelow = true;
  #     splitright = true;
  #     mouse = "a";
  #     shell = "nu";
  #     scl = "auto";
      
  #     expandtab = true;
  #     cindent = true;
  #     autoindent = true;
  #     smartindent = true;
  #     shiftwidth = 2;
  #     tabstop = 2;
  #     softtabstop = 2;

  #     hlsearch = false;
  #     incsearch = true;

  #     scrolloff = 8;
  #     colorcolumn = "";

  #     conceallevel = 1;
  #     hidden = true;

  #     swapfile = false;
  #   };
  #   globals = {
  #     markdown_fenced_languages = "{ 'python', 'bash', 'cpp' }";
  #     mapleader = " ";
  #     gruvbox_terminal_colors = true;
  #     gruvbox_italic_keywords = false;
  #     gruvbox_transparent = true;
  #   };
  #   plugins = {
  #     lualine = {
  #       enable = true;
  #       globalstatus = true;
  #       componentSeparators = {
  #         left = "";
  #         right = "";
  #       };
  #       sectionSeparators = {
  #         left = "";
  #         right = "";
  #       };
  #     };
  #     oil.enable = true;
  #     lsp.enable = true;
  #     treesitter.enable = true;
  #     fugitive.enable = true;
  #     which-key.enable = true;
  #     telescope = {
  #       enable = true;
  #       keymaps = {
  #         "<leader>ff" = {
  #           action = "find_files";
  #           options = {
  #             desc = "Open a fuzzy file picker";
  #           };
  #         };
  #         "<leader>fr" = {
  #           action = "oldfiles";
  #           options = {
  #             desc = "Open a fuzzy recent file picker";
  #           };
  #         };
  #         "<leader>fb" = {
  #           action = "buffers";
  #           options = {
  #             desc = "Open a fuzzy buffer picker";
  #           };
  #         };
  #         "<C-p>" = {
  #           action = "git_files";
  #           options = {
  #             desc = "Open a git repo fuzzy file picker";
  #           };
  #         };
  #         "<leader>lg" = {
  #           action = "live_grep";
  #           options = {
  #             desc = "Open a fuzzy live grep";
  #           };
  #         };
  #       };
  #     };
  #   };
  #   extraPlugins = with pkgs.vimPlugins; [
  #     gruvbox-flat-nvim
  #     nvim-nu
  #   ];

  #   keymaps = [
  #     {
  #       key = "<leader>pv";
  #       action = "<cmd>Oil<CR>";
  #       mode = "n";
  #       options = {
  #         silent = true;
  #       };
  #     }
  #     {
  #       key = "<leader>pV";
  #       action = "<cmd>Oil --float<CR>";
  #       mode = "n";
  #       options = {
  #         silent = true;
  #       };
  #     }
  #     {
  #       key = "<leader>gs";
  #       action = "<cmd>Git<CR>";
  #       mode = "n";
  #       options = {
  #         silent = true;
  #       };
  #     }
  #     {
  #       key = "<leader>gp";
  #       action = "<cmd>Git push<CR>";
  #       mode = "n";
  #       options = {
  #         silent = true;
  #       };
  #     }
  #   ];

  #   extraConfigLua = ''
  #     vim.cmd.colorscheme('gruvbox-flat')
  #   '';
  # };

  # Nix
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = [ "03:45" ];
    };
  };

  # PAM
  security.pam.services.hyprlock = {};

  # Virtualisation
  virtualisation.libvirtd.enable = true;
  virtualisation.waydroid.enable = true;
  programs.virt-manager.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 
    # Localsend
    53317
    # Wayvnc
    5900
  ];

  networking.firewall.allowedUDPPorts = [ 
    # Localsend
    53317 
    5900
  ];

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system = {
    stateVersion = "23.11"; # Did you read the comment?
    autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [
        "--update-input"
        "nixpkgs"
        "--print-build-logs"
      ];
      dates = "02:00";
      randomizedDelaySec = "45min";
    };
  };

}
