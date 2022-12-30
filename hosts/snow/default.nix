# System configuration for my desktop PC
{ config, pkgs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hyprland/default.nix
    ../../modules/font/font.nix
    ../../modules/fcitx5.nix
  ];

  networking = {
    hostName = "snow";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  #networking.hostName = "snow"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 5;
    };
    consoleLogLevel = 4;
    # if you not use amdgpu, you must delete the following line.
    initrd.kernelModules = [ "amdgpu" ];
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  services.dbus.enable = true;
  
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    #extraPortals = with pkgs; [
    #  xdg-desktop-portal-gtk
    #  xdg-desktop-portal-wlr
    #];
  };

  users = {
    mutableUsers = true;
    users.fuurin = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      #packages = with pkgs; [
      #  
      #];
    };
  };

  nixpkgs.config.allowUnfree = true;
  
  programs.steam.enable = true;
  services.v2raya.enable = true;

  time.timeZone = "Asia/Shanghai";

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git 
    firefox
    chromium
    rofi-wayland
    unzip
    ranger
    emacs
    neofetch
    alacritty
    aria2
    waybar
    eww-wayland
    xray
    gnumake
    gcc
    killall
    obs-studio
    gamescope
    mangohud
    
    #(python38.withPackages(ps: with ps; [ epc six ]))
    (python39.withPackages (p: with p; [
      epc
      six
    ]))

    tdesktop
    discord
    
    # rust
    rustc
    cargo
    
    #lsp-server
    nodePackages_latest.pyright    # python lsp-language-server
    rust-analyzer                  # rust lsp-language-server
    ccls                           # c/c++ lsp-language-server
    rnix-lsp                       # nix lsp-language-server
  ];

  #networking.firewall.enable = false;
  
  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "22.05";
  };
}

