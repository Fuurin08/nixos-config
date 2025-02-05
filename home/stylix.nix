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
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/zy/wallhaven-zykdro.png";
      hash = "sha256-Q9cPD3Sv7gE0kajDE0OtSNQzTiyWpbyI3puL6mKbUmQ=";
    };

    cursor = {
      package = pkgs.${cursor};
      name = cursor_name;
      size = 16;
    };
    opacity.terminal = 0.8;

    targets = {
      qt.enable = true;
      gtk.enable = true;
      waybar.enable = true;

      fcitx5.enable = true;
      emacs.enable = false;
      kde.enable = false;
      neovim.enable = false;
    };
  };
}
