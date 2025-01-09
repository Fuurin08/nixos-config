{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./gtk.nix
    ./niri
  ];

  # programs.dconf = {
  #   enable =true;
  # };
}
