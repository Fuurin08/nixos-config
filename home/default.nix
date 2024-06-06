{ config, pkgs, ... }:

{
  imports = [
    ./wm
    ./programs
    ./term
    ./shell
  ];

  home = {
    username = "fuurin";
    homeDirectory = "/home/fuurin";
    stateVersion = "24.05";
  };

  home.packages = with pkgs;[
    ripgrep
    fzf
  ];

  #programs.vscode = {
  #  enabele = true;
  #  package = pkgs.vscode.fhs;
  #};
  programs.vscode.enable = true;



  
  programs.home-manager.enable = true;
}
