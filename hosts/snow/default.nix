# System configuration for my desktop PC
{ config, pkgs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    
    ../common/users/fuurin.nix
    
    ../../modules/font/font.nix
    ../../modules/hardware/amdgpu.nix
  ];

  networking = {
    hostName = "snow";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
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
    supportedFilesystems = [ "btrfs" "ntfs" ];
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


  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;
  services.v2raya.enable = true;

  time.timeZone = "Asia/Shanghai";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    firefox
    linux-firmware
    chromium
    unzip
    ranger
    emacs
    neofetch
    aria2
    eww-wayland
    gnumake
    gcc
    killall
    obs-studio
    gamescope
    mangohud
    fd
    ripgrep

    #(python38.withPackages(ps: with ps; [ epc six ]))
    (python39.withPackages (p: with p; [
      epc
      six
      orjson
      requests
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
    stateVersion = "22.11";
  };
}
