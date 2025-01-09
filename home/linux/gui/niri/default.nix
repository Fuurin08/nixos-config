{
  pkgs,
  ...
}:

{
  imports = [
    ./anyrun.nix
    #./ags.nix
  ];

  #------------------- Programs -------------------#
  home.packages = with pkgs; [
    niri # windows manager

    wl-clipboard-rs

    telegram-desktop

    pavucontrol # 图形化音量控制
    brightnessctl # backlight control
    wluma
  ];

  programs.waybar.enable = true;

  # logout menu
  programs.wlogout = {
    enable = true;
  };

  # lock screen
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  #------------------- Services -------------------#
  # notification daemon for wayland
  services.mako = {
    enable = true;
  };

  # Idle management daemon for wayland
  services.swayidle = {
    enable = true;
  };

  #------------------ configFile ------------------#
  xdg.configFile = {
    "niri/config.kdl" = {
      source = ./conf/niri.kdl;
    };
    "mako/conf" = {
      source = ./conf/mako;
    };
  };
}
