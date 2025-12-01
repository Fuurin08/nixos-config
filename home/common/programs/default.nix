{
  pkgs,
  ...
}:

{
  imports = [
    ./fcitx5
    ./browsers.nix
    ./obs.nix
  ];

  home.packages = with pkgs; [
    zed-editor
    kicad
    vesktop
    krita
    gimp

    kazumi
  ];
}
