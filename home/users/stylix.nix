{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/zy/wallhaven-zykdro.png";
      hash = "sha256-Q9cPD3Sv7gE0kajDE0OtSNQzTiyWpbyI3puL6mKbUmQ=";
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
