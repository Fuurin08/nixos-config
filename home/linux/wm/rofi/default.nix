{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
  ];
  home.file.".config/rofi/launcher.rasi".source = ./launcher.rasi;
}