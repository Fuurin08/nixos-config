{ pkgs, ... }:

{
  users = {
    mutableUsers = true;
    users.fuurin = {
      isNormalUser = true;
      shell = pkgs.zsh;   # Don't forget to enable your shell in programs.
      extraGroups = [ "wheel" ];
      #packages = with pkgs; [
      #
      #];
    };
  };
}
