{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./anyrun
    # ./ags
    ./gtk.nix
    ./niri
  ];

  home.packages = with pkgs; [
    wlogout # logout menu
    telegram-desktop
  ];

  # programs.dconf = {
  #   enable =true;
  # };
  programs.waybar.enable = true;
}
