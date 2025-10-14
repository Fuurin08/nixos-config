{
  inputs,
  pkgs,
  ...
}:
let
  theme = "catppuccin-mocha";
  cursor = "bibata-cursors";
  cursor_name = "Bibata-Modern-Classic";
in

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

    polarity = "dark"; # light or dark

    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/zy/wallhaven-zykdro.png";
      hash = "sha256-Q9cPD3Sv7gE0kajDE0OtSNQzTiyWpbyI3puL6mKbUmQ=";
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      light = "Papirus";
      dark = "Papirus";
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };

    cursor = {
      package = pkgs.${cursor};
      name = cursor_name;
      size = 16;
    };

    opacity = {
      applications = 1.0;
      terminal = 0.8;
      desktop = 0.9;
      popups = 0.95;
    };

    targets = {
      qt.enable = true;
      gtk.enable = true;
      waybar = {
        enable = true;
        addCss = false;
      };
      kitty = {
        enable = true;
        variant256Colors = true;
      };

      gnome.enable = true;
      zellij.enable = true;

      fcitx5.enable = false;

      emacs.enable = false;
      helix.enable = false;
      neovim.enable = false;
      kde.enable = false;
    };
  };
}
