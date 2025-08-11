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
    mpv

    swaybg

    wl-clipboard

    telegram-desktop

    pavucontrol # 图形化音量控制
    brightnessctl # backlight control
    wluma

  ];
}
