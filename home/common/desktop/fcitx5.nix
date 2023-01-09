{ config, lib, pkgs, ... }:
{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx.engines = with pkgs.fcitx-engines; [ rime mozc ];
    #fcitx5.enableRimeData = true;
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
      fcitx5-mozc
    ];
  };
  home.packages = with pkgs; [
    fcitx5-gtk
    fcitx5-lua
    libsForQt5.fcitx5-qt
    fcitx5-configtool
  ];
}
