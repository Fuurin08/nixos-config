{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./niri
    ./gtk.nix
    ./mako.nix
    ./waybar
    ./swaylock
    #./ags
    ./anyrun.nix
  ];

  home.packages = with pkgs; [
    imv

    swaybg

    wl-clipboard-rs

    telegram-desktop

    pavucontrol # 图形化音量控制
    brightnessctl # backlight control
    wluma

  ];

  # programs.dconf = {
  #   enable =true;
  # };
}
