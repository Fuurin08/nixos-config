{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hypr
    #./rofi
    ./anyrun
    # ./ags
    ./gtk.nix
    ./niri
  ];

  # programs.dconf = {
  #   enable =true;
  # };
}