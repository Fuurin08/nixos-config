{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./niri
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
