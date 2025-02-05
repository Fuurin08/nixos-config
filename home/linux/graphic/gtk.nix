{
  pkgs,
  config,
  ...
}:
{
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 14;
    gtk.enable = true;
    x11.enable = true;
  };

  # gtk = {
  #   enable = true;

  #   font = {
  #     name = "Noto Sans";
  #     package = pkgs.noto-fonts;
  #     size = 11;
  #   };

  #   gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };

  #   theme = {
  #     name = "Catppuccin-Macchiato-Compact-Pink-Dark";
  #     package = pkgs.catppuccin-gtk;
  #     # accents = ["pink"];
  #     # size = "compact";
  #     # variant = "macchiato";
  #   };
  # };
}

