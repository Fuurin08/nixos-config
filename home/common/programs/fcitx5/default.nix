{ pkgs, ... }:

{
  home.file = {
    # Theme
    ".local/share/fcitx5/themes/catppuccin-mocha" = {
      source = ./catppuccin-mocha;
      recursive = true;
    };
  };
  xdg.configFile = {
    # home.file.".local/share/fcitx5/themes/catppuccin-mocha".source = ./catppuccin-mocha.conf;
    "fcitx5/profile" = {
      source = ./profile;
      force = true;
    };
    "fcitx5/conf/classicui.conf" = {
      source = ./classicui.conf;
      force = true;
    };
  };
}
