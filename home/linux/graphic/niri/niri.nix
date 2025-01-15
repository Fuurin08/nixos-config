{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    niri # windows manager
  ];

  xdg.configFile = {
    "niri/config.kdl" = {
      source = ./niri.kdl;
    };
  };
}
