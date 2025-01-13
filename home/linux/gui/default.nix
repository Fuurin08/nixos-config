{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./gtk.nix
    ./niri
    ./mako
    #./ags.nix
    ./anyrun.nix
  ];

  home.packages = with pkgs; [

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
