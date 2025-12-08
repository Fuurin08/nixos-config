{
  pkgs,
  ...
}:

{
  imports = [
    ./fcitx5
    ./browsers
    ./obs.nix
  ];

  home.packages = with pkgs; [
    zed-editor
    kicad
    vesktop
    krita
    gimp
    kdePackages.kdenlive

    kazumi
    wiliwili
  ];
}
