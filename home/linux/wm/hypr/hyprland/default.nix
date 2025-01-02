{
  pkgs,
  ...
}:

{
  imports = [
    #./gtk.nix
  ];
  home.packages = with pkgs; [
    swaybg
    waybar
    hyprpaper
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = builtins.readFile ./hyprland.conf;
  };
}