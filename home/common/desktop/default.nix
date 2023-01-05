{ pkgs , ... }:

{
  imports = [
    ./fcitx5.nix
    ./waybar.nix
    ./alacritty.nix
    ./rofi/rofi.nix
  ];
}
