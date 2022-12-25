{ config, lib, pkgs, home, ... }:

{
  # imports = 

  home.packages = with pkgs; [
      swaybg
    ];

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

}
