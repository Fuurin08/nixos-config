{
  pkgs,
  lib,
  ...
}:

{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];
  };

  nix.settings = {
    builders-use-substitutes = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
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
    ripgrep
    fzf
    pavucontrol # 图形化音量控制
    brightnessctl # backlight control
  ];

  environment.variables.EDITOR = "nvim";

  fonts = {
    packages = with pkgs; [
      wqy_zenhei
      nerd-fonts.jetbrains-mono
    ];
  };

  #########################################
  # List services that you want to enable #
  #########################################

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # acpi daemon
  services.acpid.enable = true;

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

}
