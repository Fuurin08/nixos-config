{
  # Fcitx5
  xdg.configFile."fcitx5" = {
    source = ./config;
    recursive = true;
  };

  # Rime
  home.file.".local/share/fcitx5/rime" = {
    source = ./rime;
    recursive = true;
  };
}
