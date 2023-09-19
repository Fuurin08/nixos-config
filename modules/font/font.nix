{ config, lib, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      #jetbrains-mono
      #nerdfonts
      #wqy_zenhei
      #wqy_microhei
    ];
  };
}
