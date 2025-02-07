{ pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
      fcitx5-mozc
      fcitx5-configtool
      fcitx5-gtk
    ];
  };
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
