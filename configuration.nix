# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include when u need nvidia support
      #./nvidia-conf.nix
    ];
  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = ["mitigations=off"];
  # Bootloader.
  boot.loader = {
  efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot"; # ← use the same mount point here.
    };
  grub = {
     efiSupport = true;
     #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
     device = "nodev";
      # Change to true when dualbooting
     useOSProber = false;
    };
  };
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kuala_Lumpur";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ms_MY.UTF-8";
    LC_IDENTIFICATION = "ms_MY.UTF-8";
    LC_MEASUREMENT = "ms_MY.UTF-8";
    LC_MONETARY = "ms_MY.UTF-8";
    LC_NAME = "ms_MY.UTF-8";
    LC_NUMERIC = "ms_MY.UTF-8";
    LC_PAPER = "ms_MY.UTF-8";
    LC_TELEPHONE = "ms_MY.UTF-8";
    LC_TIME = "ms_MY.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-utilities.enable = false;
  services.gnome.sushi.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zhiwern = {
    isNormalUser = true;
    description = "zhiwern";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Install firefox.
  programs.firefox.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  	  gedit
    	alacritty
    	vscode
    	cava
    	libgcc
    	python3
    	google-chrome
    	gnome.gnome-tweaks
    	go
    	jetbrains-mono
    	inter
    	obsidian
    	discord
    	telegram-desktop
    	helix
    	spotify
    	git
    	vlc
    	obs-studio
    	gimp
    	inkscape
    	eza
    	zsh
    	oh-my-zsh
    	papirus-icon-theme
    	bibata-cursors
    	gnomeExtensions.blur-my-shell
    	gnomeExtensions.dock-from-dash
    	neovim
    	libclang
    	nodejs
    	btop
    	gcc
      pavucontrol
      scrcpy
      android-tools
      arduino-ide
      fastfetch
      nnn
      bottles
      ani-cli
      qbittorrent
      mission-center
      gnome.nautilus
      desktop-file-utils
  ];
 programs.noisetorch.enable = true;
 programs.zsh = {
    	enable = true;
    	ohMyZsh.enable = true;
    	enableCompletion = true;
      interactiveShellInit = "";
    	shellAliases = {
    		ls = "eza -la";
        oconf = "code /etc/nixos";
        nbswitch = "sudo nixos-rebuild switch && update-desktop-database";
    		};
    	ohMyZsh = {
    		plugins = [ ];
    		theme = "robbyrussell";
  	};
  };
  users.defaultUserShell = pkgs.zsh;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "24.05"; # Did you read the comment?

}
