{
  pkgs,
  ...
}:

{
  imports = [
    #./ags.nix
    #./lockscreen.nix
    ./lockmod.nix
    ./services.nix
  ];

  #------------------- Programs -------------------#
  home.packages = with pkgs; [
    niri # windows manager
  ];

  # logout menu
  programs.wlogout = {
    enable = true;
  };

  #------------------ configFile ------------------#
  xdg.configFile = {
    "niri/config.kdl" = {
      source = ./niri.kdl;
    };
  };
}
