{ pkgs, ... }:

{
  users = {
    mutableUsers = true;
    users.fuurin = {
      isNormalUser = true;
      #shell = pkgs.zsh;
      extraGroups = [ "wheel" ];
      #packages = with pkgs; [
      #
      #];
    };
  };
}
