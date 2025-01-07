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
    wlogout
    telegram-desktop
  ];

  # programs.dconf = {
  #   enable =true;
  # };
  programs.waybar.enable = true;
}
