{ config, lib, pkgs, user, inputs, ... }:

{
  imports = [
    ../common/desktop
    ../common/shell/zsh.nix
    ../common/shell/tmux.nix
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
