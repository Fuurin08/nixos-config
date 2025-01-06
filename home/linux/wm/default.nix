{
  config,
  pkgs,
  ...
}:

{
  imports = [
    #./hypr
    #./rofi
    ./anyrun
    # ./ags
    ./gtk.nix
    ./niri
  ];

  home.packages = with pkgs; [
    telegram-desktop
  ];

  # programs.dconf = {
  #   enable =true;
  # };
  programs.waybar.enable = true;
}
