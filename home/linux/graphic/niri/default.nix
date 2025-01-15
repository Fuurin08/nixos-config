{
  ...
}:

{
  imports = [
    #./ags.nix
    ./lockscreen.nix
    ./waybar.nix
    ./swaybg.nix
  ];

  # logout menu
  programs.wlogout = {
    enable = true;
  };
}
