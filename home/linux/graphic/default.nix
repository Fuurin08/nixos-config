{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./niri
    #./gtk.nix
    ./gui
  ];

  home.packages = with pkgs; [
    imv

    swaybg

    wl-clipboard

    telegram-desktop

    pavucontrol # 图形化音量控制
    brightnessctl # backlight control
    wluma

  ];
}
