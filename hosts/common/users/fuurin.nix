{ pkgs, ... }:

{
  users = {
    mutableUsers = true;
    users.fuurin = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" ];
      #packages = with pkgs; [
      #
      #];
    };
    users.fuurin.packages = with pkgs; [
      qq
    ];
  };
}
