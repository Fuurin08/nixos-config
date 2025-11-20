{
  pkgs,
  ...
}:

{
  imports = [
    ./services
    # ./caelestia.nix
    ./noctalia.nix
  ];

  home.packages = with pkgs; [
    niri # windows manager
    swaybg

    nautilus # gnome filemanager
  ];

  xdg.configFile = {
    "niri/config.kdl" = {
      source = ./niri.kdl;
    };
  };
}
