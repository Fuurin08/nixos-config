{
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./boot.nix
    ./users.nix
    ./i18n.nix
    ./nix.nix
    ./network.nix
    ./ssh.nix
  ];

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

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
