{ pkgs, ... }:

{
  users = {
    mutableUsers = true;
    users.fuurin = {
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [ "wheel" ];
      #packages = with pkgs; [
      #
      #];
    };
    users.fuurin.packages = with pkgs; [
      qq    ];
  };
}
