{ config, lib, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      jetbrains-mono
      nerdfonts
    ];
  };
}
