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
  ];

  # programs.dconf = {
  #   enable =true;
  # };
}