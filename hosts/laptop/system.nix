{ pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;
  users.users.root = {
    hashedPassword = "$y$j9T$SoPNWsc9Qx3W.3tWd7x7H.$sZqKZS3QCIlNDA1i5jGEoT4fT7ykkVoisPVgPpJwDJ2";
  };
  users.users.fuurin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$y$j9T$SoPNWsc9Qx3W.3tWd7x7H.$sZqKZS3QCIlNDA1i5jGEoT4fT7ykkVoisPVgPpJwDJ2";
  };
  
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Set allow unfree software
  nixpkgs.config.allowUnfree = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  nix.settings = {
    builders-use-substitutes = true;
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    wget
    neofetch
    gcc
    wlroots
    niri
  ];

  environment.variables.EDITOR = "nvim";

  fonts = {
    packages = with pkgs; [
      wqy_zenhei
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
  
  #########################################
  # List services that you want to enable #
  #########################################

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.displayManager.sddm.enable = false;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  # services = {
  #   xserver = {
  #     enable = true;
  #     desktopManager.gnome.enable = true;
  #     displayManager.gdm = {
  #       enable = true;
  #       wayland = true;
  #     };
  #   };
  #   # greetd = {
  #   #   enable = true;
  #   # };
  # };

  services.v2raya.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };


}
