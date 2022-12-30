{ config, lib, pkgs, user, inputs, ... }:

{
  imports = [
    ../../modules/hyprland/home.nix
    ../common/desktop
  ];

  home = {
    username = "fuurin";
    homeDirectory = "/home/fuurin";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "22.11";


}
